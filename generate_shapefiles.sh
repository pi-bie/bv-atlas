#!/bin/bash

# generate shapefiles from certain landuse db views to reduce database load

echo "using database: $1"

psql -f forests.sql -d $1
psql -f simplified_city_landuses.sql -d $1

ogr2ogr -f "ESRI Shapefile" -lco ENCODING=UTF8 layers/forests/forests.shp PG:"dbname=$1" forests
ogr2ogr -f "ESRI Shapefile" -lco ENCODING=UTF8 layers/populated/populated.shp PG:"dbname=$1" simplified_city_landuses
