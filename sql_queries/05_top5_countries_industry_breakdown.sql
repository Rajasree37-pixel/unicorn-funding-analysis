-- CTE to get top 5 countries by funding
WITH top_countries AS (
    SELECT
        country,
        SUM(total_raised_musd) AS total_raised_musd_sum
    FROM unicorn_companies
    GROUP BY country
    ORDER BY total_raised_musd_sum DESC
    LIMIT 5
)

-- Country–industry breakdown for those top 5 countries
SELECT
    u.country,
    u.industry,
    COUNT(*)               AS num_unicorns,
    SUM(u.total_raised_musd) AS total_raised_musd_sum
FROM unicorn_companies u
JOIN top_countries t
  ON u.country = t.country
GROUP BY u.country, u.industry
ORDER BY
    t.total_raised_musd_sum DESC,
    u.country,
    total_raised_musd_sum DESC;
