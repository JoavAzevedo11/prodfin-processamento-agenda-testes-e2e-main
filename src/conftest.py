import pytest
from fastapi.testclient import TestClient

from agenda_testes_e2e.main import app


@pytest.fixture
def client():
    return TestClient(app)
