-- models/employees/employees_summary.sql
with employee_data as (
    select
        department_id,
        count(*) as employee_count
    from
        {{ ref('employees') }}  -- Reference to the base employees table
    group by
        department_id
)
select
    ed.department_id,
    ed.employee_count,
    d.department_name
from
    employee_data ed
join
    {{ ref('departments') }} d on ed.department_id = d.id
