SELECT c2010.geo_name AS county2010,
       c2010.state_us_abbreviation AS state2010,
	   c2000.geo_name AS county2000,
       c2000.state_us_abbreviation AS state2000
FROM us_counties_2010 c2010 FULL OUTER JOIN us_counties_2000 c2000
	ON c2010.state_us_abbreviation = c2000.state_us_abbreviation
	WHERE c2010.geo_name IS Null OR c2000.geo_name IS Null
ORDER BY c2010.state_us_abbreviation ASC, c2000.state_us_abbreviation ASC, c2010.geo_name, c2000.geo_name ASC