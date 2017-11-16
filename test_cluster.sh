#!/bin/sh
docker exec -it $(docker ps -q --filter name=postgis*) psql -U postgres -c 'table pg_stat_replication' postgres

