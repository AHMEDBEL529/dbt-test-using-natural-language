-- models/employees/department_salary_stats.sql

with salary_data as (
    select
        de.dept_no,  -- Using dept_no from dept_emp
        avg(s.salary) as average_salary,
        sum(s.salary) as total_salary
    from
        {{ source('employees_source', 'salaries') }} s
    join
        {{ source('employees_source', 'dept_emp') }} de on s.emp_no = de.emp_no  -- Join using emp_no
    group by
        de.dept_no  -- Grouping by dept_no
)

select
    sd.dept_no,
    sd.average_salary,
    sd.total_salary,
    d.dept_name  -- Department name from departments table
from
    salary_data sd
join
    {{ source('employees_source', 'departments') }} d on sd.dept_no = d.dept_no;  -- Join using dept_no
