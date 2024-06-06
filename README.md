Creation of the table is here:
CREATE TABLE employees (
    emp_no INT NOT NULL,
    emp_title_id VARCHAR(255) NOT NULL,
    birth_date VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    sex VARCHAR(255) NOT NULL,
    hire_date DATE NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY (emp_no)
);

CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL
);

CREATE TABLE titles (
    title_id VARCHAR(255) NOT NULL,
    title VARCHAR(255) NOT NULL,
    CONSTRAINT pk_titles PRIMARY KEY (title_id)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR(255) NOT NULL,
    emp_no INT NOT NULL
);

CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(255) NOT NULL
);

CREATE TABLE department (
    dept_no VARCHAR(255) NOT NULL,
    dept_name VARCHAR(255) NOT NULL,
    CONSTRAINT pk_department PRIMARY KEY (dept_no)
);

ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_title_id FOREIGN KEY (emp_title_id)
REFERENCES titles (title_id);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY (emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY (dept_no)
REFERENCES department (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY (emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY (emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY (dept_no)
REFERENCES department (dept_no);
Creation of the Data Analysis  is here:
---Data Analysis
---first 

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s
ON e.emp_no = s.emp_no;
----Two

SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986 
ORDER BY hire_date ASC;
----Three

SELECT m.emp_no, m.dept_no, d.dept_name, e.last_name, e.first_name
FROM dept_manager m
JOIN department d
ON m.dept_no = d.dept_no
JOIN employees e
ON m.emp_no = e.emp_no;
----Four

SELECT y.dept_no, y.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp y
JOIN employees e
ON  y.emp_no = e.emp_no
JOIN department d
ON  y.dept_no = d.dept_no;
-----five

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
----six
	
SELECT e.emp_no, e.last_name, e.first_name 
FROM dept_emp y
JOIN employees e ON y.emp_no = e.emp_no
JOIN department d ON y.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp y
JOIN employees e ON y.emp_no = e.emp_no
JOIN department d ON y.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development' ;

SELECT last_name, COUNT(emp_no) AS count
FROM employees
GROUP BY last_name
ORDER BY count DESC;
