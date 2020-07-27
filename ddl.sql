CREATE SCHEMA "employee" ;
CREATE TABLE IF NOT EXISTS  employee.departments
(
    dept_no   varchar(20) NOT null constraint departments_pkey PRIMARY KEY,
    dept_name varchar(255)
);

CREATE TABLE IF NOT EXISTS  employee.titles
(
    title_id varchar(20) NOT null constraint titles_pkey PRIMARY KEY,
    title    varchar(255)
);

CREATE TABLE IF NOT EXISTS  employee.employees
(
    emp_no       varchar(20)  NOT null constraint employees_pkey PRIMARY KEY,
    emp_title_id varchar(255),
    birth_date   varchar(20),
    first_name   varchar(255),
    last_name    varchar(10),
    sex          varchar(10),
    hire_date    date
);     
ALTER TABLE employee.employees ADD CONSTRAINT employees_titles_fk FOREIGN KEY (emp_title_id) REFERENCES employee.titles (title_id);

/* add FK*/
CREATE TABLE IF NOT EXISTS  employee.salaries
(
    emp_no varchar(20),
    salary float8
);
ALTER TABLE employee.salaries ADD CONSTRAINT salaries_employees_fk FOREIGN KEY (emp_no) REFERENCES employee.employees (emp_no);


CREATE TABLE IF NOT EXISTS  employee.dept_emp
(
    emp_no  varchar(20),
    dept_no varchar(20)
);
/* add FK*/
ALTER TABLE employee.dept_emp ADD CONSTRAINT dept_emp_departments_dept_no_fk FOREIGN KEY (dept_no) REFERENCES employee.departments (dept_no);
ALTER TABLE employee.dept_emp ADD CONSTRAINT dept_emp_employees_emp_no_fk FOREIGN KEY (emp_no) REFERENCES employee.employees (emp_no) ;

CREATE TABLE IF NOT EXISTS  employee.dept_manager
(
    dept_no varchar(20),
    emp_no  varchar(20)
);
ALTER TABLE employee.dept_manager ADD CONSTRAINT dept_manager_departments_dept_no_fk FOREIGN KEY (dept_no) REFERENCES employee.departments (dept_no);
ALTER TABLE employee.dept_manager ADD CONSTRAINT dept_manager_employees_fk FOREIGN KEY (emp_no) REFERENCES employee.employees (emp_no);





