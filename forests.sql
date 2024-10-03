CREATE OR REPLACE VIEW forests AS
	SELECT ST_ConcaveHull(way,0.98) as way from planet_osm_polygon 
		WHERE landuse='forest' OR "natural"='wood'
		AND way_area > 10000;
		
#(select ST_ConcaveHull(way,0.98) as way from planet_osm_polygon where landuse in ('forest') AND way_area > 1*!pixel_width!::real*!pixel_height!::real) as polygons
