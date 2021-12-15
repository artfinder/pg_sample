#!/usr/bin/env bash

LIMITS=".* = 150"

if [ -f "/database_sample/limits.cfg" ]; then
  arr=()
  for conf in `grep -v \# /database_sample/limits.cfg`; do
    IFS='='
    read -a IN_arr <<< "${conf}"
    arr+=("${IN_arr[0]} = ${IN_arr[1]}")
  done
  IFS=','
  LIMITS="${arr[*]}"
fi

./pg_sample $DATABASE_NAME --verbose --limit="${LIMITS}"
