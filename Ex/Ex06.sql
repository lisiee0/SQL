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

-- 오라클 표현
select  count(*)
from    employees e, departments d
where   e.department_id= d.department_id(+);


-- RIGHT OUTER JOIN
select  e.first_name, e.salary, e.department_id, d.department_id, d.department_name
from    employees e right outer join departments d
on      e.department_id= d.department_id;

-- 오라클 표현
select  count(*)
from    employees e, departments d
where   e.department_id(+)= d.department_id;


-- RIGHT OUTER JOIN --> LEFT OUTER JOIN
select  e.first_name, e.salary, e.department_id, d.department_id, d.department_name
from    departments d left outer join employees e
on      d.department_id= e.department_id;

-- 오라클 표현
select  e.first_name, e.salary, e.department_id, d.department_id, d.department_name
from    departments d, employees e
where   d.department_id= e.department_id(+);

-- full outer join
select  *
from    employees e full outer join departments d
on      e.department_id= d.department_id;




