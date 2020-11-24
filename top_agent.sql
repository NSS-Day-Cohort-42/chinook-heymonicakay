-- top_agent.sql: Which sales agent made the most in sales over all?

SELECT
    MAX(EmployeeSales) AS HighestEmployeeSales,
    EmployeeFullName
FROM (
    SELECT
        ROUND(SUM(i.Total), 2) AS EmployeeSales,
        e.FirstName || ' ' || e.LastName AS EmployeeFullName
    FROM `Invoice` AS i
    JOIN Customer AS c ON c.CustomerId = i.CustomerId
    JOIN Employee AS e ON e.EmployeeId = c.SupportRepId
    GROUP BY EmployeeFullName
)