-- Top 5 countries by total funding (millions USD)
SELECT
    country,
    COUNT(*)                AS num_unicorns,
    SUM(total_raised_musd)  AS total_raised_musd_sum,
    AVG(total_raised_musd)  AS avg_raised_musd
FROM unicorn_companies
GROUP BY country
ORDER BY total_raised_musd_sum DESC
LIMIT 5;
