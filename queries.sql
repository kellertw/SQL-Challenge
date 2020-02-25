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
