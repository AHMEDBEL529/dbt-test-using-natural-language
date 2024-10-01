select
    t.title,
    avg(s.salary) as average_salary
from
    {{ source('employees_source', 'salaries') }} s
join
    {{ source('employees_source', 'titles') }} t on s.emp_no = t.emp_no
group by
    t.title
order by
    average_salary desc
