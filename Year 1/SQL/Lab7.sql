-- Run command: @H:\comp155\labsol\Lab7
set echo on
SPOOL H:\comp155\labsol\Lab7_Sol.txt
SET PAGESIZE 50
SET LINESIZE 120

/*********************************
 Assignment - Lab 7 Solution
 By <give your name>
 Lab Section: 1A or 1B or 2A or 2B
 Due: 
 Lab section 1A: due Thursday, Feb 12 1:00 pm
 Lab section 1B: due Thursday, Feb 12 11:30 am
 Lab section 2A: due Thursday, Feb 12 8:30 am
 Lab section 2B: due Wednesday, Feb 11 12:30 pm
 
 **********************************/
 
-- Get the date of the run for information
SELECT TO_CHAR(sysdate, 'Day Month DD HH24:MM') As "Script Run" 
FROM DUAL;

/*** 1 ***/
/* For each employee whose last name begins with a P, display the employee's 
last name and calculate the number of months between today and the date the 
employee was hired. Label the column "Months Worked" (note case). Order your 
results in descending order by the number of months employed. Round the 
number of months so that there is only a single digit after the decimal. */

/* Place SQL statement here */
SELECT last_name,ROUND(MONTHS_BETWEEN(SYSDATE , hire_date)) AS "Months Worked"
FROM employees
WHERE UPPER(last_name)
LIKE 'P%' 
ORDER BY "Months Worked" DESC;


/*** 2 ***/
/* Your company is considering providing a special lunch every month for all
employees who have worked for the company at least 15 years. They will be 
invited to the lunch in the month in which they were hired. To get an idea 
of how many employees might come to a special lunch each month over the 
calendar year, your boss has asked you to write a query to return the number 
of employees who will have worked for the company at least 15 years divided 
into groupings by month. (See lab write-up for further details.) */

/* Place SQL statement here */
SELECT TO_CHAR(hire_date, 'Month') AS "Month", COUNT (*) AS "Number of Hires"
FROM employees
WHERE MONTHS_BETWEEN(TRUNC(SYSDATE, 'year'), TRUNC(hire_date, 'year')) >= 240
GROUP BY TO_CHAR(hire_date, 'Month')
ORDER BY TO_DATE(TO_CHAR(hire_date, 'Month'), 'Month') ASC; 
/*** 3 ***/
/* Your boss wants to know how many people might come who are of legal 
drinking age in British Columbia (in other words, are at least 19 as of 
December 3rd). You need to write a query to count the number of people 
in the people database who are at least 19 by that date. You will use the 
COMP155.PEOPLE table for this query. (See lab write-up for further details.)*/

/* Place SQL statement here */
SELECT 'The number of people who will be 19 or older as of December 3rd, 2016 is: ' || COUNT (*) AS "Number of People"
FROM comp155.people 
WHERE MONTHS_BETWEEN(TO_DATE('December 03, 2016', 'Month dd, YYYY '),birth_date) >= 228;

SPOOL OFF
