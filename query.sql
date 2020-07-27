--1. List the following details of each employee: employee number, last name, first name, sex, and salary
select e.emp_no as employ_number,
       last_name,
       sex,
       s.salary
from employee.employees e left join employee.salaries s on e.emp_no=s.emp_no;
--2. List first name, last name, and hire date for employees who were hired in 1986.
select e.first_name,
       e.last_name,
       e.hire_date
from employee.employees e where  to_char(e.hire_date,'yyyy')='1986';
--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select
  d.dept_no,
  d.dept_name,
  dm.emp_no,
  e.last_name,
  e.first_name
from employee.departments d , employee.dept_manager dm, employee.employees e
where d.dept_no=dm.dept_no and dm.emp_no=e.emp_no
order by d.dept_no;
--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select
  e.emp_no,
  e.last_name,
  e.first_name,
  d.dept_name
from employee.employees e, employee.departments d,employee.dept_emp de
where e.emp_no=de.emp_no and d.dept_no=de.dept_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select
   e.first_name,
   e.last_name,
   e.sex
from employee.employees e where e.first_name='Hercules' and e.last_name like 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

select
    e.emp_no,
    e.first_name,
    e.last_name,
    d.dept_name
from employee.employees e, employee.departments d,employee.dept_emp de
where e.emp_no=de.emp_no and d.dept_no=de.dept_no and dept_name='Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
from employee.employees e, employee.departments d,employee.dept_emp de
where e.emp_no=de.emp_no and d.dept_no=de.dept_no and dept_name in ('Sales','Development');

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select
   e.last_name,
   count(1) as frequency
from employee.employees e
group by e.last_name
order by frequency desc




