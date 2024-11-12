FROM 414700354900.dkr.ecr.us-east-1.amazonaws.com/base/python:3.12.3-slim

ARG AZDO_AZURE_ARTIFACTS_USR
ARG AZDO_AZURE_ARTIFACTS_PWD

RUN apt-get update \
  && apt-get install -y --no-install-recommends swig build-essential curl \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ENV PYTHONDONTWRITEBYTECODE=1 \
  PYTHONUNBUFFERED=1 \
  PYTHONPATH=. \
  POETRY_VIRTUALENVS_CREATE=false \
  POETRY_HTTP_BASIC_BOTICARIOFEED_USERNAME=$AZDO_AZURE_ARTIFACTS_USR \
  POETRY_HTTP_BASIC_BOTICARIOFEED_PASSWORD=$AZDO_AZURE_ARTIFACTS_PWD

COPY poetry.* pyproject.toml ./src ./

RUN pip install poetry --no-cache-dir && poetry install --only main --no-cache

ENV POETRY_HTTP_BASIC_BOTICARIOFEED_USERNAME= \
  POETRY_HTTP_BASIC_BOTICARIOFEED_PASSWORD=

EXPOSE 3000

CMD $DOCKER_CMD