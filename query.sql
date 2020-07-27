/*1. List the following details of each employee: employee number, last name, first name, sex, and salary*/
SELECT e.emp_no AS employ_number,
       last_name,
       sex,
       s.salary
FROM employee.employees e left join employee.salaries s ON e.emp_no=s.emp_no;
/*2. List first name, last name, and hire date for employees who were hired in 1986.*/
SELECT e.first_name,
       e.last_name,
       e.hire_date
FROM employee.employees e WHERE  to_char(e.hire_date,'yyyy')='1986';
/*3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.*/
SELECT
  d.dept_no,
  d.dept_name,
  dm.emp_no,
  e.last_name,
  e.first_name
FROM employee.departments d , employee.dept_manager dm, employee.employees e
WHERE d.dept_no=dm.dept_no AND dm.emp_no=e.emp_no
ORDER BY d.dept_no;
/*4. List the department of each employee with the following information: employee number, last name, first name, and department name.*/
SELECT
  e.emp_no,
  e.last_name,
  e.first_name,
  d.dept_name
FROM employee.employees e, employee.departments d,employee.dept_emp de
WHERE e.emp_no=de.emp_no AND d.dept_no=de.dept_no;

/*5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."*/
SELECT
   e.first_name,
   e.last_name,
   e.sex
FROM employee.employees e WHERE e.first_name='Hercules' AND e.last_name LIKE 'B%';

/*6. List all employees in the Sales department, including their employee number, last name, first name, and department name.*/

SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    d.dept_name
FROM employee.employees e, employee.departments d,employee.dept_emp de
WHERE e.emp_no=de.emp_no AND d.dept_no=de.dept_no AND dept_name='Sales';

/*7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.*/
SELECT
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM employee.employees e, employee.departments d,employee.dept_emp de
WHERE e.emp_no=de.emp_no AND d.dept_no=de.dept_no AND dept_name IN ('Sales','Development');

/*8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.*/
SELECT
   e.last_name,
   count(1) AS frequency
FROM employee.employees e
GROUP BY e.last_name
ORDER BY frequency DESC





