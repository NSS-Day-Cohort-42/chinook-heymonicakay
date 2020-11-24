-- How many Invoices were there in 2009 and 2011?

SELECT
    COUNT(i.InvoiceId)
FROM `Invoice` i
WHERE strftime('%Y', i.InvoiceDate) = "2009"
    OR strftime('%Y', i.InvoiceDate) = "2011"