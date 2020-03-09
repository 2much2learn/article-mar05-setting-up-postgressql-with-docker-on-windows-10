#!/bin/bash
set -e

POSTGRES="psql --username ${POSTGRES_USER}"

echo "Creating database: ${DB_NAME}"

$POSTGRES <<EOSQL
CREATE DATABASE ${DB_NAME} OWNER ${POSTGRES_USER};
EOSQL

echo "Creating schema..."
psql -d ${DB_NAME} -a -U${POSTGRES_USER} -f /pagila-schema.sql

echo "Populating database initial data"
psql -d ${DB_NAME} -a  -U${POSTGRES_USER} -f /pagila-insert-data.sql

echo "Populating database..."
psql -d ${DB_NAME} -a  -U${POSTGRES_USER} -f /pagila-data.sql