-- Run command: @H:\comp155\labsol\Lab13

set echo on
SPOOL H:\comp155\labsol\Lab13_Sol.txt
SET PAGESIZE 50

/*********************************
 Assignment - Lab 13 Solution
 By Tyler Francis
 Lab Section: 1B
 Approx. Time Spent: 45 mins
 **********************************/

/*** Step 1 Create EMPLOYEES_VW ***/

REM SQL command here

CREATE VIEW EMPLOYEES_VW 
AS SELECT employee_id,  first_name ||' '|| last_name AS EMPNAME , department_id
FROM employees;

/*** Step 2 Display for Dept 90 ***/

REM SQL command here

SELECT *
FROM EMPLOYEES_VW
WHERE department_id = 90;

/*** Step 3 List Views from Dictionary ***/

REM SQL command here
SELECT text, view_name
FROM user_views
WHERE view_name = 'EMPLOYEES_VW';

/*** Step 4 Create DEPT50 view ***/

REM SQL command here
CREATE VIEW DEPT50
AS SELECT employee_id AS "EMPNO", last_name AS "EMPLOYEE", department_id AS "DEPTNO"
FROM employees
WHERE department_id = 50
WITH CHECK OPTION;

/*** Step 5 Structure & Contents of DEPT50 ***/

REM SQL command here (structure)
DESC DEPT50;
REM SQL command here (contents)
SELECT *
FROM DEPT50
WHERE rownum <= 10;

/*** Step 6 Reassign Matos ***/

REM SQL command here
UPDATE DEPT50
SET DEPTNO = 80
WHERE INITCAP(EMPLOYEE) = 'Matos';

/*** Step 7 Why did you get an error? ***/

REM Explain the error here
/*The error occured because it tried to update the view to something outside the DEPTID being 50. .*/

/*** Step 8 List views from USER_VIEWS ***/

REM SQL command here
SELECT text, view_name
FROM user_views
WHERE view_name = 'EMPLOYEES_VW'
OR view_name = 'DEPT50';


      
/*** Step 9 Drop the new views ***/

REM SQL command here
DROP VIEW EMPLOYEES_VW;
DROP VIEW DEPT50;

/*** Step 10 ***/

SPOOL OFF