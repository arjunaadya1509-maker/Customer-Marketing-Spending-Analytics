LOAD DATA LOCAL INFILE
'C:/Users/Dell5420/OneDrive/Desktop/SaaS_GTM_Customer_Analytics/data/processed/marketing_data_cleaned.csv'
INTO TABLE saas_gtm_analytics.marketing_data_cleaned
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SELECT COUNT(*) AS total_rows
FROM saas_gtm_analytics.marketing_data_cleaned;

SELECT
    SUM(MntWines) AS Wine_Spending,
    SUM(MntMeatProducts) AS Meat_Spending,
    SUM(MntGoldProds) AS Gold_Spending,
    SUM(MntFishProducts) AS Fish_Spending,
    SUM(MntSweetProducts) AS Sweets_Spending,
    SUM(MntFruits) AS Fruit_Spending
FROM saas_gtm_analytics.marketing_data_cleaned;

SELECT
    Education,
    COUNT(ID) AS Customer_Count,
    SUM(
        MntWines + MntFruits + MntMeatProducts +
        MntFishProducts + MntSweetProducts + MntGoldProds
    ) AS Total_Spending,
    ROUND(
        AVG(
            MntWines + MntFruits + MntMeatProducts +
            MntFishProducts + MntSweetProducts + MntGoldProds
        ), 2
    ) AS Average_Spending
FROM saas_gtm_analytics.marketing_data_cleaned
GROUP BY Education
ORDER BY Average_Spending DESC;

SELECT
    Marital_Status,
    COUNT(ID) AS Customer_Count,
    ROUND(
        AVG(
            COALESCE(MntWines, 0) +
            COALESCE(MntFruits, 0) +
            COALESCE(MntMeatProducts, 0) +
            COALESCE(MntFishProducts, 0) +
            COALESCE(MntSweetProducts, 0) +
            COALESCE(MntGoldProds, 0)
        ), 2
    ) AS Average_Spending
FROM saas_gtm_analytics.marketing_data_cleaned
GROUP BY Marital_Status
ORDER BY Average_Spending DESC;

SELECT
    ID,
    Education,
    Marital_Status,
    (MntWines + MntFruits + MntMeatProducts +
    MntFishProducts + MntSweetProducts + MntGoldProds)
        AS Total_Spending
FROM saas_gtm_analytics.marketing_data_cleaned
ORDER BY Total_Spending DESC
LIMIT 10;

SELECT
    CASE
        WHEN Total_Spending >= 1000 THEN 'High'
        WHEN Total_Spending >= 500 THEN 'Medium'
        ELSE 'Low'
    END AS Spending_Segment,
    COUNT(*) AS Customer_Count,
    ROUND(AVG(Total_Spending), 2) AS Average_Spending
FROM (
    SELECT
        ID,
        COALESCE(MntWines, 0) +
        COALESCE(MntFruits, 0) +
        COALESCE(MntMeatProducts, 0) +
        COALESCE(MntFishProducts, 0) +
        COALESCE(MntSweetProducts, 0) +
        COALESCE(MntGoldProds, 0) AS Total_Spending
    FROM saas_gtm_analytics.marketing_data_cleaned
) AS customer_spending
GROUP BY Spending_Segment
ORDER BY Average_Spending DESC;

SELECT
    'Campaign 1' AS Campaign,
    SUM(AcceptedCmp1) AS Accepted_Customers,
    COUNT(*) AS Total_Customers,
    ROUND(100.0 * SUM(AcceptedCmp1) / COUNT(*), 2)
        AS Acceptance_Rate
FROM saas_gtm_analytics.marketing_data_cleaned

UNION ALL

SELECT
    'Campaign 2',
    SUM(AcceptedCmp2),
    COUNT(*),
    ROUND(100.0 * SUM(AcceptedCmp2) / COUNT(*), 2)
FROM saas_gtm_analytics.marketing_data_cleaned

UNION ALL

SELECT
    'Campaign 3',
    SUM(AcceptedCmp3),
    COUNT(*),
    ROUND(100.0 * SUM(AcceptedCmp3) / COUNT(*), 2)
FROM saas_gtm_analytics.marketing_data_cleaned

UNION ALL

SELECT
    'Campaign 4',
    SUM(AcceptedCmp4),
    COUNT(*),
    ROUND(100.0 * SUM(AcceptedCmp4) / COUNT(*), 2)
FROM saas_gtm_analytics.marketing_data_cleaned

UNION ALL

SELECT
    'Campaign 5',
    SUM(AcceptedCmp5),
    COUNT(*),
    ROUND(100.0 * SUM(AcceptedCmp5) / COUNT(*), 2)
FROM saas_gtm_analytics.marketing_data_cleaned

ORDER BY Acceptance_Rate DESC;

