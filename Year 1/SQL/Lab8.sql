-- Run command: @H:\comp155\labsol\Lab8
set echo on
SPOOL H:\comp155\labsol\Lab8_Sol.txt
SET PAGESIZE 50

/*********************************
 Assignment - Lab 8 Solution
 By <give your name>
 Lab Section: 1A or 1B or 2A or 2B
 Time spent working on this lab: xx.x hrs
 **********************************/
 
/*** 1 ***/
/* Create a query to display the employee numbers, last names 
and salaries of all employees who earn more than the average 
salary and whose last_name begins with a 'G' or 'P' (be sure 
to handle case). Sort the results in descending order of salary. */

/* Place SQL statement here */
SELECT employee_id, last_name, salary
FROM employees
WHERE salary > 
	(SELECT AVG(salary)
	 FROM employees)
AND
(UPPER(last_name) LIKE 'G%' 
OR 
UPPER(last_name) LIKE 'P%')
ORDER BY salary DESC;
	 


/*** 2 ***/
/* Write a query that will display the last name and salary of every 
employee who reports to Gerald Cambrault. (There is more than one 
Cambrault in the database so you must be careful to check the first 
name too.) Be sure to handle case. */

/* Place SQL statement here */
SELECT last_name, salary
FROM employees
WHERE manager_id = 
	(SELECT employee_id
	 FROM employees
	 WHERE INITCAP(first_name) = 'Gerald'
	 AND INITCAP(last_name) = 'Cambrault');


/*** 3 ***/
/* How many people work in the same department as Gerald Cambrault? 
Write a query to count the number employees in Gerald's department. 
Exclude Gerald from your count. (Remember, there is more than one 
Cambrault in the database so be sure to check the first name too.) */


/* Place SQL statement here */
SELECT COUNT(*)AS "Number of Employees"
FROM employees
WHERE department_id = 
	(SELECT department_id
	 FROM employees
	 WHERE INITCAP(first_name) = 'Gerald'
	 AND INITCAP(last_name) = 'Cambrault')
AND employee_id != 
	(SELECT employee_id
	 FROM employees
	 WHERE INITCAP(first_name) = 'Gerald'
	 AND INITCAP(last_name) = 'Cambrault');


/*** 4 ***/
/* Write a query to display the department IDs, employee IDs, last names, 
and salaries of all employees who earn more than twice ( 2 times) the 
average salary for the company, and who work in a department with any 
employee with a "u" anywhere in their last name. (Remember the "u" could 
be at the beginning of the name too.) Order your output by employee IDs. */

/* Place SQL statement here */
SELECT department_id, employee_id, last_name, salary
FROM employees
WHERE salary >
	(SELECT AVG(salary) * 2
     FROM employees)
AND department_id IN 
	(SELECT department_id
	 FROM employees
	 WHERE LOWER(last_name)
	 LIKE '%u%');

SPOOL OFF