-- Provide a query that shows the top 3 best selling artists.

-- Get the total quantity of tracks sold
-- Get the Artist names
-- Group tracks sold by Artist name
-- Sort data in descending order by total tracks sold
-- Limit response to only 3 rows of data

SELECT
    SUM(il.Quantity) TracksPurchased,
    a.Name Artist
FROM `InvoiceLine` il
    JOIN `Track` t ON il.TrackId = t.TrackId
    JOIN `Album` al ON al.AlbumId = t.AlbumId
    JOIN `Artist` a ON a.ArtistId = al.ArtistId
GROUP BY Artist
ORDER BY TracksPurchased DESC
LIMIT 3