-- 문제 1
select  employee_id "사번", first_name||' '||last_name "이름", d.department_name "부서명"
from    employees e, departments d
where   e.department_id= d.department_id
order by d.department_name asc, e.employee_id desc;


-- 문제 2
select  e.employee_id "사번", first_name "이름", 
        salary "급여", d.department_name "부서명", j.job_title "현재업무"
from    employees e, departments d, jobs j
where   e.department_id= d.department_id
and     e.job_id= j.job_id
order by e.employee_id asc;


-- 문제 2-1
select  e.employee_id "사번", first_name "이름", 
        salary "급여", d.department_name "부서명", j.job_title "현재업무"
from    employees e, departments d, jobs j
where   e.department_id= d.department_id(+)
and     e.job_id= j.job_id
order by e.employee_id asc;


-- 문제 3
select  l.location_id "도시아이디", city "도시명", 
        department_name "부서명", department_id "부서아이디"
from    departments d, locations l
where   d.location_id= l.location_id
order by l.location_id asc;


-- 문제 3-1
select  l.location_id "도시아이디", city "도시명", 
        department_name "부서명", department_id "부서아이디"
from    departments d, locations l
where   d.location_id(+)= l.location_id
order by l.location_id asc;


-- 문제 4
select  r.region_name "지역이름", c.country_name "나라이름"
from    regions r, countries c
where   r.region_id(+)=c.region_id
order by r.region_name asc, c.country_name desc;


-- 문제 5
select  e1.employee_id "사번", e1.first_name "이름", e1.hire_date "입사일", 
        e2.first_name "매니저이름", e2.hire_date "매니저입사일"
from    employees e1, employees e2
where   e1.manager_id= e2.employee_id
and     e1.hire_date< e2.hire_date;


-- 문제 6
select  c.country_name "나라명", c.country_id "나라아이디",
        l.city "도시명", l.location_id "도시아이디",
        d.department_name "부서명", d.department_id "부서아이디"
from    departments d, locations l, countries c
where   d.location_id= l.location_id(+)
and     l.country_id= c.country_id(+)
order by c.country_name asc;


-- 문제 7
select  e.employee_id "사번", e.first_name||' '||e.last_name "이름", e.job_id "현재업무ID",
        jh.job_id "과거업무ID", jh.start_date "시작일", jh.end_date "종료일"
from    employees e, job_history jh
where   e.employee_id= jh.employee_id
and     jh.job_id= 'AC_ACCOUNT'
and     e.job_id<> jh.job_id;


-- 문제 8
select  d.department_id "부서번호", d.department_name "부서이름", e.first_name "매니저이름",
        l.city "도시명", c.country_name "나라명", r.region_name "지역명"
from    employees e, departments d, locations l, countries c, regions r
where   e.department_id= d.department_id
and     d.location_id= l.location_id
and     l.country_id= c.country_id
and     c.region_id= r.region_id
and     e.employee_id= d.manager_id;


-- 문제 9
select  e1.employee_id "사번", e1.first_name "이름", 
        d.department_name "부서명", e2.first_name "매니저이름"
from    employees e1, employees e2, departments d
where   e1.department_id= d.department_id(+)
and     e1.manager_id= e2.employee_id;


