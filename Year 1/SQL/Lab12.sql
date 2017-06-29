-- Run command: @H:\comp155\labsol\Lab12

set echo on
SPOOL H:\comp155\labsol\Lab12_Sol.txt
SET PAGESIZE 50

/*********************************
 Assignment - Lab 12 Solution
 By Tyler Francis
 Lab Section: 1B
**********************************/

/*** Step 1 Create NEW_STUDENTS ***/

REM SQL command here
CREATE TABLE "NEW_STUDENTS"
			(temp_id NUMBER(5),
			 prog_id CHAR(4),
			 fname VARCHAR2(25),
			 lname VARCHAR2(25),
			 reg_date DATE);
 
/*** Step 2 Add columns ***/ 

REM SQL command here
ALTER TABLE "NEW_STUDENTS"
ADD (created_by VARCHAR2(30) NOT NULL, created_date DATE DEFAULT SYSDATE);

/*** Step 3 Confirm additions ***/     

REM SQL command here
DESC NEW_STUDENTS;


/*** Step 4 Confirm constraints for NEW_STUDENTS ***/

REM SQL command here
SELECT constraint_name, constraint_type, search_condition
FROM user_constraints
WHERE table_name = 'NEW_STUDENTS';


/*** Step 5 Create PROGRAMMES ***/

REM SQL command here
CREATE TABLE "PROGRAMMES"
			(prog_id CHAR(4),
			 prog_desc VARCHAR2(30));


/*** Step 6 Run insert script ***/

REM SQL command here
INSERT INTO new_students
(temp_id,prog_id,fname,lname,reg_date, created_by)
VALUES
(9516, 'comp','Ted','Codd',sysdate,user);

INSERT INTO programmes
(prog_id, prog_desc)
VALUES
('comp','Computer Technology');

/*** Step 7 SELECT from created tables ***/

REM SQL command here
SELECT *
FROM programmes;

SELECT *
FROM new_students;
 
/*** Step 8 Alter PROGRAMMES ***/

REM SQL command here
ALTER TABLE programmes
ADD CONSTRAINT prog_id_pk PRIMARY KEY (prog_id);

/*** Step 9 Alter NEW_STUDENTS ***/

REM SQL command here
ALTER TABLE new_students
ADD CONSTRAINT tempid_progid_pk 
PRIMARY KEY (temp_id, prog_id);

/*** Step 10 Add foreign key constraint ***/

REM SQL command here
ALTER TABLE new_students
ADD CONSTRAINT prog_id_fk
FOREIGN KEY (prog_id)
REFERENCES programmes(prog_id);



/*** Step 11 Confirm constraints for new tables ***/

REM SQL command here
SELECT constraint_name, constraint_type, search_condition
FROM user_constraints
WHERE table_name = 'NEW_STUDENTS'
OR table_name = 'PROGRAMMES'
ORDER BY (table_name);

/*** Step 12 Insert into NEW_STUDENTS ***/

REM SQL command here
INSERT INTO new_students
(temp_id, prog_id, fname, lname, reg_date, created_by
)VALUES( 9517, 'econ', 'Bill', 'Gates', '22-FEB-2016', 'Tyler');

/*** Step 13 Explain error ***/

REM You should get an error when you insert the record in Step 12. Why? 
/* Because the econ doesn't exist in the other table */

/*** Step 14 Add date constraint ***/

REM SQL command here
ALTER TABLE new_students
ADD CONSTRAINT dates_ck CHECK (reg_date > TO_DATE('JAN-01-1997', 'MON-DD-YYYY')); 

/*** Step 15 Test date constraint ***/

REM SQL command here
INSERT INTO new_students
(temp_id, prog_id, fname, lname, reg_date, created_by
)VALUES( 9519, 'comp', 'Grace', 'Hopper', '02-JAN-1948', 'Tyler');
/* The date was before January 01, 1997.*/


/*** Step 16 List constraints for new tables ***/


REM SQL command here
SELECT constraint_name, constraint_type, search_condition
FROM user_constraints
WHERE table_name = 'NEW_STUDENTS'
OR table_name = 'PROGRAMMES';


/*** Step 17 Clean up schema ***/


REM SQL commands here
DROP TABLE new_students PURGE;
DROP TABLE programmes PURGE;


/*** Step 18 End ***/

SPOOL OFF