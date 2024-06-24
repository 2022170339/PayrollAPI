#!/bin/sh
set -e

host="localhost"
postgres_user="postgres"
shift
cmd="$@"

until pg_isready -h "$host" -U "$postgres_user"; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
  # print host and user
  >&2 echo "Host: $host"
  >&2 echo "User: $postgres_user"
done

>&2 echo "Postgres is up - executing command"
exec $cmd
