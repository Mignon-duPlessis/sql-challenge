--1)List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees AS e
INNER JOIN salaries AS s
ON e.emp_no = s.emp_no


--2)List employees who were hired in 1986.

SELECT hire_date 
FROM employees
WHERE hire_date LIKE '1986%';

--3)List the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates.

SELECT dm.dept_no, dm.emp_no, dm.from_date , dm.to_date, dep.dept_name, emp.first_name, emp.last_name
FROM dep_manager AS dm
INNER JOIN departments AS dep
ON dm.dept_no = dep.dept_no
INNER JOIN employees AS emp
ON dm.emp_no = emp.emp_no;

--4)List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT de.emp_no , emp.last_name , emp.first_name, dept.dept_name
FROM dep_emp AS de
INNER JOIN employees AS emp
ON de.emp_no = emp.emp_no
INNER JOIN departments AS dept
ON de.dept_no = dept.dept_no;

--5)List all employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name
FROM employees
WHERE (first_name = 'Hercules')
AND (last_name LIKE 'B%');

--6)List all employees in the Sales department, including their employee number,
--last name, first name, and department name.

SELECT emp.last_name , emp.first_name, dept.dept_name
FROM dep_emp AS de
INNER JOIN employees AS emp
ON de.emp_no = emp.emp_no
INNER JOIN departments AS dept
ON de.dept_no = dept.dept_no
WHERE dept_name = 'Sales';

--7)List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.

SELECT de.emp_no , emp.last_name , emp.first_name, dept.dept_name
FROM dep_emp AS de
INNER JOIN employees AS emp
ON de.emp_no = emp.emp_no
INNER JOIN departments AS dept
ON de.dept_no = dept.dept_no
WHERE dept_name IN ('Sales', 'Development');

--8)In descending order, list the frequency count of employee last names, i.e., 
--how many employees share each last name.

SELECT last_name, COUNT(last_name) AS frequency_count
FROM employees
GROUP BY last_name
ORDER BY frequency_count DESC;

