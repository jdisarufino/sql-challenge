-- -- CSV names
-- departments PRIMARY (imported csv)
-- dept_emp (imported csv)
-- dept_manager (imported csv)
-- empolyees PRIMARY (imported csv)
-- salaries (imported csv)
-- titles (imported csv)

DROP TABLE IF EXISTS departments
CREATE TABLE departments (
	dept_no VARCHAR(30) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(30) NOT NULL
);

DROP TABLE IF EXISTS dept_emp
CREATE TABLE dept_emp (
	emp_no INTEGER REFERENCES employees(emp_no),
	dept_no VARCHAR(30) REFERENCES departments(dept_no),
	from_date VARCHAR(20) NOT NULL,
	to_date VARCHAR(20) NOT NULL
);

DROP TABLE IF EXISTS dept_manager
CREATE TABLE dept_manager (
	dept_no VARCHAR(30) REFERENCES departments(dept_no),
	emp_no INTEGER REFERENCES employees(emp_no),
	from_date VARCHAR(20) NOT NULL,
	to_date VARCHAR(20) NOT NULL
);

DROP TABLE IF EXISTS employees
CREATE TABLE employees (
	emp_no SERIAL PRIMARY KEY NOT NULL,
	birth_date VARCHAR(20) NOT NULL,
	first_name VARCHAR(90) NOT NULL,
	last_name VARCHAR(90) NOT NULL,
	gender VARCHAR(10) NOT NULL,
	hire_date VARCHAR(20)
);

DROP TABLE IF EXISTS salaries
CREATE TABLE salaries (
	emp_no INTEGER REFERENCES employees(emp_no),
	salary INTEGER NOT NULL,
	from_date VARCHAR(20) NOT NULL,
	to_date VARCHAR(20) NOT NULL
);

DROP TABLE IF EXISTS titles
CREATE TABLE titles (
	emp_no INTEGER REFERENCES employees(emp_no),
	title VARCHAR(50) NOT NULL,
	from_date VARCHAR(20) NOT NULL,
	to_date VARCHAR(20) NOT NULL
);
