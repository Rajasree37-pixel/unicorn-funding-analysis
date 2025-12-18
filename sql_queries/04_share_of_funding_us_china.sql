-- Total global funding
SELECT SUM(total_raised_musd) AS total_global_funding_musd
FROM unicorn_companies;

-- Funding from United States + China
SELECT SUM(total_raised_musd) AS total_us_china_funding_musd
FROM unicorn_companies
WHERE country IN ('United States', 'China');

-- used these two values to calculate in Excel to get a 65.9%.
