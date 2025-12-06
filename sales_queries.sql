-- SQL Query Logic for Retail Sales Portfolio Project (MySQL Dialect)
-- Table used: Sales_Data_Table
USE retail_portfolio;
-- 1. Query: Top 5 Brands by Total Revenue
-- Purpose: To identify primary revenue drivers and allocate budget effectively.
SELECT
    brand,
    SUM(`Total Revenue`) AS Total_Revenue_Generated
FROM
    retail_portfolio.bussiness_cleaned_for_portfolio
GROUP BY
    brand
ORDER BY
    Total_Revenue_Generated DESC
LIMIT 5;


-- 2. Query: Average Price by Season
-- Purpose: To understand seasonal pricing power and inventory strategy.
SELECT
    season,
    AVG(price) AS Average_Price
FROM
    retail_portfolio.bussiness_cleaned_for_portfolio
GROUP BY
    season
ORDER BY
    Average_Price DESC;


-- 3. Query: Top 5 Sections by Revenue without Promotion
-- Purpose: To protect profit margins by identifying high-performing products that do not require discounts.
SELECT
    section,
    SUM(`Total Revenue`) AS Revenue_Without_Promo
FROM
    retail_portfolio.bussiness_cleaned_for_portfolio
WHERE
    Promotion = 'No'
GROUP BY
    section
ORDER BY
    Revenue_Without_Promo DESC
LIMIT 5;