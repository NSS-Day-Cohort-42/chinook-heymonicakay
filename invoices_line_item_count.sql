-- Provide a query that shows all Invoices but includes the # of invoice line items.

SELECT COUNT(InvoiceLineId) TotalLineItems,
    i.InvoiceId
FROM `Invoice` i
    JOIN `InvoiceLine` il ON il.InvoiceId = i.InvoiceId
GROUP BY i.InvoiceId