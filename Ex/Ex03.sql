/* 그룹함수 */

-- 오류발생 --> 1개의 row에 표현불가
select  first_name, avg(salary)
from    employees;

-- AVG():평균
select  round(avg(salary), 2) --소수점 2째자리까지 출력 (반올림)
from    employees;

select  count(*), sum(salary), avg(salary)
from    employees;

select  count(*), sum(salary),
        avg(nvl(salary, 0)) -- null값을 0으로
from    employees;        

-- COUNT():함수에 입력되는 데이터의 총 건수
select  count(*),
        count(commission_pct),
        count(department_id)
from    employees;

-- 급여가 16000이상인 사람들의 급여 평균
select  avg(salary)
from    employees
where   salary> 16000;

-- SUM():합계
select  sum(salary), count(*)
from    employees
where   salary> 16000;

-- MAX() / MIN()
select  count(*), max(salary), min(salary)
from    employees;

/************************
* GROUP BY절 
************************/

select  department_id, 
        to_char(round(avg(salary), 2), '$999,999.99') "부서별 급여평균"
from    employees
group by department_id
order by department_id asc;


select  *
from    employees;

