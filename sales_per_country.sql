-- sales_per_country.sql: Provide a query that shows the total sales per country.

SELECT i.BillingCountry,
    ROUND(SUM(i.Total), 2) AS TotalSales
FROM `Invoice` AS i
GROUP BY i.BillingCountry