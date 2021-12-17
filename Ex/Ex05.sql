/***********************
*      JOIN
***********************/

-- col:15 row:2889 (107*27)
select  *
from    employees, departments;

-- c11 r107
select  *
from    employees;

-- c4 r27
select  *
from    departments;


select  employee_id, first_name, salary, department_name,
        em.department_id, de.department_id
from    employees em, departments de
where   em.department_id= de.department_id;

-- 예제
-- 모든 직원이름, 부서이름, 업무명을 출력
select  first_name||' '||last_name "이름", 
        department_name "부서명", 
        job_title "업무명"
from    employees em, departments de, jobs js
where   em.job_id= js.job_id
and     em.department_id= de.department_id;




