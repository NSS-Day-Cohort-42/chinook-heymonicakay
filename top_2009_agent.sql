-- top_2009_agent.sql: Which sales agent made the most in sales in 2009?
-- Hint: Use the MAX function on a subquery.

SELECT
    MAX(EmployeeSales2009),
    EmployeeFullName
FROM(
    SELECT
        ROUND(SUM(i.Total)) AS EmployeeSales2009,
        e.FirstName || ' ' || e.LastName AS EmployeeFullName
    FROM `Invoice` AS i
    JOIN Customer AS c ON c.CustomerId = i.CustomerId
    JOIN EMployee AS e ON e.EmployeeId = c.SupportRepId
    WHERE strftime('%Y', i.InvoiceDate) = "2009"
    GROUP BY EmployeeFullName
)