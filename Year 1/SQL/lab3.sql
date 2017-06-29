-- Run command: @H:\comp155\labsol\Lab3_SolCmd
set echo on
SPOOL H:\comp155\labsol\Lab3_Sol.txt

/*********************************
Assignment - Lab 3 Solution
By Tyler Francis
Lab Section: 1B
Due: <remove three of the following lines>
Lab section 1B: due Tuesday Jan 27 @ 11:30 

Time spent on this lab: 2 hours
**********************************/

/*** 1 ***/
/* Write a query to display the last name, job, department number, and 
department name for all employees who work in Southlake. Be sure to 
handle case (i.e. upper and lower case) when checking that the city 
is Southlake - use a function to force a proper case comparison. Give 
the query in SQL:1999 and Oracle SQL. */

-- SQL:1999

/* SQL commands here */

-- Oracle SQL
SELECT last_name, 
	job_title, 
	department_id, 
	department_name
FROM employees INNER JOIN jobs
USING (job_id)
INNER JOIN departments
USING (department_id) 
INNER JOIN locations 
USING (location_id) 
WHERE locations.city = 'Southlake';







/* SQL commands here */
SELECT employees.last_name, 
	jobs.job_title, 
	departments.department_id, 
	departments.department_name
FROM employees, 
	departments,
	locations,
	jobs
WHERE employees.job_id= jobs.job_id 
AND employees.department_id = departments.department_id 
AND departments.location_id = locations.location_id 
AND locations.city 
LIKE 'Southlake%';

/*** 2 ***/
/* Write a query that will list all of the employees (last names), 
whose last name starts with 'G' (be sure to handle case - use a 
function), and the departments (give the name) to which they belong. 
Include all employees who have not yet been assigned to any department. 
Give the query in SQL:1999 and Oracle SQL. (Note: do not use IS NULL 
or IS NOT NULL in your query.) */

-- SQL:1999

/* SQL commands here */
SELECT last_name, department_name
FROM employees LEFT OUTER JOIN departments
USING (department_id)
WHERE last_name 
LIKE 'G%';


-- Oracle SQL

/* SQL commands here */
SELECT employees.last_name, departments.department_name
FROM employees, departments
WHERE employees.department_id = departments.department_id (+)
AND last_name 
LIKE 'G%';

/*** 3 ***/
/* Display the employee last name and employee number along with their 
manager's last name and manager number (in other words the manager's 
employee id) for all employees whose last name begins with 'T' (be 
sure to handle case - use a function). Label the columns Employee, 
Emp#, Manager, and Mgr#, respectively (note the use of upper and lower 
case). Give the query in SQL:1999 and Oracle SQL. */

-- SQL:1999

/* SQL commands here */
SELECT e.last_name "Employee" , 
	e.employee_id "Emp#", 
	m.last_name "Manager",
	m.employee_id "Mgr#"
FROM employees e INNER JOIN employees m
ON (m.employee_id = e.manager_id)
WHERE e.last_name 
LIKE 'T%';



-- Oracle SQL

/* SQL commands here */
SELECT e.last_name "Employee" , 
	e.employee_id "Emp#", 
	m.last_name "Manager",
	m.employee_id "Mgr#"
FROM employees e, employees m 
WHERE m.employee_id = e.manager_id
AND e.last_name
LIKE 'T%';



SPOOL OFF