-- Run command: @H:\comp155\labsol\Lab6_SolCmd
set echo on
SPOOL H:\comp155\labsol\Lab6_Sol.txt

/*********************************
 Assignment - Lab 6 Solution
 By: Tyler Francis
 Section: 1B 

 Due:
 
 Lab section 1B: due Thursday, Feb 5 11:30 am


 Time spent completing this lab: 0.5 hours [ your approximation ]	  
 **********************************/
 
/*** 1 ***/
/* Write a query to display the number of people with the same job. Use JOB_ID 
in your query and list the jobs by JOB_ID along with the number of people having
that job.*/

/* Your SQL SELECT query solution to 1 above goes here. */

SELECT job_id, COUNT(*)
FROM employees
GROUP BY job_id;

/*** 2 ***/
/* Display the highest, lowest, sum, and average salary of all employees. Label 
the columns Maximum, Minimum, Sum, and Average, respectively (note the use of 
upper and lower case). Round your results to the nearest whole number. Do not use
the min_salary or max_salary attributes in the jobs table. */

/* Your SQL SELECT query solution to 2 above goes here. */

SELECT ROUND(MAX(salary)) AS "Maximum", ROUND(MIN(salary)) AS "Minimum", ROUND(AVG(salary)) AS "Average", ROUND(SUM(salary)) AS "Sum"
FROM employees;
 
/*** 3 ***/ 
/* Modify the above (#2) to display the maximum, minimum, sum, and average 
salary for each job type  (assume each job_id represents a job type). Be 
sure to give the job type in your output.*/

/* Your SQL SELECT query solution to 3 above goes here. */

SELECT job_id, ROUND(MAX(salary)) AS "Maximum", ROUND(MIN(salary)) AS "Minimum", ROUND(AVG(salary)) AS "Average", ROUND(SUM(salary)) AS "Sum"
FROM employees
GROUP BY job_id;

/*** 4 ***/ 
/* Display the manager number and the salary of the lowest paid employee for 
that manager. Exclude anyone whose manager is not known - in other words, 
exclude anyone who has a NULL manager_id. */

/* Your SQL SELECT query solution to 4 above goes here. */

SELECT manager_id, MIN(salary)
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id;

/*** 5 ***/ 
/* Modify your query from above (#4) to exclude any groups where the minimum 
salary is less than or equal to $6,000. Sort the output in descending order of 
salary. */

/* Your SQL SELECT query solution to 5 above goes here. */

SELECT manager_id, MIN(salary)
FROM employees
WHERE manager_id IS NOT NULL 
GROUP BY manager_id
HAVING MIN(salary) > 6000 
ORDER BY MIN(salary) DESC; 

SPOOL OFF