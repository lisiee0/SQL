/*********************
*        JOIN
*********************/


select  first_name, salary, d.department_id, d.department_name
from    employees e, departments d
where   e.department_id= d.department_id;


-- OUTER JOIN
-- LEFT OUTER JOIN
select  e.first_name, e.salary, e.department_id, d.department_id, d.department_name
from    employees e left outer join departments d
on      e.department_id= d.department_id;







