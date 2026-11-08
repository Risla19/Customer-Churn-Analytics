USE CustomerChurnDB;
GO

SELECT *
FROM dbo.CustomerChurn_Staging2
WHERE TotalCharges IS NULL
   OR LTRIM(RTRIM(TotalCharges)) = '';

-- Query 3: Check tenure of customers with missing charges

SELECT
    tenure,
    COUNT(*) AS Customer_Count
FROM dbo.CustomerChurn_Staging2
WHERE TotalCharges IS NULL
   OR LTRIM(RTRIM(TotalCharges)) = ''
GROUP BY tenure;

-- Query 4: Identify non-numeric TotalCharges values

SELECT
    customerID,
    TotalCharges
FROM dbo.CustomerChurn_Staging2
WHERE TotalCharges IS NOT NULL
  AND LTRIM(RTRIM(TotalCharges)) <> ''
  AND TRY_CONVERT(DECIMAL(10,2), TotalCharges) IS NULL;

-- Query 5: Check minimum and maximum TotalCharges

SELECT
    MIN(TRY_CONVERT(DECIMAL(10,2), TotalCharges)) AS Minimum_TotalCharges,
    MAX(TRY_CONVERT(DECIMAL(10,2), TotalCharges)) AS Maximum_TotalCharges
FROM dbo.CustomerChurn_Staging2;

-- Query 6: Check negative TotalCharges

SELECT
    customerID,
    TotalCharges
FROM dbo.CustomerChurn_Staging2
WHERE TRY_CONVERT(DECIMAL(10,2), TotalCharges) < 0;

-- Query 7: Check negative MonthlyCharges

SELECT
    customerID,
    MonthlyCharges
FROM dbo.CustomerChurn_Staging2
WHERE MonthlyCharges < 0;

-- Query 8: Check missing values in important columns

SELECT
    SUM(CASE WHEN customerID IS NULL OR LTRIM(RTRIM(customerID)) = '' THEN 1 ELSE 0 END) AS Missing_CustomerID,
    SUM(CASE WHEN tenure IS NULL THEN 1 ELSE 0 END) AS Missing_Tenure,
    SUM(CASE WHEN MonthlyCharges IS NULL THEN 1 ELSE 0 END) AS Missing_MonthlyCharges,
    SUM(CASE WHEN Churn IS NULL THEN 1 ELSE 0 END) AS Missing_Churn
FROM dbo.CustomerChurn_Staging2;

-- Query 9: Check invalid tenure values

SELECT
    customerID,
    tenure
FROM dbo.CustomerChurn_Staging2
WHERE tenure < 0 OR tenure > 72;

GO

-- Create cleaned customer churn view
CREATE VIEW dbo.vw_CustomerChurn_Cleaned AS
SELECT
    *,
    TRY_CONVERT(
        DECIMAL(10,2),
        NULLIF(LTRIM(RTRIM(TotalCharges)), '')
    ) AS TotalCharges_Cleaned
FROM dbo.CustomerChurn_Staging2;
GO

SELECT TOP 5
    customerID,
    TotalCharges,
    TotalCharges_Cleaned
FROM dbo.vw_CustomerChurn_Cleaned;