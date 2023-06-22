-- List the employee number, last name, first name, sex, and salary of each employee.

SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM dept_manager;
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM titles;

SELECT 
	employees.emp_no AS "Employee_#",
	last_name AS "Last_Name",
	first_name AS "Frist_Name",
	salaries AS "Salaries"
FROM 
	employees
LEFT JOIN salaries
ON employees.emp_no = salaries.emp_no;
	

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT 
	first_name AS "Frist Name",
	last_name AS "Last Name",
	hire_date AS "Hire Date"
FROM
	employees
WHERE 
	hire_date LIKE '_/_/1986'


--List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT
	departments.dept_no ,
	departments.dept_name,
	dept_manager.emp_no,
	employees.last_name,
	employees.first_name
	
FROM 
	departments

INNER JOIN
	dept_manager ON dept_manager.dept_no = departments.dept_no
LEFT JOIN 
	employees ON employees.emp_no = dept_manager.emp_no ;



--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT 
	dept_emp.dept_no AS "Department #",
	employees.emp_no AS "Employee #",
	employees.last_name AS "Last Name",
	employees.first_name AS "First Name",
	departments.dept_name AS "Department"

FROM 
	employees

LEFT JOIN
	dept_emp ON dept_emp.emp_no = employees.emp_no

LEFT JOIN
	departments ON departments.dept_no = dept_emp.dept_no;


--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT 
	first_name AS "First Name",
	last_name AS "Last Name",
	sex AS "Sex"

FROM 
	employees

WHERE 
	first_name = 'Hercules' 
AND 
	last_name LIKE 'B%';
	
--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT 
	employees.emp_no AS "Employee #",
	employees.last_name AS "Last Name",
	employees.first_name AS "First Name"

FROM 
	employees

LEFT JOIN
	dept_emp ON dept_emp.emp_no = employees.emp_no

LEFT JOIN
	departments ON departments.dept_no = dept_emp.dept_no

WHERE 
	departments.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT 
	employees.emp_no AS "Employee #",
	employees.last_name AS "Last Name",
	employees.first_name AS "First Name",
	departments.dept_name AS "Department"

FROM 
	employees

LEFT JOIN
	dept_emp ON dept_emp.emp_no = employees.emp_no

LEFT JOIN
	departments ON departments.dept_no = dept_emp.dept_no

WHERE 
	departments.dept_name = 'Sales'
	OR 
		departments.dept_name = 'Development';


--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT
	last_name AS "Last Name",
	COUNT (last_name) AS "Frequency"

FROM 
	employees

GROUP BY 
	last_name

ORDER BY 
	COUNT(last_name) DESC;


