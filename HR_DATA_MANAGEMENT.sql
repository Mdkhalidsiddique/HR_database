use hr;
/*1st query*/
SELECT location_id, street_address, city, state_province, country_id
FROM locations;
/*2nd query*/
SELECT first_name ,last_name, department_id
from employees;
/*3rd query*/
SELECT first_name, last_name, department_id
FROM employees
WHERE city='London';
/*4th query*/
select employee_id, last_name, manager_id
from employees;
/*5th query*/
select first_name, last_name, hire_date from employees
where strcmp(first_name, 'john') > 0;
/*6th query*/
SELECT department_name AS 'Department Name', 
COUNT(*) AS 'No of Employees' 
FROM departments 
INNER JOIN employees 
ON employees.department_id = departments.department_id 
GROUP BY departments.department_id, department_name 
ORDER BY department_name;

/*7th query*/
SELECT first_name, last_name, hire_date, salary, 
(DATEDIFF(now(), hire_date))/365 Experience 
FROM departments d JOIN employees e 
ON (d.manager_id = e.employee_id) 
WHERE (DATEDIFF(now(), hire_date))/365>15;

/*8th query*/
SELECT first_name, last_name, salary
from employees
where salary > 5000;

/*9th query*/
SELECT first_name, last_name 
FROM employees 
WHERE department_id 
IN (SELECT department_id FROM departments WHERE department_name='IT');
/*10th query*/
SELECT FIRST_NAME, LAST_NAME, SALARY 
FROM employees 
WHERE SALARY > 
(SELECT salary FROM employees WHERE last_name = 'Bull');


/*11th query*/
SELECT first_name, last_name, salary FROM employees 
WHERE salary > (SELECT AVG(salary) FROM employees);
/*12th query*/
SELECT first_name, last_name, salary 
FROM employees 
WHERE employees.salary = (SELECT min_salary
FROM jobs
WHERE employees.job_id = jobs.job_id);
/*13th query*/
SELECT first_name, last_name, salary 
FROM employees 
WHERE department_id IN 
(SELECT department_id FROM departments WHERE department_name LIKE 'IT%') 
AND salary > (SELECT avg(salary) FROM employees);
/*14th query*/
SELECT * FROM employees 
WHERE salary = (SELECT MIN(salary) FROM employees);
/*15th query*/
SELECT first_name,last_name, job_id, salary 
FROM employees 
WHERE salary > 
ALL (SELECT salary FROM employees WHERE job_id = 'SH_CLERK') ORDER BY salary;