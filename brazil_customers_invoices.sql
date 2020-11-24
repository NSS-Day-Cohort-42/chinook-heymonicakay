-- Provide a query showing the Invoices of customers who are from Brazil.
-- The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.

SELECT
    i.InvoiceId InvoiceId,
    strftime( '%m-%d-%Y', i.InvoiceDate) InvoiceDate,
    i.BillingCountry BillingCountry,
    c.FirstName || ' ' || c.LastName CustomerFullName
FROM `Invoice` i
    JOIN `Customer` c ON c.CustomerId = i.CustomerId
WHERE BillingCountry = "Brazil"
ORDER BY CustomerFullName