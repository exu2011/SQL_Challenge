

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employee e, salaries s
WHERE e.emp_no = s.emp_no
ORDER BY emp_no;

--2. List first name, last name, and hire date for employee who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employee
WHERE to_char(hire_date, 'YYYY') = '1986';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
FROM departments d, employee e, dept_manager m
WHERE d.dept_no = m.dept_no
  AND e.emp_no = m.emp_no
ORDER BY 1, 3;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employee e, dept_emp p, departments d
WHERE e.emp_no = p.emp_no
  AND p.dept_no = d.dept_no;

-- 5. List first name, last name, and sex for employee whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employee
WHERE first_name = 'Hercules'
  AND last_name like 'B%';

-- 6. List all employee in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments d
  INNER JOIN dept_emp p ON d.dept_no = p.dept_no
  INNER JOIN employee e ON e.emp_no = p.emp_no
WHERE d.dept_name = 'Sales'; 

 

-- 7. List all employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments d
  INNER JOIN dept_emp p ON d.dept_no = p.dept_no
  INNER JOIN employee e ON e.emp_no = p.emp_no
WHERE d.dept_name IN ( 'Sales', 'Development' );

 

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employee share each last name.
SELECT last_name, count(*)
FROM employee
GROUP BY last_name
ORDER BY last_name;