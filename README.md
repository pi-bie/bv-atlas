# B.V.-Map

This is an [OpenStreetMap](https://www.openstreetmap.org) map style, created as [CartoCSS](https://github.com/mapbox/carto) map stylesheets and converted to a [Mapnik](https://mapnik.org/) XML using the [carto command](https://cartocss.readthedocs.io/en/latest/installation_usage.html#usage-from-the-command-line).

Its design is inspired by printed German road atlantes (ie _Reise-_ or _Straßenatlas_) from the late 1990s -- early 2010s, especially favouring the [blue diamond gas station variety](http://petrolmaps.co.uk/aral-atl.htm) last published afaik ca 2013 by Busche.

The implementation is inspired and based on [OpenStreetMap Carto](https://github.com/gravitystorm/openstreetmap-carto) and [OpenStreetMap Carto German](https://github.com/giggls/openstreetmap-carto-de).
It was mostly created using [TileMill](https://github.com/tilemill-project/tilemill).

It is available in zoom levels 7--12, with a change from a Europe-scale to a Germany-scale detail level happening at zoom level 10.
Since the main idea behind the project is to use it to print an actual road map, eg using [Open City Street Map](https://github.com/hholzgra/ocitysmap/) or [OSM-Atlas](https://github.com/openstreetmap/svn-archive/tree/main/applications/rendering/osm-atlas), it may not provide the features usually available from slippy maps.

## PostGIS database requirements and external data

The mapstyle can be used with a database as set up for openstreetmap-carto, but requires some tweaks (some additional views, functions and indexes).
Additionally, some data must be downloaded from [Wikidata](https://www.wikidata.org/).

This is achieved by running

    ./apply-db-tweaks.sh gis
    ./places.sh gis
    ./generate_shapefiles.sh gis

### Custom indexes

The custom indexes are contained in ``indexes2.sql``.

### Custom functions

The custom functions are defined in ``postgis_functions.sql``.

### External wikidata

We download population data for German municipalities from wikidata, store them in the table `xxx_municipalities`. This information is then used to create a view `xxx_places` as well as polygons for densely populated city areas (>30000 inhabitants) in `simplified_city_landuses`.

### shapefile exports

To reduce some repeated queries to the database, landuse polygons and places are exported from the database to shapefiles.
The relevant views are created via ``forests.sql`` and ``simplified_city_landuses.sql`` as well as ``municipalities.sql``.

## ToDo

 * fix the shield and dash issues for proposed motorways
 * find a better way to deal with regions, forests and mountain ranges
 * possibly add prominent peaks
 * add more shields from neighbouring countries
 * improve the database queries for efficiency
 * possibly tweak the database by adding further columns to certain tables to use less hstore columns

