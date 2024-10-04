create or replace function poi_ldir(geometry)
    returns double precision as
$$
    select degrees(st_azimuth(st_closestpoint(way, $1),$1)) as angle
    from planet_osm_line
    where way && st_expand($1, 1000)
        and highway in ('motorway', 'trunk', 'primary', 'secondary', 'tertiary')
    order by st_distance(way, $1) asc
    limit 1
$$
language 'sql'
stable;

create or replace function mwy_ldir(geometry)
    returns double precision as
$$
    select ST_Azimuth(ST_Centroid($1),ST_ClosestPoint(way, ST_Centroid($1))) as angle
    from planet_osm_line
    where way && ST_Expand($1, 500)
        and highway in ('motorway','trunk')
    order by ST_Distance(ST_Centroid(way), ST_Centroid($1)) asc
    limit 1
$$
language 'sql'
stable;

create or replace function mwy_dist(geometry)
    returns double precision as
$$
    select ST_Distance(way, $1) AS distance
    from planet_osm_line
    where way && ST_Expand($1, 500)
        and highway in ('motorway','trunk')
    order by ST_Distance(way, $1) asc
    limit 1
$$
language 'sql'
stable;

create or replace function closest_road_type(geometry,integer)
    returns text as
$$
    SELECT (CASE
    WHEN (highway IN ('trunk','primary')) THEN 'primary'
    ELSE highway
    END) AS highway FROM PLANET_OSM_LINE
    WHERE way && st_expand($1, $2)
      AND highway in ('motorway', 'trunk', 'primary', 'secondary', 'tertiary')
    ORDER BY highway ASC
    LIMIT 1
$$
language 'sql'
stable;

create or replace function wikidata_contain_municip(geometry)
    returns text as
$$
    SELECT tags->'wikidata' as wikidata from planet_osm_polygon
    WHERE ST_COVERS(way, $1)
      AND boundary='administrative'
      AND (admin_level in ('6','8') OR tags->'admin_title'='independent town')
    ORDER BY admin_level DESC
    LIMIT 1
$$
language 'sql'
stable;

create or replace function longest_ridge_within(geometry)
    returns geometry as
$$
    SELECT way from planet_osm_line
    WHERE way && $1
      AND "natural" = 'ridge'
      AND ST_Within(way, $1)
    ORDER BY ST_Length(way) DESC
    LIMIT 1
$$
language 'sql'
stable;

create or replace function closest_rail(geometry)
    returns geometry as
$$
SELECT way FROM planet_osm_line WHERE way && st_expand($1, 25)
        and railway is not null
    order by ST_Distance(way, $1) asc
    limit 1
$$
language 'sql'
stable;


create or replace function closest_2_pts_rail(geometry)
	returns geometry[] as
$$
SELECT ARRAY (SELECT geom FROM ST_DumpPoints(closest_rail($1)) ORDER BY ST_Distance($1,geom) ASC LIMIT 2)
$$
language 'sql'
stable;

create or replace function closest_rail_segment(geometry)
	returns geometry as
$$
SELECT ST_MakeLine(closest_2_pts_rail($1))
$$
language 'sql'
stable;

create or replace function station_ldir(geometry)
    returns double precision as
$$
    select degrees(ST_Azimuth(ST_StartPoint(closest_rail_segment($1)),ST_EndPoint(closest_rail_segment($1)))) as angle
$$
language 'sql'
stable;

create or replace function exit_ref(geometry)
    returns text as
$$
    select ref as ref
    from planet_osm_line
    where way && st_expand($1, 10)
        and highway in ('motorway', 'trunk')
        and ref is not null
    order by st_distance(way, $1) asc
    limit 1
$$
language 'sql'
stable;

create or replace function closest_place_dir(geometry)
    returns double precision as
$$
    select degrees(st_azimuth(way, $1)) as angle
    from planet_osm_point
    where way && st_expand($1, 10000)
    	and NOT(way && st_expand($1, 500))
        and place in ('city', 'town', 'village', 'suburb', 'quarter')
    order by st_distance(way, $1) asc
    limit 1
$$
language 'sql'
stable;

create or replace function closest_place(geometry, name)
    returns text as
$$
    select name
    from planet_osm_point
    where way && st_expand($1, 10000)
    	and not(way && st_expand($1, 500))
        and place in ('city', 'town', 'village', 'suburb', 'quarter')
        and name != $2
    order by st_distance(way, $1) asc
    limit 1
$$
language 'sql'
stable;
