-- Jeff Pinegar
-- Nov 30, 2022
-- SQL Challange

-- Code to create the tables and keys

-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/jvsBOg

-- *****************************************************************
-- I modified the  export to split into two schemas 'hr' and 'dept'
-- ****************************************************************


-- hr schemas employee table
CREATE TABLE hr.emp (
    "emp_id" int   NOT NULL,
    "emp_title_id" character(5)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(20)   NOT NULL,
    "last_name" varchar(30)   NOT NULL,
    "sex" character(1)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_emp" PRIMARY KEY (
        "emp_id"
     )
);


-- hr schemas employee salaries
CREATE TABLE hr.salaries (
    "emp_id" int   NOT NULL,
    "salaries" money   NOT NULL
);

-- hr schemas titles table
CREATE TABLE hr.titles (
    "title_id" character(5)   NOT NULL,
    "title" varchar(50)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);


-- dept schemas dept_emp table
CREATE TABLE dept.dept_emp (
    "emp_id" int   NOT NULL,
    "dept_id" char(4)   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_id","dept_id"
     )
);


-- dept schemas dept_mgr table
CREATE TABLE dept.dept_mgr (
    "dept_id" char(4)   NOT NULL,
    "emp_id" int   NOT NULL,
    CONSTRAINT "pk_dept_mgr" PRIMARY KEY (
        "dept_id","emp_id"
     )
);


-- dept schemas depts table
CREATE TABLE dept.depts (
    "dept_id" char(4)   NOT NULL,
    "dept_name" varchar(50)   NOT NULL,
    CONSTRAINT "pk_depts" PRIMARY KEY (
        "dept_id"
     )
);


-- Alter tables to add forign keys
ALTER TABLE hr.emp ADD CONSTRAINT "fk_emp_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES hr.titles ("title_id");

ALTER TABLE hr.salaries ADD CONSTRAINT "fk_salaries_emp_id" FOREIGN KEY("emp_id")
REFERENCES hr.emp ("emp_id");

ALTER TABLE dept.dept_emp ADD CONSTRAINT "fk_dept_emp_emp_id" FOREIGN KEY("emp_id")
REFERENCES hr.emp ("emp_id");

ALTER TABLE dept.dept_emp ADD CONSTRAINT "fk_dept_emp_dept_id" FOREIGN KEY("dept_id")
REFERENCES dept.depts ("dept_id");

ALTER TABLE dept.dept_mgr ADD CONSTRAINT "fk_dept_mgr_dept_id" FOREIGN KEY("dept_id")
REFERENCES dept.depts ("dept_id");

ALTER TABLE dept.dept_mgr ADD CONSTRAINT "fk_dept_mgr_emp_id" FOREIGN KEY("emp_id")
REFERENCES dept.emp ("emp_id");

