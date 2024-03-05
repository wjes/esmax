#!/bin/bash

FILE="${1}"

if [ -z "${FILE}" ]; then
	echo "Usage: ${0} <file.sql>"
	exit 1
fi

node excel2sql.mjs "${FILE}"

echo "Loading ${FILE} into tmp_esmax table ..."
docker run -i --network mariadb-network --rm mariadb:10.4 mysql -h stng-mariadb -ustng -pstng123 stng <"${FILE}.sql"

echo "Migrating to esmax table into final tables ..."
docker run -i --network mariadb-network --rm mariadb:10.4 mysql -h stng-mariadb -ustng -pstng123 stng <3_migrate.sql
