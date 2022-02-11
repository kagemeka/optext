from __future__ import annotations

import typing

T = typing.TypeVar("T")


class IsNoneError(AssertionError):
    ...


def unwrap(item: T | None) -> T:
    """.

    Raises:
        IsNoneError: if item is None, raise.
    """
    if item is None:
        raise IsNoneError("Item is None")
    return item


def unwrap_or(item: T | None, default: T) -> T:
    return default if item is None else item


def unwrap_or_else(item: T | None, default_func: typing.Callable[[], T]) -> T:
    return default_func() if item is None else item
