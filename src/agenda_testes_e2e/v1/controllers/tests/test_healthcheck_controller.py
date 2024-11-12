from http import HTTPStatus


class TestAPIHealthCheck:
    def test_health_check(self, client):
        response = client.get("/v1/healthcheck")
        assert response.status_code == HTTPStatus.OK
