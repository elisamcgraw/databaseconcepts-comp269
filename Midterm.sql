use ap;
-- Question 1
SELECT vendor_name, vendor_contact_first_name, vendor_state 
FROM vendors 
WHERE vendor_state = 'CA' AND vendor_contact_first_name like 'G%';

-- Question 2
SELECT vendor_name, CONCAT(vendor_contact_first_name, '', vendor_contact_last_name) AS 'Name', vendor_address1
FROM vendors
ORDER BY vendor_name
LIMIT 21,30;

-- Question 3
SELECT DISTINCT v1.vendor_name, v1.vendor_zip_code 
FROM vendors as v1
JOIN vendors as v2
WHERE v1.vendor_zip_code = v2.vendor_zip_code AND v1.vendor_name <> v2.vendor_name
ORDER BY v1.vendor_zip_code;

-- Question 4
SELECT v.vendor_name, max(i.invoice_total - i.payment_total - i.credit_total) AS 'Balance Due'
FROM vendors v JOIN invoices i
ON v.vendor_id = i.vendor_id
GROUP BY vendor_name
HAVING MAX(i.invoice_total - i.payment_total - i.credit_total) > 0
ORDER BY MAX(i.invoice_total - i.payment_total - i.credit_total) DESC;

-- Question 5
use ap;
SELECT count(distinct vendor_name) as 'Companies we owe money'
FROM vendors v JOIN invoices i
ON v.vendor_id = i.vendor_id
WHERE (i.invoice_total - i.payment_total-i.credit_total) > 0;

-- Question 6
SELECT account_description, sum(line_item_amount) as 'Freight Cost', glc.account_number
FROM general_ledger_accounts glc join invoice_line_items ili
ON glc.account_number = ili.account_number
WHERE account_description = 'Freight'
GROUP BY glc.account_number;

-- Question 7
update vendors
set vendor_name = 'Brookdale Community College'
where vendor_name = 'Federal Express Corporation';

-- Question 8
insert into invoices (vendor_id, invoice_number, invoice_date, invoice_total, payment_total,
credit_total, terms_id, invoice_due_date, payment_date)
VALUES(32,'AR-013-028','2014/8/2',578.56,0.00,0.00, 3,'2014/1/10', NULL);

-- Question 9
select vendor_id, vendor_name
from vendors
where vendor_name = 'Abbey Office Furnishings';

-- vendor_id = 94

DELETE FROM vendors 
WHERE vendor_id = 94;

DELETE FROM invoices
WHERE vendor_id = 94;

DELETE FROM invoice_archive
WHERE vendor_id = 94;

-- Question 10
select vendor_name, invoice_number, invoice_total
from vendors v join invoices i
on v.vendor_id = i.vendor_id
where invoice_total > 
	(select avg(invoice_total)
    from invoices i join vendors v
    on i.vendor_id = v.vendor_id)
order by vendor_name;