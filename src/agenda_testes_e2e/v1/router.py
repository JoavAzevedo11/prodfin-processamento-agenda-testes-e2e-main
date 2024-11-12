# @scf-region imports
from fastapi import APIRouter

from agenda_testes_e2e.v1.controllers import healthcheck

# @end-scf-region

# @scf-region router
v1 = APIRouter(prefix="/v1", tags=["v1"])
v1.include_router(healthcheck.router)
# @end-scf-region
