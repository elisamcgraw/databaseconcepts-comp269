-- Question 2: Create a SELECT statement that returns the count, average, max and min of the invoices submitted by each vendor, who has submitted more than one invoice. Order by the number of invoices in descending order. Should return 12 rows
use ap;
SELECT  vendor_name, count(*) AS number_of_invoices, round(AVG(invoice_total ), 2) AS avg_invoice_total, round( min(invoice_total),2) AS min_invoice_total, round(max(invoice_total),2) AS max_invoice_total
FROM vendors v JOIN invoices i
ON v.vendor_id = i.vendor_id
GROUP BY vendor_name
HAVING number_of_invoices > 1
ORDER BY number_of_invoices DESC;

-- Question 3:  Write a SELECT statement that includes vendor_name, invoice_number, line_item_description, account_description. Order by vendor_name, line_item_description, account_description in ascending order and limit to first 10
SELECT vendor_name, invoice_number, line_item_description, account_description
FROM vendors v JOIN invoices i 
ON v.vendor_id = i.vendor_id
JOIN invoice_line_items il 
ON i.invoice_id = il.invoice_id
JOIN general_ledger_accounts gl 
ON il.account_number = gl.account_number
ORDER BY vendor_name, line_item_description, account_description ASC
LIMIT 10;

-- Question 4
SELECT vendor_name, max( ALL invoice_total) AS max_invoice
FROM vendors v JOIN invoices i 
ON v.vendor_id = i.vendor_id
GROUP BY vendor_name
HAVING max(invoice_total) > 
	( 
	SELECT min(invoice_total)
	FROM invoices 
	WHERE vendor_name = 'Fresno County Tax Collector'
    ) 
	ORDER BY max(invoice_total);
















