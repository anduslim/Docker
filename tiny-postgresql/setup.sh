#!/bin/bash

CONTAINERID=$(docker run -d andus/tinypostgresql)
while ! docker logs $CONTAINERID 2>/dev/null | grep -q ^PG_PASSWORD= ; do sleep 1 ; done
eval $(docker logs $CONTAINERID 2>/dev/null)
PG_PORT=$(docker port $CONTAINERID 5432)
echo "A new PostgreSQL instance is listening on port $PG_PORT. The admin user is postgres, the admin password is $PG_PASSWORD."
