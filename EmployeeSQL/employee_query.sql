-- ###################### --
-- ###  DATA QUERIES  ### --
-- ###################### --

-- (1) List the following details of each employee: 
-- 			employee number, last name, first name, gender, and salary.
SELECT  e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees AS e
	JOIN salaries AS s
	ON (e.emp_no = s.emp_no)	
;

-- (2) List employees who were hired in 1986.
SELECT  e.emp_no, e.last_name, e.first_name, e.hire_date
FROM employees AS e
WHERE e.hire_date LIKE '1986%'
;

-- (3) List the manager of each department with the following information: 
--			department number, department name, 
--			the manager's employee number, last name, first name, and start and end employment dates.
SELECT mgmt.dept_no, dept.dept_name, e.last_name, e.first_name, mgmt.from_date, mgmt.to_date
FROM dept_manager AS mgmt
	JOIN departments AS dept
	ON (dept.dept_no = mgmt.dept_no)
		JOIN employees AS e
		ON (e.emp_no = mgmt.emp_no)
;

-- (4) List the department of each employee with the following information: 
--			employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, dept.dept_name
FROM employees AS e
	JOIN dept_emp
	ON (e.emp_no = dept_emp.emp_no)
		JOIN departments AS dept
		ON (dept_emp.dept_no = dept.dept_no)
;

-- (5) List all employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.emp_no, employees.first_name, employees.last_name
FROM employees
WHERE employees.first_name = 'Hercules' 
AND employees.last_name LIKE 'B%'
;

-- (6) List all employees in the Sales department, 
--			including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, dept.dept_name
FROM employees AS e
	JOIN dept_emp
	ON (e.emp_no = dept_emp.emp_no)
		JOIN departments AS dept
		ON (dept_emp.dept_no = dept.dept_no)
			WHERE dept.dept_name = 'Sales'
;

-- (7) List all employees in the Sales and Development departments, 
--			including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, dept.dept_name
FROM employees AS e
	JOIN dept_emp
	ON (e.emp_no = dept_emp.emp_no)
		JOIN departments AS dept
		ON (dept_emp.dept_no = dept.dept_no)
			WHERE dept.dept_name = 'Sales' OR dept.dept_name = 'Development'
				ORDER BY dept.dept_name
;

-- (8) In descending order, list the frequency count of employee last names, 
--			i.e., how many employees share each last name.
SELECT e.last_name, COUNT(*) AS name_count
FROM employees AS e
GROUP BY e.last_name
ORDER BY name_count DESC
; 

--