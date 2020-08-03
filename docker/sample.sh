#!/usr/bin/env bash

LIMITS="${LIMITS}"

if [ -f "/database_sample/limits.cfg" ]; then
  for conf in `grep -v \# /database_sample/limits.cfg`; do
    LIMITS="${LIMITS} --limit=\"${conf}\""
  done
fi

./pg_sample $DATABASE_NAME --verbose $LIMITS
