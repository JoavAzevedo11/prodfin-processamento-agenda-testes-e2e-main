from unittest import mock

import pytest
from starlette.applications import Starlette
from starlette.middleware import Middleware
from starlette.requests import Request
from starlette.responses import PlainTextResponse
from starlette.routing import Route
from starlette.testclient import TestClient

from agenda_testes_e2e.middlewares.request_tracking.middleware import (
    RequestTrackingMiddleware,
)

BASE_PATH = "agenda_testes_e2e.middlewares.request_tracking.middleware"


def fake_route(request: Request) -> PlainTextResponse:
    return PlainTextResponse("OK", status_code=200)


@pytest.fixture
def app():
    return Starlette(
        routes=[Route("/", endpoint=fake_route)],
        middleware=[Middleware(RequestTrackingMiddleware)],
    )


@pytest.fixture
def mock_structlog():
    with mock.patch(f"{BASE_PATH}.structlog") as mock_structlog:
        yield mock_structlog


@pytest.fixture
def mock_trace_id_contextvar():
    with mock.patch(
        f"{BASE_PATH}.context.trace_id"
    ) as mock_trace_id_contextvar:
        yield mock_trace_id_contextvar


@pytest.fixture
def mock_newrelic_transaction():
    with mock.patch("newrelic.agent") as mock_newrelic:
        yield mock_newrelic.current_transaction.return_value


@pytest.fixture
def mock_parent_id_contextvar():
    with mock.patch(
        f"{BASE_PATH}.context.parent_id"
    ) as mock_parent_id_contextvar:
        yield mock_parent_id_contextvar


def test_should_get_only_trace_id_from_newrelic_when_span_is_root(
    app,
    mock_structlog,
    mock_trace_id_contextvar,
    mock_parent_id_contextvar,
    mock_newrelic_transaction,
):
    mock_newrelic_transaction.parent_span = "fake root span"
    mock_newrelic_transaction.root_span.guid = "fake root span"

    client = TestClient(app, base_url="https://testserver")

    response = client.get("/")

    assert response.status_code == 200
    assert response.text == "OK"

    assert mock_trace_id_contextvar.set.call_args_list == [
        mock.call(mock_newrelic_transaction.trace_id)
    ]

    assert mock_parent_id_contextvar.set.call_args_list == [mock.call(None)]

    assert mock_structlog.contextvars.bind_contextvars.call_args_list == [
        mock.call(
            trace_id=mock_newrelic_transaction.trace_id,
        )
    ]


def test_should_get_parent_id_from_newrelic_when_span_is_not_root(
    mock_structlog,
    mock_trace_id_contextvar,
    mock_parent_id_contextvar,
    mock_newrelic_transaction,
):
    mock_newrelic_transaction.parent_span = "fake *not* root span"
    mock_newrelic_transaction.root_span.guid = "fake root span"

    app = Starlette(
        routes=[Route("/", endpoint=fake_route)],
        middleware=[Middleware(RequestTrackingMiddleware)],
    )

    client = TestClient(app, base_url="https://testserver")

    response = client.get("/")

    assert response.status_code == 200
    assert response.text == "OK"

    assert mock_trace_id_contextvar.set.call_args_list == [
        mock.call(mock_newrelic_transaction.trace_id)
    ]

    assert mock_parent_id_contextvar.set.call_args_list == [
        mock.call(mock_newrelic_transaction.parent_span)
    ]

    assert mock_structlog.contextvars.bind_contextvars.call_args_list == [
        mock.call(
            trace_id=mock_newrelic_transaction.trace_id,
        ),
        mock.call(
            parent_id=mock_newrelic_transaction.parent_span,
        ),
    ]
