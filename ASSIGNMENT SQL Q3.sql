use temp;

SELECT employees.employee_id,
employees.first_name AS employee_first_name,
employees.last_name AS employee_last_name,
departments.department_name,
managers.first_name AS manager_first_name,

salaries.salary
FROM employees
JOIN departments ON employees.department_id   =   departments.department_id
LEFT JOIN employees AS managers ON employees.manager_id   =   managers.employee_id
JOIN salaries  ON  employees.employee_id   =   salaries.employee_id;