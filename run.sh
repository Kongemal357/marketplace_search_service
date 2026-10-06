#!/bin/bash

set -e

uv run python -m bin.consumer &
CONSUMER_PID=$!
trap "kill $CONSUMER_PID 2>/dev/null || true" EXIT

exec uv run python -m bin.api
