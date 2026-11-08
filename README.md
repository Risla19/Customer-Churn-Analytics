# Customer Churn Analytics

## Project Overview
This project analyzes customer churn in the telecommunications industry to identify customer groups with higher churn rates and understand the factors associated with customer attrition.

The goal is to turn raw customer data into meaningful business insights using data cleaning, SQL analysis, Python Exploratory Data Analysis (EDA), DAX measures, and an interactive Power BI dashboard.

## Project Objectives
- Analyze overall customer churn and retention.
- Identify customer segments with higher churn rates.
- Examine churn across contract types, internet services, payment methods, tenure, and technical support.
- Present meaningful business insights through data visualizations.

## Tools and Technologies
- **Microsoft Excel** – Data exploration and PivotTable analysis.
- **SQL Server** – Data cleaning, querying, and analysis.
- **Python** – Exploratory Data Analysis using Pandas and Matplotlib.
- **Power BI** – Interactive dashboard development.
- **DAX (Data Analysis Expressions)** – KPI calculations and analytical measures.

## Dataset
- Source: IBM Telco Customer Churn dataset.
- Total records: 7,043 customers.
- Includes customer demographics, services, contract information, billing details, tenure, and churn status.

## Project Workflow

1. **Data Preparation:** Inspected and cleaned the raw dataset.
2. **Excel Analysis:** Conducted PivotTable analysis to explore churn patterns.
3. **SQL Analysis:** Used SQL queries, aggregations, filtering, ranking, and analytical functions.
4. **Python EDA:** Explored churn distribution and customer characteristics through visualizations.
5. **DAX Measures:** Created measures for Total Customers, Churned Customers, Churn Rate, Retained Customers, and Retention Rate.
6. **Power BI Dashboard:** Developed a one-page interactive dashboard with KPIs, different chart types, and slicers.

## Key Business Findings
- Overall customer churn rate: **26.54%**.
- Month-to-month customers have a higher churn rate (42.71%).
- Fiber optic customers show a higher churn rate (41.89%).
- Electronic check users have the highest churn rate (45.29%).
- Customers with shorter tenure show higher churn rates.
- Customers without technical support have a higher churn rate.

## Dashboard
The Power BI dashboard presents:
- Total Customers
- Churned Customers
- Churn Rate
- Retained Customers
- Retention Rate
- Churn analysis by contract, internet service, tenure, payment method, and technical support.
- Interactive slicers for customer segmentation.

## Conclusion
This project demonstrates how Excel, SQL Server, Python, DAX, and Power BI can be combined to analyze customer behavior and identify potential customer-retention opportunities.

**Note:** The identified relationships represent associations in the dataset and do not establish causation.