USE CustomerChurnDB;
GO

-- Task 1: Churn rate by contract type
SELECT
    Contract,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS Churned_Customers,
    CAST(
        SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*) AS DECIMAL(5,2)
    ) AS Churn_Rate_Percentage
FROM dbo.vw_CustomerChurn_Cleaned
GROUP BY Contract
ORDER BY Churn_Rate_Percentage DESC;

-- Task 2: Churn rate by Internet Service
SELECT
    InternetService,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS Churned_Customers,
    CAST(
        SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*) AS DECIMAL(5,2)
    ) AS Churn_Rate_Percentage
FROM dbo.vw_CustomerChurn_Cleaned
GROUP BY InternetService
ORDER BY Churn_Rate_Percentage DESC;

-- Task 3: Churn rate by Payment Method
SELECT
    PaymentMethod,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS Churned_Customers,
    CAST(
        SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*) AS DECIMAL(5,2)
    ) AS Churn_Rate_Percentage
FROM dbo.vw_CustomerChurn_Cleaned
GROUP BY PaymentMethod
ORDER BY Churn_Rate_Percentage DESC;

-- Task 4: Churn rate by Tech Support
SELECT
    TechSupport,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS Churned_Customers,
    CAST(
        SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*) AS DECIMAL(5,2)
    ) AS Churn_Rate_Percentage
FROM dbo.vw_CustomerChurn_Cleaned
GROUP BY TechSupport
ORDER BY Churn_Rate_Percentage DESC;

-- Task 5: Churn rate by Tenure Group
WITH TenureData AS
(
    SELECT
        CASE
            WHEN tenure <= 12 THEN '0-12 Months'
            WHEN tenure <= 24 THEN '13-24 Months'
            WHEN tenure <= 48 THEN '25-48 Months'
            ELSE '49+ Months'
        END AS Tenure_Group,
        COUNT(*) AS Total_Customers,
        SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS Churned_Customers
    FROM dbo.vw_CustomerChurn_Cleaned
    GROUP BY
        CASE
            WHEN tenure <= 12 THEN '0-12 Months'
            WHEN tenure <= 24 THEN '13-24 Months'
            WHEN tenure <= 48 THEN '25-48 Months'
            ELSE '49+ Months'
        END
)
SELECT
    Tenure_Group,
    Total_Customers,
    Churned_Customers,
    CAST(Churned_Customers * 100.0 / Total_Customers AS DECIMAL(5,2))
        AS Churn_Rate_Percentage
FROM TenureData
ORDER BY
    CASE Tenure_Group
        WHEN '0-12 Months' THEN 1
        WHEN '13-24 Months' THEN 2
        WHEN '25-48 Months' THEN 3
        ELSE 4
    END;

   -- Task 6: Churn rate by Monthly Charges
WITH ChargeData AS
(
    SELECT
        CASE
            WHEN MonthlyCharges < 35 THEN 'Low Charges'
            WHEN MonthlyCharges < 70 THEN 'Medium Charges'
            ELSE 'High Charges'
        END AS Charge_Group,
        COUNT(*) AS Total_Customers,
        SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS Churned_Customers
    FROM dbo.vw_CustomerChurn_Cleaned
    GROUP BY
        CASE
            WHEN MonthlyCharges < 35 THEN 'Low Charges'
            WHEN MonthlyCharges < 70 THEN 'Medium Charges'
            ELSE 'High Charges'
        END
)
SELECT
    Charge_Group,
    Total_Customers,
    Churned_Customers,
    CAST(
        Churned_Customers * 100.0 / Total_Customers
        AS DECIMAL(5,2)
    ) AS Churn_Rate_Percentage
FROM ChargeData
ORDER BY
    CASE Charge_Group
        WHEN 'Low Charges' THEN 1
        WHEN 'Medium Charges' THEN 2
        ELSE 3
    END;