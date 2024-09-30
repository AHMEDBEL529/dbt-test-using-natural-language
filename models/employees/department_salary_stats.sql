-- models/employees/department_salary_stats.sql
with salary_data as (
    select
        department_id,
        avg(salary) as average_salary,
        sum(salary) as total_salary
    from
        {{ ref('employees') }}
    group by
        department_id
)
select
    sd.department_id,
    sd.average_salary,
    sd.total_salary,
    d.department_name
from
    salary_data sd
join
    {{ ref('departments') }} d on sd.department_id = d.id
