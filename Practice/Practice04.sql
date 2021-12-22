-- 문제 1
select  count(*)
from    employees
where   salary< (select   avg(salary)
                 from     employees);


-- 문제 2
select  employee_id "직원번호", first_name "이름", salary "급여"
from    employees
where   salary>= (select  avg(salary)
                  from    employees)
and     salary<= (select  max(salary)
                  from    employees)
order by salary asc;


-- 문제 3
select  l.location_id "도시아이디", street_address "거리명", 
        postal_code "우편번호", city "도시명", 
        state_province "주", country_id "나라아이디"
from    employees e, departments d, locations l
where   e.department_id= d.department_id
and     d.location_id= l.location_id
and     first_name in 'Steven'
and     last_name in 'King';


-- 문제 4
select  employee_id "사번", first_name "이름", salary "급여"
from    employees
where   salary <any (select  salary
                     from    employees
                     where   job_id= 'ST_MAN')
order by salary desc;        


-- 문제 5
-- 조건절 비교
select  employee_id "사번", first_name "이름", salary "급여", department_id "부서번호"
from    employees
where   (department_id, salary) in (select  department_id, max(salary)
                                    from    employees
                                    group by department_id)
order by salary desc;

-- 테이블 조인
select  e.employee_id "사번", e.first_name "이름", e.salary "급여", e.department_id "부서번호"
from    employees e, (select  department_id, max(salary) salary
                      from    employees
                      group by department_id) s
where   e.department_id= s.department_id
and     e.salary= s.salary
order by e.salary desc;


-- 문제 6
select  job_title "업무명", e.salary "급여합계"
from    jobs j, (select  job_id, sum(salary) salary
                 from    employees
                 group by job_id) e
where   e.job_id= j.job_id
order by e.salary desc;


-- 문제 7
select  e.employee_id "직원번호", e.first_name "이름", e.salary "급여"
from    employees e, (select  department_id, avg(salary) salary
                       from    employees              
                       group by department_id) s
where   e.department_id= s.department_id
and     e.salary> s.salary;


-- 문제 8        
select  r.rno "입사순위", employee_id "직원번호", first_name "이름", salary "급여", hire_date "입사일"
from    (select  rownum rno,
                 employee_id, first_name, salary, hire_date
         from    (select  employee_id, first_name, salary, hire_date
                  from    employees
                  order by hire_date asc) o) r
where   r.rno between 11 and 15;                 

