-- models/employees/employee_performance.sql
select
    e.id as employee_id,
    e.first_name,
    e.last_name,
    sum(s.sales_amount) as total_sales
from
    {{ ref('employees') }} e
left join
    {{ ref('sales') }} s on e.id = s.employee_id
group by
    e.id, e.first_name, e.last_name
order by
    total_sales desc
