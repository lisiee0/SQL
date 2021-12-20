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

-- FULL OUTER JOIN
select  *
from    employees e full outer join departments d
on      e.department_id= d.department_id;

-- SELF JOIN
select  e1.first_name||' '||e1.last_name "직원 이름", e1.employee_id, e1.phone_number, -- 직원 정보
        e2.first_name||' '||e2.last_name "매니저 이름", e2.employee_id, e2.phone_number  -- 매니저 정보
from    employees e1, employees e2
where   e1.manager_id= e2.employee_id;


