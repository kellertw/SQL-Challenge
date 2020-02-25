SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
    e.gender,
    s.salary
FROM employees e
JOIN salaries s
USING (emp_no)
