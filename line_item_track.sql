-- line_item_track.sql: Provide a query that includes the purchased track name with each invoice line item.

SELECT InvoiceLineId,
    Track.Name AS TrackName,
    InvoiceLine.UnitPrice,
    InvoiceLine.Quantity
FROM `InvoiceLine`
JOIN Track ON Track.TrackId = InvoiceLine.TrackId
GROUP BY InvoiceLine.InvoiceId