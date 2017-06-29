-- Run command: @H:\comp155\labsol\Lab5_SolCmd
set echo on
SPOOL H:\comp155\labsol\Lab5_Sol.txt

/*********************************
 Assignment - Lab 5 Solution
 By: Tyler Francis
 Section: 1B  

 Due:

 Lab section 1B: due Tuesday, Feb 3 1:00 pm
 
 

 Time spent completing this lab: 2 hours [ your approximation ]	  
 **********************************/
 
/*** 1 ***/
/* Run the script to add a couple of records to your HR employees table.*/

INSERT INTO employees
(employee_id, first_name, last_name, email, hire_date, job_id, salary)
VALUES
(9989, 'bill', 'rIm', 'rim@home.com', sysdate, 'PU_CLERK', 1500.25);

INSERT INTO employees
(employee_id, first_name, last_name, email, hire_date, job_id, salary)
VALUES
(9988, 'LARRY', 'rIMMER', 'rimmer@myhome.com', sysdate, 'PU_CLERK', 1600.25);


/*** 2 ***/
/* For all employees whose last name starts with the letter R, display the 
   employee's last names with the first letter capitalized and all other 
   letters lowercase (be sure to use a function), and give the length of their 
   last name. Give each column an appropriate label using SQL (i.e. do not use 
   the column name default). Sort the results in descending order by the 
   employee's last name. */

/* SQL command here */
SELECT INITCAP(last_name) AS "Employee's Last Name's", LENGTH (last_name) AS "Length of name"
FROM employees
WHERE UPPER(last_name)
LIKE 'R%'
ORDER BY "Employee's Last Name's" DESC;


/*** 3 ***/
/* Your boss was at a company party and met a fellow employee name Olson, or 
was it Olsen, or may something else like that. He wasn't quite sure (his 
hearing is bad when he drinks). He wants you to run a query that will get 
all employees whose name sounds like Olson and the name of the department 
for which they work. He is sure once he sees the name and department he 
will remember the person. Make sure you use a function to check for the sound 
of the name. */

-- Traditional

/* SQL command here */
SELECT last_name, department_name
FROM employees, departments
WHERE employees.department_id = departments.department_id
AND SOUNDEX(last_name)
= SOUNDEX('Olson');

-- SQL/92 

/* SQL command here */
SELECT last_name, department_name
FROM employees INNER JOIN departments
USING (department_id)
WHERE SOUNDEX(last_name)
= SOUNDEX('Olson');

/*** 4 ***/
/* Write a query that produces the following for each employee whose last 
name begins with an R: <employee last name> earns <salary> monthly but 
wants <3 times salary>. Label the column Dream Salaries. */

/* SQL command here */
SELECT INITCAP(last_name) ||' '|| 'earns $'|| salary ||' '|| 'monthly but wants'|| ' '|| TO_CHAR(salary * 3, 'fm$99,999.00') AS "Dream Salaries"
FROM employees
WHERE UPPER(last_name)
LIKE 'R%';


/*** 5 ***/
ROLLBACK;

SPOOL OFF