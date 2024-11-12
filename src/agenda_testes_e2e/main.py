# @scf-region imports

from contextlib import asynccontextmanager

import structlog
from fastapi import FastAPI

from agenda_testes_e2e.middlewares.request_tracking.middleware import (
    RequestTrackingMiddleware,
)
from agenda_testes_e2e.settings import settings
from agenda_testes_e2e.shutdown import do_shutdown
from agenda_testes_e2e.v1.router import v1
from logger import configure_logger

# @end-scf-region

# @scf-region source-framework-settings

logger = structlog.get_logger(__name__)


@asynccontextmanager
async def lifespan(application: FastAPI):
    try:
        yield
    finally:
        do_shutdown()


# @end-scf-region

# @scf-region main-source-code


def get_application() -> FastAPI:
    configure_logger()

    application = FastAPI(title=settings.PROJECT_NAME, lifespan=lifespan)
    application.add_middleware(RequestTrackingMiddleware)
    application.include_router(v1)

    logger.info("Application created")

    return application


app = get_application()
# @end-scf-region
