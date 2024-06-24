#!/bin/sh
set -e

host="$1"
shift
cmd="$@"

until pg_isready -h "$host" -U "$POSTGRES_USER"; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
  # print host and user
  >&2 echo "Host: $host"
  >&2 echo "User: $POSTGRES_USER"
done

>&2 echo "Postgres is up - executing command"
exec $cmd
