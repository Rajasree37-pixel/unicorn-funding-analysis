-- Add numeric funding column (in millions USD)
ALTER TABLE unicorn_companies
ADD COLUMN total_raised_musd DECIMAL(15,2);

-- Convert text funding like '$7.44B' / '$500M' into numeric (millions USD)
UPDATE unicorn_companies
SET total_raised_musd =
    CASE
        WHEN total_raised LIKE '%B' THEN
            CAST(
                REPLACE(
                    REPLACE(
                        REPLACE(total_raised, '$', ''),
                    ' ', ''),
                'B', '') AS DECIMAL(15,2)
            ) * 1000
        WHEN total_raised LIKE '%M' THEN
            CAST(
                REPLACE(
                    REPLACE(
                        REPLACE(total_raised, '$', ''),
                    ' ', ''),
                'M', '') AS DECIMAL(15,2)
            )
        ELSE NULL
    END;