SELECT
    CASE
        WHEN AcceptedCmp1 = 1
          OR AcceptedCmp2 = 1
          OR AcceptedCmp3 = 1
          OR AcceptedCmp4 = 1
          OR AcceptedCmp5 = 1
        THEN 'Accepted at least one campaign'
        ELSE 'Accepted no campaigns'
    END AS Campaign_Group,
    COUNT(*) AS Customer_Count,
    ROUND(
        AVG(
            COALESCE(MntWines, 0) +
            COALESCE(MntFruits, 0) +
            COALESCE(MntMeatProducts, 0) +
            COALESCE(MntFishProducts, 0) +
            COALESCE(MntSweetProducts, 0) +
            COALESCE(MntGoldProds, 0)
        ), 2
    ) AS Average_Spending
FROM saas_gtm_analytics.marketing_data_cleaned
GROUP BY Campaign_Group
ORDER BY Average_Spending DESC;

SELECT
    'Web' AS Channel,
    SUM(NumWebPurchases) AS Total_Purchases,
    ROUND(AVG(NumWebPurchases), 2) AS Avg_Purchases_Per_Customer
FROM saas_gtm_analytics.marketing_data_cleaned

UNION ALL

SELECT
    'Catalogue',
    SUM(NumCatalogPurchases),
    ROUND(AVG(NumCatalogPurchases), 2)
FROM saas_gtm_analytics.marketing_data_cleaned

UNION ALL

SELECT
    'Physical Store',
    SUM(NumStorePurchases),
    ROUND(AVG(NumStorePurchases), 2)
FROM saas_gtm_analytics.marketing_data_cleaned

ORDER BY Total_Purchases DESC;

SELECT
    NumWebVisitsMonth,
    COUNT(ID) AS Customer_Count,
    ROUND(AVG(NumWebPurchases), 2) AS Avg_Web_Purchases
FROM saas_gtm_analytics.marketing_data_cleaned
GROUP BY NumWebVisitsMonth
ORDER BY NumWebVisitsMonth;

SELECT
    Kidhome,
    Teenhome,
    COUNT(ID) AS Customer_Count,
    ROUND(
        AVG(
            COALESCE(MntWines, 0) +
            COALESCE(MntFruits, 0) +
            COALESCE(MntMeatProducts, 0) +
            COALESCE(MntFishProducts, 0) +
            COALESCE(MntSweetProducts, 0) +
            COALESCE(MntGoldProds, 0)
        ), 2
    ) AS Average_Spending
FROM saas_gtm_analytics.marketing_data_cleaned
GROUP BY Kidhome, Teenhome
ORDER BY Average_Spending DESC;

SELECT
    CASE
        WHEN Income < 30000 THEN 'Low Income'
        WHEN Income < 60000 THEN 'Middle Income'
        ELSE 'High Income'
    END AS Income_Segment,
    COUNT(ID) AS Customer_Count,
    ROUND(AVG(Income), 2) AS Average_Income,
    ROUND(
        AVG(
            COALESCE(MntWines, 0) +
            COALESCE(MntFruits, 0) +
            COALESCE(MntMeatProducts, 0) +
            COALESCE(MntFishProducts, 0) +
            COALESCE(MntSweetProducts, 0) +
            COALESCE(MntGoldProds, 0)
        ), 2
    ) AS Average_Spending
FROM saas_gtm_analytics.marketing_data_cleaned
WHERE Income IS NOT NULL
GROUP BY Income_Segment
ORDER BY Average_Spending DESC;

SELECT
    COUNT(ID) AS Total_Customers,
    COUNT(Income) AS Customers_With_Income,
    ROUND(AVG(Income), 2) AS Average_Income,
    ROUND(
        AVG(
            COALESCE(MntWines, 0) +
            COALESCE(MntFruits, 0) +
            COALESCE(MntMeatProducts, 0) +
            COALESCE(MntFishProducts, 0) +
            COALESCE(MntSweetProducts, 0) +
            COALESCE(MntGoldProds, 0)
        ), 2
    ) AS Average_Spending,
    SUM(
        CASE
            WHEN AcceptedCmp1 = 1
              OR AcceptedCmp2 = 1
              OR AcceptedCmp3 = 1
              OR AcceptedCmp4 = 1
              OR AcceptedCmp5 = 1
            THEN 1
            ELSE 0
        END
    ) AS Customers_Accepted_Campaign
FROM saas_gtm_analytics.marketing_data_cleaned;

#To check table
SELECT
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Income IS NULL THEN 1 ELSE 0 END)
        AS Missing_Income,
    SUM(CASE WHEN Income = 0 THEN 1 ELSE 0 END)
        AS Zero_Income
FROM saas_gtm_analytics.marketing_data_cleaned;

SELECT ID, Income
FROM saas_gtm_analytics.marketing_data_cleaned
WHERE Income = 0;

# since while importing sql took null values as 0
UPDATE saas_gtm_analytics.marketing_data_cleaned
SET Income = NULL
WHERE Income = 0;