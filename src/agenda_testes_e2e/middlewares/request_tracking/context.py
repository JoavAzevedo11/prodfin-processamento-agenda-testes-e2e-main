from contextvars import ContextVar

trace_id: ContextVar[str | None] = ContextVar("trace_id", default=None)
parent_id: ContextVar[str | None] = ContextVar("parent_id", default=None)
