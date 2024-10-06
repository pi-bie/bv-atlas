CREATE TABLE xxx_municipalities (id SERIAL, wikidata VARCHAR(64), name VARCHAR(256), class VARCHAR(16), coord VARCHAR(512), EWZ INT, PRIMARY KEY (id));
SELECT AddGeometryColumn ('public','xxx_municipalities','point',4326,'POINT',2);

-- COPY xxx_municipalities(wikidata,name,coord,EWZ) FROM 'data/urban.csv' DELIMITER ',' CSV HEADER;

\copy xxx_municipalities(wikidata,name,coord,EWZ) FROM 'data/urban.csv' DELIMITER ',' CSV HEADER;
UPDATE xxx_municipalities SET class = 'urban';

\copy xxx_municipalities(wikidata,name,coord,EWZ) FROM 'data/non-urban.csv' DELIMITER ',' CSV HEADER;
UPDATE xxx_municipalities SET class = 'non-urban' WHERE class IS null;

UPDATE xxx_municipalities SET point = ST_PointFromText(coord,4326);

CREATE INDEX xxx_municipalities_point_idx
  ON xxx_municipalities
  USING GIST (point);

CREATE TABLE xxx_places (id serial, osm_id bigint, way geometry(POINT,3857), place text, prank INT, name text, wikidata VARCHAR(64), population INT, isolation double precision, incity boolean, aslabel INT, capital boolean, ldir double precision, hwtype VARCHAR(32), PRIMARY KEY (id));
INSERT INTO xxx_places(way,osm_id,place,name,wikidata,population,isolation,prank,incity,aslabel,capital,ldir,hwtype)
	SELECT
		way,
		osm_id,
		place,
		COALESCE(pt.tags->'name:de',pt.name) AS name,
		tags->'wikidata' AS wikidata,
		(CASE
                  WHEN (EWZ IS NOT NULL) THEN EWZ::INTEGER
                  WHEN (tags->'population' ~ '^[0-9]{1,8}$') THEN (tags->'population')::INTEGER
                  WHEN (place = 'city') THEN 100000
                  WHEN (place = 'town') THEN 1000
                  WHEN (place = 'village') THEN 100
                  ELSE 1
                END) AS population,
		(CASE
		  WHEN (pt.place in ('suburb','quarter')) THEN null
		  ELSE (SELECT ST_Distance(pt.way,ST_Transform(point,3857))/1000 AS distance FROM xxx_municipalities WHERE EWZ > wd.EWZ ORDER BY distance LIMIT 1) END) AS isolation,
		(CASE
		     WHEN (place='city') THEN 1
		     WHEN (place='town') THEN 2
		     WHEN (place='village') THEN 3
		     WHEN (place='suburb') THEN 3
		     WHEN (place='quarter') THEN 4
		 END) AS prank,
		ST_INTERSECTS(way, (SELECT ST_UNION(way) FROM planet_osm_polygon WHERE boundary='administrative' AND tags->'wikidata' in (SELECT wikidata FROM xxx_municipalities WHERE EWZ >= 20000)) ) AS incity,
		(CASE WHEN (place = 'suburb') THEN (SELECT COUNT(*) from planet_osm_rels where osm_id=ANY(parts) AND 'label'=ANY(members) AND 'admin_level'=ANY(tags)) END) AS aslabel,
		(CASE WHEN (tags->'capital' = 'yes') THEN true ELSE false END) AS capital,
		(CASE WHEN place in ('suburb','village') THEN closest_place_dir(way,ARRAY['suburb','village'])
		 ELSE closest_place_dir(way,ARRAY['place']) END) AS ldir,
		closest_road_type(way,500) AS hwtype
	FROM planet_osm_point pt
	LEFT JOIN xxx_municipalities wd ON pt.tags->'wikidata' = wd.wikidata
	WHERE place in ('city','town','village','suburb','quarter')
	ORDER BY prank,isolation DESC, population DESC,aslabel DESC;

CREATE INDEX xxx_places_way_idx ON xxx_places USING GIST (way);
CREATE INDEX xxx_places_osm_id_idx ON xxx_places USING btree(osm_id);

UPDATE xxx_places SET wikidata = (SELECT tags::hstore->'wikidata' from planet_osm_rels WHERE osm_id = ANY(parts) AND tags::hstore->'wikidata' IS NOT null LIMIT 1) WHERE wikidata IS null;

--SELECT (SELECT way FROM xxx_places new WHERE ST_CoveredBy(new.way,(SELECT way from planet_osm_polygon WHERE osm_id=-1*(SELECT id FROM planet_osm_rels WHERE (tags::hstore->'admin_level' in ('6','7','8','9')) AND old.osm_id = ANY(parts) ORDER BY tags::hstore->'admin_level' LIMIT 1))) AND new.prank > old.prank AND new.name = old.name ORDER BY prank,isolation LIMIT 1) FROM xxx_places old WHERE place in ('town');

UPDATE xxx_places old SET way = COALESCE((SELECT way FROM xxx_places new WHERE ST_CoveredBy(new.way,(SELECT way from planet_osm_polygon WHERE osm_id=-1*(SELECT id FROM planet_osm_rels WHERE (tags::hstore->'admin_level' in ('6','7','8','9')) AND old.osm_id = ANY(parts) ORDER BY tags::hstore->'admin_level' LIMIT 1))) AND new.prank > old.prank AND new.name = old.name ORDER BY prank,isolation LIMIT 1),way) WHERE place in ('town');

UPDATE xxx_places sub SET isolation = (SELECT ST_Distance(sub.way,obj.way)/1000 AS distance FROM xxx_places obj WHERE obj.population > sub.population ORDER BY distance LIMIT 1) WHERE place NOT IN ('suburb','quarter') AND isolation IS null;
	
