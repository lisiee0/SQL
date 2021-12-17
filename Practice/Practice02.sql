-- 문제 1
select  count(*) "haveMngCnt"
from    employees
where   manager_id is not null;

-- 문제 2
select  max(max_salary)||', '|| min(min_salary) "최고임금, 최저임금",
        max(max_salary)-min(min_salary) "최고임금-최저임금"
from    jobs;

-- 문제 3
select  to_char(max(hire_date), 'YYYY"년"MM"월"DD"일"')
from    employees;

-- 문제 4
select  department_id, 
        avg(salary) "평균임금", 
        max(salary) "최고임금", 
        min(salary) "최저임금"
from    employees
group by department_id
order by department_id desc;

-- 문제 5
select  job_id, round(avg(salary), 0), max(salary), min(salary)
from    employees
group by job_id
order by min(salary) desc, avg(salary) asc;

-- 문제 6
select  to_char(min(hire_date), 'YYYY-MM-DD DAY')
from    employees;

-- 문제 7
select  avg(salary), min(salary), avg(salary)-min(salary)
from    employees
group by department_id
having  avg(salary)-min(salary)< 2000
order by avg(salary)-min(salary) desc;

-- 문제 8
select  job_id, max(salary)-min(salary)
from    employees
group by job_id
order by max(salary)-min(salary) desc;


-- 문제 9
select  manager_id, round(avg(salary),0), min(salary), max(salary)
from    employees
where   hire_date> '05-12-31'
group by manager_id
having  avg(salary)>= 5000
order by avg(salary) desc;

-- 문제 10
select  first_name||' '||last_name,
        case when hire_date< '02/12/31' then '창립멤버'
             when hire_date>= '03/01/01' and hire_date< '04/01/01' then '03년입사'
             when hire_date>= '04/01/01' and hire_date< '05/01/01' then '04년입사'
        else '상장이후입사'
        end as "optDate"
from    employees
order by hire_date asc;