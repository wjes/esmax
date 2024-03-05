#!/bin/bash

docker run -i --network mariadb-network --rm mariadb:10.4 mysql -h stng-mariadb -ustng -pstng123 stng <1_schema.sql
docker run -i --network mariadb-network --rm mariadb:10.4 mysql -h stng-mariadb -ustng -pstng123 stng <2_populate.sql
