--What are the respective total sales for each of those years?

SELECT
    SUM(Total)
FROM `Invoice` i
WHERE strftime('%Y', i.InvoiceDate) = "2009"

SELECT
    SUM(Total)
FROM `Invoice` i
WHERE strftime('%Y', i.InvoiceDate) = "2011"