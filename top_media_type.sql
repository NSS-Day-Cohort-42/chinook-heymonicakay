-- Provide a query that shows THE most purchased Media Type.


-- Shows the MediaType associated with the MAX value from TimesPurchased column of TotalTimesPurchased query.
SELECT
    MAX(Total.Purchases) TimesPurchasedMax,
    Total.MediaType TopMediaType
FROM (
    -- Shows the SUM of the Invoice Line Item Quantity for each Media Type respectively
    SELECT
        SUM(il.Quantity) Purchases,
        mt.Name MediaType
    FROM `InvoiceLine` il
        JOIN `Track` t ON il.TrackId = t.TrackId
        JOIN `MediaType` mt ON mt.MediaTypeId = t.MediaTypeId
    GROUP BY MediaType
) Total