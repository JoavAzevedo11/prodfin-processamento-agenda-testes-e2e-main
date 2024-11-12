# @scf-region imports
from pydantic_settings import BaseSettings

# @end-scf-region


class Settings(BaseSettings):
    # @scf-region environment-variables
    PROJECT_NAME: str = "FastApi Boilerplate"
    # @end-scf-region


settings = Settings()
