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


         