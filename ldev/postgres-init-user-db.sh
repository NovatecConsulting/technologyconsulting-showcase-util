#!/bin/bash

# setup basic TC-Showcase database for local development
# should be replaced with Flyway in each application

set -e

DATABASES='order manufacture supplier'

for i in $DATABASES; do
    psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
        CREATE USER "${i}_user" WITH PASSWORD '${i}_pass';
        CREATE DATABASE "${i}_db";
        GRANT ALL PRIVILEGES ON DATABASE "${i}_db" TO "${i}_user";
EOSQL
done