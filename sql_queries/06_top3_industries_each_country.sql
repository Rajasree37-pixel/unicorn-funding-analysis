-- Top 3 industries in each country by total funding
WITH country_industries AS (
    SELECT
        country,
        industry,
        COUNT(*)               AS num_unicorns,
        SUM(total_raised_musd) AS total_raised_musd_sum
    FROM unicorn_companies
    GROUP BY country, industry
),
ranked AS (
    SELECT
        country,
        industry,
        num_unicorns,
        total_raised_musd_sum,
        ROW_NUMBER() OVER (
            PARTITION BY country
            ORDER BY total_raised_musd_sum DESC
        ) AS rn
    FROM country_industries
)
SELECT
    country,
    industry,
    num_unicorns,
    total_raised_musd_sum
FROM ranked
WHERE rn <= 3
ORDER BY country, total_raised_musd_sum DESC;
