#!/bin/bash

# apply tweaks to database: add functions and indexes

echo "using database: $1"

psql -f gis_functions.sql -d $1

psql -f indexes2.sql -d $1

