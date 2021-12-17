-- GROUP BY 절

select  nvl(department_id, 0), 
        to_char(round(avg(salary), 2), '$999,999')
from    employees
group by department_id
order by department_id asc;

--
select  department_id, job_id, count(*), avg(salary)
from    employees
group by department_id, job_id
order by department_id;

-- 예제
-- 연봉의 합계가 20000 이상인 부서의 부서 번호와 , 인원수, 급여합계 출력
select  department_id, count(*), sum(salary)
from    employees
group by department_id
-- where절 사용불가
having  sum(salary)>= 20000;

-- 연봉 합계가 20000 이상이고, 부서번호가 100인 부서의 부서 번호와 , 인원수, 급여합계 출력
select  department_id, count(*), sum(salary)
from    employees
group by department_id
having  sum(salary)>= 20000
and     department_id= 100;

--CASE ~END문
select  employee_id, first_name, salary, job_id,
        case when job_id= 'AC_ACCOUNT' then salary+salary*0.1
             when job_id= 'SA_REP' then salary+salary*0.2
             when job_id= 'ST_CLERK' then salary+salary*0.3
             else salary
        end "Bonus"    
from    employees;





