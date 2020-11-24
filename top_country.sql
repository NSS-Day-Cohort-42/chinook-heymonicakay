-- top_country.sql: Which country's customers spent the most?

SELECT
    MAX(CountryTotalSales) AS HighestCountryTotalSales,
    Country
FROM(
    SELECT
        ROUND(SUM(i.Total), 2) AS CountryTotalSales,
        i.BillingCountry AS Country
        FROM `Invoice` AS i
        GROUP BY i.BillingCountry
)