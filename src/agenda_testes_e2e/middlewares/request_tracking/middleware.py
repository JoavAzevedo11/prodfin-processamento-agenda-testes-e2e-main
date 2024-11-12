import newrelic.agent
import structlog
from starlette.types import ASGIApp, Receive, Scope, Send

from agenda_testes_e2e.middlewares.request_tracking import context


class RequestTrackingMiddleware:
    """
    This middleware the trace_id and parent_id from NewRelic

    NewRelic will retrieve those values from W3C's "traceparent" header or
    create a trace id when the header is not given.

    All logs using structlog on the request context will be complemented
    with those informations.

    If you need to use them on the request context, you can use the contextvars
    trace_id and parent_id from context module.
    """

    def __init__(self, app: ASGIApp) -> None:
        self.app = app

    async def __call__(
        self, scope: Scope, receive: Receive, send: Send
    ) -> None:
        if scope["type"] == "http":
            self._track_request()

        return await self.app(scope, receive, send)

    def _track_request(self) -> None:
        transaction = newrelic.agent.current_transaction(active_only=True)
        trace_id = None
        parent_id = None

        if transaction:
            trace_id = transaction.trace_id
            parent_id = (
                transaction.parent_span
                if transaction.parent_span != transaction.root_span.guid
                else None
            )

        context.trace_id.set(trace_id)
        context.parent_id.set(parent_id)

        if trace_id:
            structlog.contextvars.bind_contextvars(trace_id=trace_id)

        if parent_id:
            structlog.contextvars.bind_contextvars(parent_id=parent_id)
