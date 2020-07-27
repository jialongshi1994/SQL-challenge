CREATE SCHEMA "employee" ;
CREATE TABLE IF NOT EXISTS  employee.departments
(
    dept_no   VARCHAR(20) NOT null constraint departments_pkey PRIMARY KEY,
    dept_name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS  employee.titles
(
    title_id VARCHAR(20) NOT null constraint titles_pkey PRIMARY KEY,
    title    VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS  employee.employees
(
    emp_no       VARCHAR(20)  NOT null constraint employees_pkey PRIMARY KEY,
    emp_title_id VARCHAR(255),
    birth_date   VARCHAR(20),
    first_name   VARCHAR(255),
    last_name    VARCHAR(10),
    sex          VARCHAR(10),
    hire_date    DATE
);     
ALTER TABLE employee.employees ADD CONSTRAINT employees_titles_fk FOREIGN KEY (emp_title_id) REFERENCES employee.titles (title_id);

/* add FK*/
CREATE TABLE IF NOT EXISTS  employee.salaries
(
    emp_no VARCHAR(20),
    salary FLOAT(8)
);
ALTER TABLE employee.salaries ADD CONSTRAINT salaries_employees_fk FOREIGN KEY (emp_no) REFERENCES employee.employees (emp_no);


CREATE TABLE IF NOT EXISTS  employee.dept_emp
(
    emp_no  VARCHAR(20),
    dept_no VARCHAR(20)
);
/* add FK*/
ALTER TABLE employee.dept_emp ADD CONSTRAINT dept_emp_departments_dept_no_fk FOREIGN KEY (dept_no) REFERENCES employee.departments (dept_no);
ALTER TABLE employee.dept_emp ADD CONSTRAINT dept_emp_employees_emp_no_fk FOREIGN KEY (emp_no) REFERENCES employee.employees (emp_no) ;

CREATE TABLE IF NOT EXISTS  employee.dept_manager
(
    dept_no VARCHAR(20),
    emp_no  VARCHAR(20)
);
ALTER TABLE employee.dept_manager ADD CONSTRAINT dept_manager_departments_dept_no_fk FOREIGN KEY (dept_no) REFERENCES employee.departments (dept_no);
ALTER TABLE employee.dept_manager ADD CONSTRAINT dept_manager_employees_fk FOREIGN KEY (emp_no) REFERENCES employee.employees (emp_no);





