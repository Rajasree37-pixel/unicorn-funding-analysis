# Unicorn Funding Analysis Report

## 1. Objective

This project analyzes a global dataset of unicorn startups to understand **which countries and industries attract the most total funding** and how capital is distributed across the top ecosystems.

## 2. Dataset

- **Source:** Kaggle – Unicorn Companies dataset (private companies valued at over $1B as of around March 2022).[web:181][web:182]
- **File used:** `data/unicorn_companies.csv`.
- **Records:** 1,037 unicorn companies after basic cleaning (removing header-like rows and blanks).
- **Key fields:**
  - `company`, `industry`, `country`, `city`
  - `year_founded`, `year_joined` (year became a unicorn)
  - `total_raised`, `valuation`
- **Time period covered:** Companies founded between 2007 and 2022 and joining the unicorn club between 2007 and 2022 (from `year_founded` and `year_joined` columns in SQL/Excel).

## 3. Methodology

1. **Loading & Cleaning**
   - Imported `unicorn_companies.csv` into MySQL as `unicorn_companies`.
   - Removed the extra header row that appeared as a data record.
   - Created a numeric funding column `total_raised_musd` by converting text amounts like `"$7.44B"` and `"$500M"` into **millions of USD** using a CASE + REPLACE SQL update.

2. **Exploratory Checks**
   - Counted total unicorns, distinct countries, and min/max `year_joined` to understand dataset coverage.
   - Verified that the numeric funding column had no obvious outliers or missing conversions.

3. **Country‑level Analysis**
   - Aggregated by `country` to compute:
     - number of unicorns
     - total funding (`SUM(total_raised_musd)`)
     - average funding per unicorn (`AVG(total_raised_musd)`).
   - Ranked countries by total funding and selected the **top 5** for deeper analysis.

4. **Industry‑level Analysis**
   - For the top 5 countries, grouped by `industry` to calculate unicorn counts and total funding.
   - Identified **top industries within each country** using SQL and confirmed with Excel pivot tables.

5. **Visualization**
   - Exported summary tables to `analysis/project_analysis.xlsx`.
   - Built pivot tables and charts, including:
     - bar chart of top 5 countries by total funding
     - clustered bar chart of top industries in the top 5 countries.
   - Saved key charts into `analysis/visualizations/`.

## 4. Key Findings

### 4.1 Top Countries by Unicorn Funding

Using total capital raised (in millions USD), the **top 5 countries** are:

- **United States**
- **China**
- **India**
- **United Kingdom**
- **Germany**

Together, the United States and China account for **about 66% of total unicorn funding** in the dataset, showing a strong concentration of capital in just two ecosystems.[web:185][web:188][web:193]

The United States leads by number of unicorns, while China has very high average funding per unicorn, reflecting a smaller but extremely capital‑intensive set of companies.

### 4.2 Industries Within Top Countries

Across the top 5 countries, several industries consistently attract large amounts of funding:

- **Fintech** and **Internet software & services** are among the top funded industries in the United States, India, and the United Kingdom.
- **E‑commerce & direct‑to‑consumer** and **AI‑related sectors** are especially strong in China and the United States.
- Germany’s unicorn funding is more focused on **e‑commerce**, **fintech**, and **enterprise/Internet software**.

This pattern indicates that **consumer technology and financial innovation dominate unicorn funding globally**, with AI and software infrastructure forming the next wave of high‑growth areas.

### 4.3 Top 3 Industries per Country (Top 5 Countries)

Within each of the five leading countries, the three industries with the highest total funding are:

- **United States:** typically led by Internet software & services, fintech, and health/biotech.
- **China:** strong presence in AI, e‑commerce & direct‑to‑consumer, and hardware/auto & transportation.
- **India:** dominated by e‑commerce & direct‑to‑consumer, fintech, and Internet software & services.
- **United Kingdom:** concentrated in fintech and AI, with “other” software categories also present.
- **Germany:** focused on e‑commerce & direct‑to‑consumer, fintech, and Internet software & services.

(Exact rankings are taken from the SQL “top 3 industries per country” query and the Excel pivot table of country–industry counts.)

## 5. Visuals

- `analysis/project_analysis.xlsx`  
  - Pivot tables for:
    - top 5 countries by funding
    - industry breakdown within top countries.
- `analysis/visualizations/top_industries_chart.png`  
  - Bar chart: Top unicorn industries by funding in the top 5 countries.

These artefacts make it easy to visually compare how funding is distributed geographically and by sector.

## 6. Limitations

- The dataset only includes **unicorns** (startups valued at $1B+), so it does not represent the full startup ecosystem and suffers from survivorship bias.[web:181][web:182]
- Funding amounts are total capital raised and do not distinguish between early and late rounds or account for changes after the snapshot date.
- Company headquarters country may not reflect where most customers or investors are located.
- Data quality issues (missing or inconsistent values) may still exist despite basic cleaning.

## 7. Future Work

- Compare unicorn counts and funding **relative to GDP or population** to measure ecosystem efficiency.
- Analyze **trends over time**, such as which years saw spikes in new unicorns by industry or country.
- Incorporate **valuation** data to see whether higher funding actually correlates with higher company valuations.
- Extend the analysis to include **investor information** (VCs, corporate investors) if available.


