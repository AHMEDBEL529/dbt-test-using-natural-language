select
    s.emp_no,
    s.salary,
    s.from_date,
    s.to_date,
    datediff(s.to_date, s.from_date) / 365 as years_in_position
from
    {{ source('employees_source', 'salaries') }} s
order by
    s.emp_no, s.from_date
