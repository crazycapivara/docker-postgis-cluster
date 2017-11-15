#!/bin/bash
MASTER_SERVICE_NAME="postgis-master"

docker service create \
--publish "5432:5432" \
--mount type=volume,src=$MASTER_SERVICE_NAME-volume,dst=/pgdata,volume-driver=local \
--name $MASTER_SERVICE_NAME \
--network futuregis \
--constraint 'node.labels.type == master' \
--env PGHOST=/tmp \
--env PG_USER=testuser \
--env PG_MODE=master \
--env PG_MASTER_USER=master \
--env PG_ROOT_PASSWORD=password \
--env PG_PASSWORD=password \
--env PG_DATABASE=userdb \
--env PG_MASTER_PORT=5432 \
--env PG_MASTER_PASSWORD=password \
crunchydata/crunchy-postgres-gis:centos7-10.0-1.6.0
