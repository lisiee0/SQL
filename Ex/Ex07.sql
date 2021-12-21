/********************
*    SUB QUERY
********************/

-- Den보다 급여가 많은 사람 first_name, salary 출력하기
-- 1. 전체 쿼리문 구조
select  first_name, salary
from    employees
where   salary> 'Den의 급여'; 

-- 2. Den의 급여
select  salary
from    employees
where   first_name= 'Den';

-- 3. 쿼리문 완성 (SUB QUERY)사용
select  first_name, salary
from    employees
where   salary> (select  salary
                 from    employees
                 where   first_name= 'Den');

-- 예제
-- 급여를 가장 적게 받는 사람의 이름, 급여, 사원번호 출력
select  first_name, salary, employee_id
from    employees
where   salary= (select  min(salary)
                 from    employees);
                 
-- 평균 급여보다 적게 받는 사람의 이름, 급여 출력 
select  first_name, salary
from    employees
where   salary< (select  avg(salary)
                 from    employees);



/*************************
*     다중행 SUB QUERY
*************************/


-- 부서번호가 110인 직원과 같은 급여를 받는 모든 직원의 사번, 이름, 급여 출력
-- 부서번호가 110인 직원 리스트
select  employee_id, first_name, salary, department_id
from    employees
where   department_id= 110;

-- 부서번호 110인 직원의 급여를 알 경우.
select  employee_id, first_name, salary, department_id
from    employees
where   salary= 12008
or     salary= 8300;

-- 다른 표현
select  employee_id, first_name, salary, department_id
from    employees
where   salary in (12008, 8300);


-- 쿼리문 완성
select  employee_id, first_name, salary, department_id
from    employees
where   salary in (select   salary
                   from     employees
                   where    department_id= 110);
                   

--
                   