use temp;
										-- SELECTING DEPARTMENTS TOTAL,AVG MAX SALARY  --
SELECT employees.employee_id,
employees.first_name,
employees.last_name,
departments.department_name,
salaries.salary,

(SELECT SUM(salaries.salary) FROM employees AS e 
JOIN salaries ON e.employee_id = salaries.employee_id 
WHERE e.department_id = employees.department_id) AS total_salary_expenditure,

(SELECT AVG(salaries.salary) FROM employees AS e 
JOIN salaries ON e.employee_id = salaries.employee_id 
WHERE e.department_id = employees.department_id) AS avg_pay,

(SELECT MAX(salaries.salary) FROM employees AS e 
JOIN salaries ON e.employee_id = salaries.employee_id 
WHERE e.department_id = employees.department_id) AS max_pay

FROM employees
JOIN departments ON employees.department_id = departments.department_id
JOIN salaries ON employees.employee_id = salaries.employee_id;