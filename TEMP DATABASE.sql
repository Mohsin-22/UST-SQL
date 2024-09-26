CREATE DATABASE temp;
use temp;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    hire_date DATE,
    manager_id int
);
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);
CREATE TABLE salaries (
    employee_id INT,
    salary INT,
    bonus INT,
    PRIMARY KEY (employee_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO employees (employee_id, first_name, last_name, department_id, hire_date,manager_id)
VALUES (101, 'John', 'Doe', 1, '2020-01-01',1),
       (102, 'Jane', 'Smith', 2, '2019-03-15',2),
       (103, 'Robert', 'Brown', 3, '2018-06-20',2),
       (104, 'Emily', 'Davis', 1, '2021-11-05',3),
       (105, 'Michael', 'Johnson', 4, '2017-09-10',1);
INSERT INTO departments (department_id, department_name)
VALUES (1, 'Sales'), (2, 'HR'), (3, 'IT'), (4, 'Finance');
 
INSERT INTO salaries (employee_id, salary, bonus)
VALUES (101, 60000, 5000),
       (102, 55000, 4000),
       (103, 70000, 6000),
       (104, 62000, 4500),
       (105, 80000, 7000);
       
select * from employees ;
select * from departments;
select * from salaries;

								-- INNER JOIN --
select e.first_name,e.last_name, d.department_name
from employees e
inner join departments d on e.department_id= d.department_id;
  
select e.first_name,e.last_name, d.department_name
from employees e
left join departments d on e.department_id= d.department_id;
 
select e.first_name,e.last_name, d.department_name
from employees e
right join departments d on e.department_id= d.department_id;
 
select e1.first_name as employee1,e2.first_name as employee2, e1.department_id
from employees e1
join employees e2 on e1.department_id=e2.department_id and e1.employee_id != e2.employee_id;
 
 
select e1.first_name as employee1,e2.first_name as employee2, e1.department_id
from employees e1
join employees e2 on 
e1.department_id=e2.department_id and 
e1.employee_id < e2.employee_id;
 
select e.first_name,e.last_name, d.department_name
from employees e
right  join departments d on e.department_id= d.department_id;
 
select e1.first_name as employee1,e2.first_name as employee2, e1.department_id
from employees e1
join employees e2 on e1.department_id=e2.department_id and e1.employee_id != e2.employee_id;
 
 
select e1.first_name as employee1,e2.first_name as employee2, e1.department_id
from employees e1
join employees e2 on 
e1.department_id=e2.department_id and 
e1.employee_id < e2.employee_id;

select first_name, last_name
from employees
where employee_id in(select employee_id  from salaries where  salary>(select avg(salary) from salaries));


		