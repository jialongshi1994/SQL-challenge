CREATE SCHEMA "employee" ;
create table if not exists  employee.departments
(
    dept_no   varchar(20) not null constraint departments_pkey primary key,
    dept_name varchar(255)
);

create table if not exists  employee.titles
(
    title_id varchar(20) not null constraint titles_pkey primary key,
    title    varchar(255)
);

create table if not exists  employee.employees
(
    emp_no       varchar(20)  not null constraint employees_pkey primary key,
    emp_title_id varchar(255),
    birth_date   varchar(20),
    first_name   varchar(255),
    last_name    varchar(10),
    sex          varchar(10),
    hire_date    date
);     
alter table employee.employees add constraint employees_titles_fk foreign key (emp_title_id) references employee.titles (title_id);

-- add FK
create table if not exists  employee.salaries
(
    emp_no varchar(20),
    salary float8
);
alter table employee.salaries add constraint salaries_employees_fk foreign key (emp_no) references employee.employees (emp_no);


create table if not exists  employee.dept_emp
(
    emp_no  varchar(20),
    dept_no varchar(20)
);
-- add FK
alter table employee.dept_emp add constraint dept_emp_departments_dept_no_fk foreign key (dept_no) references employee.departments (dept_no);
alter table employee.dept_emp add constraint dept_emp_employees_emp_no_fk foreign key (emp_no) references employee.employees (emp_no) ;

create table if not exists  employee.dept_manager
(
    dept_no varchar(20),
    emp_no  varchar(20)
);
alter table employee.dept_manager add constraint dept_manager_departments_dept_no_fk foreign key (dept_no) references employee.departments (dept_no);
alter table employee.dept_manager add constraint dept_manager_employees_fk foreign key (emp_no) references employee.employees (emp_no);





