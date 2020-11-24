-- line_item_track_artist.sql: Provide a query that includes the purchased track name AND artist name with each invoice line item.

SELECT InvoiceLineId,
    Track.Name AS TrackName,
    InvoiceLine.UnitPrice,
    InvoiceLine.Quantity,
    Artist.Name AS ArtistName
FROM `InvoiceLine`
JOIN Track ON Track.TrackId = InvoiceLine.TrackId
JOIN Album ON Album.AlbumId = Track.AlbumId
JOIN Artist ON Artist.ArtistId = Album.ArtistId
GROUP BY InvoiceLine.InvoiceId