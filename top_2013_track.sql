-- Provide a query that shows the most purchased track of 2013. - This does not exist as all tracks were purchased one time in 2013.

-- 3. Filter resulting data (WHERE) to show tracks WHERE total sold = MAX sold.
SELECT
    Trax2013.TrackName TrackName,
    Trax2013.Sold SoldIn2013
FROM (
    -- 1. Find total number (SUM) of sales per track in 2013
    SELECT
        SUM(il.Quantity) Sold,
        t.Name TrackName
    FROM `InvoiceLine` il
        JOIN `Track` t ON il.TrackId = t.TrackId
        JOIN `Invoice` i ON i.InvoiceId = il.InvoiceId
    -- filter to show only track sales made in 2013
    WHERE strftime('%Y', i.InvoiceDate) = "2013"
    -- group by the unique identifier for Track
    GROUP BY t.TrackId
) Trax2013
JOIN (
    -- 2. Find the MAX number of times a given track was purchased in 2013
    SELECT
        MAX(SoldIn2013) Maximum
    FROM(
        -- 1. Unique List of sale quantities for tracks sold in 2013
        SELECT DISTINCT
            SUM(il.Quantity) SoldIn2013
        FROM `InvoiceLine` il
            JOIN `Track` t ON t.TrackId = il.TrackId
            JOIN `Invoice` i ON i.InvoiceId = il.InvoiceId
        -- filter to show only track sales made in 2013
        WHERE strftime('%Y', i.InvoiceDate) = "2013"
        -- group by the unique identifier for Track
        GROUP BY t.TrackId
    )
) MaxPurchases2013
WHERE SoldIn2013 = MaxPurchases2013.Maximum
ORDER BY TrackName


-- top_2013_track.sql: Provide a query that shows the most purchased track of 2013.

SELECT
    Trax2013.TrackName,
    Trax2013.SoldIn2013
FROM (
    SELECT
        SUM(il.Quantity) SoldIn2013,
        t.Name TrackName
    FROM `InvoiceLine` il
        JOIN `Track` t ON il.TrackId = t.TrackId
        JOIN `Invoice` i ON i.InvoiceId = il.InvoiceId
            WHERE strftime('%Y', i.InvoiceDate) = "2013"
    GROUP BY TrackName
    ) Trax2013
JOIN (
    SELECT
        MAX(SoldIn2013) Maximum,
        TrackName
    FROM(
        SELECT
            SUM(il.Quantity) SoldIn2013,
            t.Name AS TrackName
        FROM `InvoiceLine` il
            JOIN `Track` t ON il.TrackId = t.TrackId
            JOIN `Invoice` i ON i.InvoiceId = il.InvoiceId
                WHERE strftime('%Y', i.InvoiceDate) = "2013"
        GROUP BY TrackName
        )
) MaxPurchases2013
WHERE Trax2013.SoldIn2013 = MaxPurchases2013.Maximum