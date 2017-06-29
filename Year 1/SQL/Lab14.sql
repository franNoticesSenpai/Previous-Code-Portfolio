-- Run command: @H:\comp155\labsol\Lab14

set echo on
SPOOL H:\comp155\labsol\Lab14_Sol.txt
SET PAGESIZE 50

/*********************************
 Assignment - Lab 14 Solution
 By Tyler Francis
 Lab Section: 1B
 **********************************/
 
/*** Step 1 Run script to create table & insert data ***/

REM SQL command here

/*** Create the table ***/

CREATE TABLE mytextbooktable
(text_id NUMBER(5),
 text_name VARCHAR2(25),
 text_author VARCHAR2(50),
 text_publisher VARCHAR2(25),
 faculty_ref NUMBER(5));

/*** Insert some data ***/

INSERT INTO mytextbooktable
(text_name, text_author, text_publisher,faculty_ref)
VALUES
('All computers', 'Know It All', 'Self',3);

INSERT INTO mytextbooktable
(text_name, text_author, text_publisher,faculty_ref)
VALUES
('No Homework!', 'Tired Student', 'Publish',1);

/*** Step 2 Create sequence ***/

REM SQL command here
CREATE SEQUENCE textbook_seq
			START WITH 22
			NOCACHE;
			

/*** Step 3 Update with sequence ***/

REM SQL command here

UPDATE mytextbooktable
SET text_id = textbook_seq.nextval;


/*** Step 4 Display details about textbook_seq ***/

REM SQL command here
SELECT sequence_name, min_value, max_value, increment_by, last_number
FROM user_sequences
WHERE sequence_name = 'TEXTBOOK_SEQ';


/*** Step 5 Make text_id the primary key ***/

REM SQL command here
ALTER TABLE MYTEXTBOOKTABLE
ADD CONSTRAINT text_id_pk
PRIMARY KEY (text_id);

/*** Step 6 Insert values ***/

REM SQL command here

INSERT INTO MYTEXTBOOKTABLE
(text_id, text_name, text_author, text_publisher, faculty_ref)
VALUES (textbook_seq.nextval, 'Relational Database', 'Ted Codd', 'IT', 2);

INSERT INTO MYTEXTBOOKTABLE
(text_id, text_name, text_author, text_publisher, faculty_ref)
VALUES (textbook_seq.nextval, 'The greatest book ever', 'Tyler Francis', 'Publish', 1);


/*** Step 7 List from MYTEXTBOOKTABLE ***/

REM SQL command here
SELECT text_id, text_author
FROM MYTEXTBOOKTABLE;


/*** Step 8 Create non-unique index ***/

REM SQL command here

CREATE INDEX textname_idx
ON MYTEXTBOOKTABLE(text_name);
      
/*** Step 9 Display details about indexes on textbook table ***/

REM SQL command here

SELECT index_name, index_type, uniqueness
FROM user_indexes 
WHERE table_name = 'MYTEXTBOOKTABLE'; 
      
/*** Step 10 Create synonym ***/

REM SQL command here
CREATE SYNONYM TEXT 
FOR MYTEXTBOOKTABLE;
            
/*** Step 11 Use synonym to list ***/

REM SQL command here
SELECT text_id, text_author
FROM TEXT;

      
/*** Step 12 Display synonym names ***/

REM SQL command here
SELECT synonym_name
FROM user_synonyms;
      
/*** Step 13 Drop schema objects ***/

REM SQL command here
DROP TABLE MYTEXTBOOKTABLE PURGE;
DROP SEQUENCE textbook_seq;
DROP SYNONYM TEXT;

/*** Step 14 End ***/

SPOOL OFF