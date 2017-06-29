SPOOL H:\Comp155\labsol\lab4.txt
SET ECHO ON 
SET pagesize 100
SET linesize 200
COLUMN "Employee Name" FORMAT a20
COLUMN "Manager Name" FORMAT a20
SELECT e.first_name || ' '||  e.last_name AS "Employee Name",
	e.hire_date AS "Hire Date", 
	m.first_name || ' '|| m.last_name AS "Manager Name",
	m.hire_date AS "Hire Date"
FROM employees e, employees m
WHERE e.manager_id = m.employee_id
AND UPPER (e.last_name) >= 'S'
AND e.hire_date < m.hire_date
ORDER BY e.last_name DESC;
SPOOL OFF 