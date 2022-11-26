
-- Jeff Pinegar
-- Nov 30, 2022
-- SQL Challange

-- *********************
-- Data Analysis
-- *********************

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
select emp.emp_id, emp.last_name, emp.first_name, emp.sex, salaries.salaries
	from hr.emp join hr.salaries
	on emp.emp_id = salaries.emp_id
	order by emp.emp_id
-- REsults in: Q1_Employee_salaries.csv


-- 2. List first name, last name, and hire date for employees who were hired in 1986.
select emp.emp_id, emp.last_name, emp.first_name, emp.hire_date
	from hr.emp
	where emp.hire_date > '1986-01-10' and emp.hire_date < '1986-12-31'
	order by emp.emp_id
-- Results in:  Q2_Employees_hired_in_1986.csv


-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select depts.dept_id
	, depts.dept_name
	, dept_mgr.emp_id as Manager_Emp_id
	, emp.last_name as Manager_Last_Name
	, emp.first_name as Manager_First_Name
	from dept.dept_mgr
	join dept.depts on depts.dept_id = dept_mgr.dept_id
	join hr.emp on emp.emp_id = dept_mgr.emp_id
-- Results in:  Q3_Department Managers.csv


-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select emp.emp_id, emp.last_name, emp.first_name, depts.dept_name
	From dept.dept_emp 
	join hr.emp on emp.emp_id = dept_emp.emp_id
	join dept.depts on dept_emp.dept_id = depts.dept_id	
	order by emp.emp_id
-- The list is longer than the number of employee's because people work in more than one department
-- Results in:  Q4_Employee_dept_list.cvs


-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select emp.emp_id, emp.first_name, emp.last_name, emp.sex
	from hr.emp
	where emp.first_name = 'Hercules' and substring(emp.last_name,1,1) = 'B'
	order by emp.emp_id
-- Results in:  Q5_Employee_Hercules_B.cvs


-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select emp.emp_id, emp.last_name, emp.first_name, depts.dept_name
	From dept.dept_emp 
	join hr.emp on emp.emp_id = dept_emp.emp_id
	join dept.depts on dept_emp.dept_id = depts.dept_id
	where depts.dept_name = 'Sales'
	order by emp.emp_id
-- Results in:  Q6_Employee_Sales.cvs


-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select emp.emp_id, emp.last_name, emp.first_name, depts.dept_name
	From dept.dept_emp 
	join hr.emp on emp.emp_id = dept_emp.emp_id
	join dept.depts on dept_emp.dept_id = depts.dept_id
	where depts.dept_name = 'Sales' or depts.dept_name = 'Development'
	order by  depts.dept_name, emp.emp_id 
-- Results in: Q7_Employee_Dev_or_Sales.csv


-- 8. List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.
select emp.last_name, count(emp_id)
	from hr.emp
	Group by emp.last_name
	order by count DESC

-- Results in:  Q8_Last_name_freq_count.csv

select emp.first_name, count(emp_id)
	from hr.emp
	Group by emp.first_name
	order by count DESC
-- Another reason to believe this is fake data is there are only 1638 unique last names and 1276 unique first names in pool of +300k employees