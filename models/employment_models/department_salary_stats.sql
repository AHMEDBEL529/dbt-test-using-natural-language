select
    de.dept_no, 
    avg(s.salary) as average_salary,
    sum(s.salary) as total_salary,
    d.dept_name  
from
    {{ source('employees_source', 'salaries') }} s
join
    {{ source('employees_source', 'dept_emp') }} de 
    on s.emp_no = de.emp_no 
join
    {{ source('employees_source', 'departments') }} d 
    on de.dept_no = d.dept_no  
group by
    de.dept_no, d.dept_name 
