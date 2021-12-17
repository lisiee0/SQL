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

-- DECODE(컬럼명, 조건, 출력1,--- , else)
select  employee_id, first_name ,salary, job_id,
        decode(job_id, 'AC_ACCOUNT', salary+salary*0.1,
                       'SA_REP', salary+salary*0.2,
                       'ST_CLERK', salary+salary*0.3,
               salary) as "realSalary"
from    employees;

-- 예제
-- 직원의 이름, 부서, 팀을 출력 
-- 팀은 코드로 결정하며 부서코드가 10~50 이면 ‘A-TEAM’ 60~100이면 ‘B-TEAM’  110~150이면 ‘C-TEAM’ 나머지는 ‘팀없음’ 으로 출력하세요
select  first_name, department_id,
        case when department_id>= 10 and department_id<= 50 then 'A-team'
             when department_id>= 60 and department_id<= 100 then 'B-team'
             when department_id>= 110 and department_id<= 150 then 'C-team'
        else '팀없음'
        end "팀"
from    employees;



