--Formatting shenanigans

SET LINESIZE 1000;
SET TRIMSPOOL ON;


-- First Query
CREATE OR REPLACE VIEW first_view AS
SELECT SUM(s.amount_sold) "Amount of Products Sold", SUM(s.quantity_sold) "Number of Products sold", t.fiscal_year, p.prod_name
FROM sh.sales s 
    JOIN sh.times t
    ON (s.time_id = t.time_id)
    JOIN sh.products p
    ON (s.prod_id = p.prod_id)
GROUP BY (t.fiscal_year, p.prod_name)
ORDER BY t.fiscal_year;

-- Second query
CREATE OR REPLACE VIEW second_view AS
SELECT SUM(s.amount_sold) "Amount of Products Sold", SUM(s.quantity_sold) "Number of Products sold", t.fiscal_year, p.prod_category
FROM sh.sales s
    JOIN sh.products p
    ON (s.prod_id = p.prod_id)
    JOIN sh.times t
    ON (s.time_id = t.time_id)
GROUP BY (t.fiscal_year, p.prod_category)
ORDER BY t.fiscal_year;

-- Third query
CREATE OR REPLACE VIEW third_view AS
SELECT SUM(s.amount_sold) "Amount of Products Sold", SUM(s.quantity_sold) "Number of Products sold", co.country_name
FROM sh.sales s
    JOIN sh.customers cu 
    ON (s.cust_id = cu.cust_id)
    JOIN sh.countries co
    ON (cu.country_id = co.country_id) --was cust_id before
GROUP BY co.country_name
ORDER BY "Amount of Products Sold";

--SPOOL OFF;
--SPOOL spoolLab5Query.txt
--@C:\Users\Tyler\Desktop\Lab5Query.sql
