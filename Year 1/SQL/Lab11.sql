-- Run command: @H:\comp155\labsol\Lab11

set echo on
SPOOL H:\comp155\labsol\Lab11_Sol.txt
set pagesize 15
set linesize 80

/*********************************
 Assignment - Lab 11 Solution
 By Tyler Francis
 Lab Section: 1B
 Time Used Completing Lab: 1 hour
 **********************************/
 
/*** 1 Create MY_STUDENT ***/
 
REM SQL command here
CREATE TABLE "MY_STUDENT"
		(mystudent_id NUMBER(5),
		 mylname varchar2(25),
		 mystartdate DATE DEFAULT SYSDATE);
/*** 2 Describe ***/

REM SQL command here
DESC MY_STUDENT;

/*** 3 Modify MY_STUDENT ***/

REM SQL command here
ALTER TABLE MY_STUDENT
MODIFY		(mylname VARCHAR2(50));

/*** 4 Describe ***/

REM SQL command here
DESC MY_STUDENT;

/*** 5 Insert your name ***/

REM SQL command here
INSERT INTO MY_STUDENT (
	mystudent_id, mylname
) VALUES (666, 'Francis'
);


/*** 6 List contents ***/

REM SQL command here
SELECT * 
FROM MY_STUDENT;

/*** 7 Add comment ***/
 
REM SQL command here
COMMENT ON 	TABLE MY_STUDENT
IS 'Lab 11 Table';
/*** 8 Confirm comment for MY_STUDENT ***/

REM SQL command here
SELECT *
FROM user_tab_comments
WHERE table_name = 'MY_STUDENT';

/*** 9 Create table My_Student ***/

REM SQL command here
CREATE TABLE "My_Student" AS
SELECT mystudent_id AS "StudentNo", mylname AS "Last Name", mystartdate AS "BeginDate" 
FROM "MY_STUDENT";

/*** 10 Describe ***/
DESC My_Student;

REM SQL command here
DESC "My_Student";
/*** 11 Select from data dictionary ***/

REM SQL command here
SELECT table_name 
FROM user_tables;
   
/*** 12 Drop MY_STUDENT ***/

REM SQL command here
DROP TABLE "MY_STUDENT" PURGE;

/*** 13 Rename ***/

REM SQL command here
RENAME "My_Student" TO "MY_STUDENT";

/*** 14 Select from data dictionary ***/

REM SQL command here
SELECT table_name 
FROM user_tables;

/*** 15 Drop MY_STUDENT ***/
DROP TABLE "MY_STUDENT" PURGE;

REM SQL command here

/*** 16 Select from data dictionary ***/

REM SQL command here
SELECT table_name 
FROM user_tables;
/*** 17 ***/

SPOOL OFF