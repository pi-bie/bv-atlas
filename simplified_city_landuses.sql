CREATE TABLE simplified_city_landuses AS
SELECT
	ST_Simplify(ST_Buffer(ST_Union(poly.way),25,'quad_segs=4'),50) as way,
	mode() WITHIN GROUP (ORDER BY muni.name) AS name--,
--	STRING_AGG((CASE
--		WHEN (poly.landuse in ('residential')) THEN 'residential'::text
--		WHEN (poly.landuse in ('education','institutional')) THEN 'public'::text
--		WHEN (poly.landuse in ('commercial', 'retail','industrial')) THEN 'gewerbe'::text 
--		ELSE poly.landuse
--	END)) AS landuses
FROM
	planet_osm_polygon AS poly,
	planet_osm_polygon AS bound,
	xxx_municipalities AS muni
WHERE
	bound.tags->'wikidata' = muni.wikidata
	AND muni.EWZ >= 20000
	AND ST_INTERSECTS(poly.way, bound.way)
	AND poly.landuse in ('residential','education','institutional','commercial', 'retail','industrial','brownfield','construction')
GROUP BY muni.wikidata;

CREATE INDEX simplified_city_landuses_way_idx
  ON simplified_city_landuses
  USING GIST (way);
  
-- ogr2ogr -f "ESRI Shapefile" -lco ENCODING=UTF8 layers/populated/populated.shp PG:"dbname=gis" simplified_city_landuses

CREATE TABLE simplified_city_landuses2 AS
SELECT
	ST_Simplify(ST_Buffer(ST_Union(poly.way),25,'quad_segs=4'),50) AS way,
	muni.wikidata AS wikidata
FROM
	planet_osm_polygon AS poly,
	xxx_municipalities AS muni
WHERE
	wikidata_contain_municip(ST_Centroid(poly.way)) = muni.wikidata
	AND muni.EWZ >= 20000
	AND poly.landuse in ('residential','education','institutional','commercial', 'retail','industrial','brownfield','construction')
GROUP BY muni.wikidata;
