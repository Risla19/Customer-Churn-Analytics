USE CustomerChurnDB;
GO

-- Task 1: Rank customers by Monthly Charges
SELECT
    customerID,
    Contract,
    MonthlyCharges,
    Churn,
    RANK() OVER (ORDER BY MonthlyCharges DESC) AS Charge_Rank
FROM dbo.vw_CustomerChurn_Cleaned;

-- Task 2: Top 10 highest-paying customers
SELECT TOP 10
    customerID,
    Contract,
    MonthlyCharges,
    Churn
FROM dbo.vw_CustomerChurn_Cleaned
ORDER BY MonthlyCharges DESC;

-- Task 3: Churned customers with two-year contracts
SELECT
    customerID,
    tenure,
    MonthlyCharges,
    Contract,
    Churn
FROM dbo.vw_CustomerChurn_Cleaned
WHERE Contract = 'Two year'
  AND Churn = 1
ORDER BY tenure;