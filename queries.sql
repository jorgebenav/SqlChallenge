
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
