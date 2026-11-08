USE CustomerChurnDB;
GO

SELECT TOP 5 *
FROM dbo.CustomerChurn_Staging2;

SELECT COUNT(*) AS Total_Records
FROM dbo.CustomerChurn_Staging2;

SELECT
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'CustomerChurn_Staging2'
ORDER BY ORDINAL_POSITION;

SELECT
    customerID,
    COUNT(*) AS Duplicate_Count
FROM dbo.CustomerChurn_Staging2
GROUP BY customerID
HAVING COUNT(*) > 1;

SELECT
    Churn,
    COUNT(*) AS Customer_Count
FROM dbo.CustomerChurn_Staging2
GROUP BY Churn;

SELECT
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS Churned_Customers,
    CAST(
        SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*) AS DECIMAL(5,2)
    ) AS Churn_Rate_Percentage
FROM dbo.CustomerChurn_Staging2;