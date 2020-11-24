-- Provide a query that shows the top 5 most purchased tracks over all.

-- Get the total quantity of tracks sold
-- Get the Track names
-- Group tracks sold by Track name
-- Sort data in descending order by total tracks sold
-- Limit response to only 5 rows of data
SELECT
    SUM(il.Quantity) TotalSold,
    t.Name AS TrackName
FROM `InvoiceLine` il
    JOIN `Track` t ON il.TrackId = t.TrackId
    JOIN `Invoice` i ON i.InvoiceId = il.InvoiceId
GROUP BY TrackName
ORDER BY TotalSold DESC
LIMIT 5