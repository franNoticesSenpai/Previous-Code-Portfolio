/*
Create a cross tabular report using the SH schema showing the total sales (amount_sold) of all product categories 
that were promoted by TV or Internet (promo_category) during the 2000 and 2001 fiscal years. Order by the product 
categories. Your results should look similar to the following. If your version of SQL Developer is configured to 
show null values as (null), you may have to set a preference setting to show blank instead. Look under the 
Tools menu to find it (Tools -> Preferences -> Database -> Advanced (first option)).
*/
-- TO_CHAR(SUM(s.amount_sold), '$9,999,999,999.99') AS SALES
SPOOL C:\Users\Tyler\Desktop\lab7spool.txt

SELECT p.prod_category AS "CATEG", t.fiscal_year, pr.promo_category AS "PROMO",
TO_CHAR(SUM(sl.amount_sold), '$9,999,999,999.99') AS SALES
FROM sh.sales sl
JOIN sh.products p
	ON sl.prod_id = p.prod_id
JOIN sh.times t
	ON sl.time_id = t.time_id
JOIN sh.promotions pr
    ON pr.promo_id = sl.promo_id
WHERE fiscal_year IN (2000, 2001)
AND UPPER(pr.promo_category) IN ( 'TV', 'INTERNET')
GROUP BY ROLLUP(p.prod_category, t.fiscal_year, pr.promo_category)
ORDER BY p.prod_category;

/*
Using essentially the same query as above, calculate the totals for all possible combinations, 
but restrict your categories to Electronics and Hardware only.
*/

SELECT p.prod_category AS "CATEG", t.fiscal_year, pr.promo_category AS "PROMO",
TO_CHAR(SUM(sl.amount_sold), '$9,999,999,999.99') AS SALES
FROM sh.sales sl
JOIN sh.products p
	ON sl.prod_id = p.prod_id
JOIN sh.times t
	ON sl.time_id = t.time_id
JOIN sh.promotions pr
    ON pr.promo_id = sl.promo_id
WHERE t.fiscal_year IN (2000, 2001)
AND UPPER(p.prod_category) IN ( 'ELECTRONICS', 'HARDWARE')
GROUP BY CUBE(p.prod_category, t.fiscal_year, pr.promo_category)
ORDER BY p.prod_category;

/*
Using essentially the same query as in above, calculate sales by product category and fiscal year, 
and promotion category and fiscal year. (Your categories will be restricted to Electronics and Hardware.) 
Also include the grand total.
*/

SELECT p.prod_category AS "CATEG", t.fiscal_year, pr.promo_category AS "PROMO",
TO_CHAR(SUM(sl.amount_sold), '$9,999,999,999.99') AS SALES
FROM sh.sales sl
JOIN sh.products p
	ON sl.prod_id = p.prod_id
JOIN sh.times t
	ON sl.time_id = t.time_id
JOIN sh.promotions pr
    ON pr.promo_id = sl.promo_id
WHERE t.fiscal_year IN (2000, 2001)
AND UPPER(p.prod_category) IN ( 'ELECTRONICS', 'HARDWARE')
GROUP BY GROUPING SETS((p.prod_category, t.fiscal_year, pr.promo_category), ROLLUP(t.fiscal_year))
ORDER BY p.prod_category;

/*
List the 3 best selling (by amount_sold) products in each category during the fiscal year of 2001 using the SH schema. Order by category. 
*/
SELECT * FROM (
    SELECT p.prod_category AS "CATEG", p.prod_name,
    TO_CHAR(SUM(sl.amount_sold), '$9,999,999,999.99') AS SALES, RANK () OVER (PARTITION BY p.prod_category ORDER BY SUM(sl.amount_sold) DESC) AS "RANKED"
    FROM sh.sales sl
    JOIN sh.products p
        ON sl.prod_id = p.prod_id
    JOIN sh.times t
        ON sl.time_id = t.time_id
    JOIN sh.promotions pr
        ON pr.promo_id = sl.promo_id
    WHERE t.fiscal_year IN (2001)
    GROUP BY p.prod_category, p.prod_name
)
WHERE RANKED <= 3;

/*
What were the three worst selling products in each category during the fiscal year of 2001?
*/
SELECT * FROM (
    SELECT p.prod_category AS "CATEG", p.prod_name,
    TO_CHAR(SUM(sl.amount_sold), '$9,999,999,999.99') AS SALES, RANK () OVER (PARTITION BY p.prod_category ORDER BY SUM(sl.amount_sold) ASC) AS "RANKED"
    FROM sh.sales sl
    JOIN sh.products p
        ON sl.prod_id = p.prod_id
    JOIN sh.times t
        ON sl.time_id = t.time_id
    JOIN sh.promotions pr
        ON pr.promo_id = sl.promo_id
    WHERE t.fiscal_year IN (2001)
    GROUP BY p.prod_category, p.prod_name
)
WHERE RANKED <= 3;

