
-- sales_agent_customer_count.sql: Provide a query that shows the count of customers assigned to each sales agent.

SELECT COUNT(c.CustomerId) AS CustomerCount,
    e.FirstName || ' ' || e.LastName AS EmployeeFullName
FROM `Customer` as c
JOIN Employee AS e ON e.EmployeeId = c.SupportRepId
GROUP BY EmployeeFullName