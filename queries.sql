-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
    e.gender,
    s.salary
FROM employees e
JOIN salaries s
USING (emp_no)

-- 2. List employees who were hired in 1986.
SELECT 
    e.last_name,
    e.first_name,
	e.hire_date,
	EXTRACT (YEAR from e.hire_date) as YEAR
FROM 
	employees e
WHERE hire_date > '12/31/1985' and hire_date < '01/01/1987';

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT 
    m.dept_no,
	d.dept_name,
    e.emp_no,
    e.last_name,
    e.first_name,
    e.hire_date,
    m.to_date   
FROM dept_manager m
JOIN employees e ON
m.emp_no = e.emp_no
JOIN  departments d ON
m.dept_no=d.dept_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT 
	d.dept_name,
    e.emp_no,
    e.last_name,
    e.first_name   
FROM dept_emp p
JOIN employees e ON
p.emp_no = e.emp_no
JOIN  departments d ON
p.dept_no=d.dept_no;    

-- List all employees whose first name is "Hercules" and last names begin with "B."
select 
	e.first_name,
	e.last_name
from employees e
where first_name = 'Hercules' and last_name like 'B%'; 

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT 
	d.dept_name,
    e.emp_no,
    e.last_name,
    e.first_name  
FROM dept_emp p
JOIN employees e ON
p.emp_no = e.emp_no
JOIN  departments d ON
p.dept_no=d.dept_no 
WHERE d.dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT 
	d.dept_name,
    e.emp_no,
    e.last_name,
    e.first_name 
FROM dept_emp p
JOIN employees e ON
p.emp_no = e.emp_no
JOIN  departments d ON
p.dept_no=d.dept_no 
WHERE d.dept_name = 'Sales' or d.dept_name = 'Development';

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT 
    e.last_name,
	count (last_name) as no
FROM employees e
group by last_name
order by no desc;