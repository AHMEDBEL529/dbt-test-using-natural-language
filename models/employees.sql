-- models/employees.sql

SELECT
    emp_no AS employee_id,
    first_name,
    last_name,
    hire_date
FROM
    {{ source('employees_source', 'employees') }}