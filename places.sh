#!/bin/bash

echo "using database: $1"

# download list of urban municipalities in Germany

#wget 
# remove URL part of wikidata 
sed -i -e 's~http://www.wikidata.org/entity/~~g' data/urban.csv
sed -i -e 's~http://www.wikidata.org/entity/~~g' data/non-urban.csv

psql -f municipalities.sql -d $1

ogr2ogr -f "ESRI Shapefile" -lco ENCODING=UTF8 layers/places/places.shp PG:"dbname=$1" xxx_places
