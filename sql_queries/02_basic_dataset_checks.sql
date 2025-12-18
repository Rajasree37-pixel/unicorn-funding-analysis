-- Total number of unicorns (rows)
SELECT COUNT(*) AS total_unicorns
FROM unicorn_companies;

-- Time period covered: earliest and latest unicorn year
SELECT
    MIN(year_joined) AS earliest_year_joined,
    MAX(year_joined) AS latest_year_joined
FROM unicorn_companies;

-- Number of unique countries
SELECT COUNT(DISTINCT country) AS num_countries
FROM unicorn_companies;
