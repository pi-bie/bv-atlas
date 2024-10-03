CREATE TABLE xxx_municipalities (id SERIAL, wikidata VARCHAR(64), name VARCHAR(256), coord VARCHAR(512), EWZ INT, PRIMARY KEY (id));
SELECT AddGeometryColumn ('public','xxx_municipalities','point',4269,'POINT',2);

-- COPY xxx_municipalities(wikidata,name,coord,EWZ) FROM 'data/query.csv' DELIMITER ',' CSV HEADER;

\copy xxx_municipalities(wikidata,name,coord,EWZ) FROM 'data/query.csv' DELIMITER ',' CSV HEADER;

UPDATE xxx_municipalities SET point = ST_PointFromText(coord,4269);

CREATE INDEX xxx_municipalities_point_idx
  ON xxx_municipalities
  USING GIST (point);
  
CREATE OR REPLACE VIEW xxx_places AS
	SELECT
		way,
		place,
		COALESCE(planet_osm_point.tags->'name:de',planet_osm_point.name) AS name,
		tags->'wikidata' AS wikidata,
		(CASE
                    WHEN (EWZ IS NOT NULL) THEN EWZ::INTEGER 
                    WHEN (tags->'population' ~ '^[0-9]{1,8}$') THEN (tags->'population')::INTEGER
                    WHEN (place = 'city') THEN 100000
                    WHEN (place = 'town') THEN 1000
                    WHEN (place = 'village') THEN 100
                    ELSE 1
                  END) AS population,
		EWZ,
		ST_INTERSECTS(way, (SELECT ST_UNION(way) FROM planet_osm_polygon
		WHERE boundary='administrative' AND 
		tags->'wikidata' in (SELECT wikidata FROM xxx_municipalities WHERE EWZ >= 20000)) ) AS incity,
		(CASE WHEN (tags->'capital' = 'yes') THEN true ELSE false END) AS capital,
		closest_place_dir(way) AS ldir,
		closest_road_type(way,500) AS hwtype
	FROM planet_osm_point
	LEFT JOIN xxx_municipalities ON planet_osm_point.tags->'wikidata' = xxx_municipalities.wikidata
	WHERE place in ('city','town','village','suburb','quarter')
	ORDER BY population DESC, name;
	
