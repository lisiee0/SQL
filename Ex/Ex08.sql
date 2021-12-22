-- 급여를 가장 많이 받는 직원의 이름을 출력
select  max(salary)
from    employees;

select  first_name, salary
from    employees
where   salary= (select  max(salary)
                 from    employees);


-- 01.ROWNUM 이해                 
select  rownum
        first_name, salary
from    employees;        

-- 02. 급여순으로 정렬  --> ROWNUM이 섞임, ROWNUM이 작동하고 ORDER BY가 작동하기 때문
select  rownum,
        first_name, salary
from    employees
order by salary desc;

select  first_name, salary
from    employees
order by salary desc;

-- 03. 해결방법 정렬된 테이블을 사용해서 ROWNUM 사용
select  rownum,
        first_name, salary
from   (select  first_name, salary
        from    employees
        order by salary desc)
where   rownum<= 10; -- 급여 많이 받는 상위 10명 출력

select  rownum,
        first_name, salary
from   (select  first_name, salary
        from    employees
        order by salary desc) o -- 급여를 내림차순으로 정렬시킨 테이블
where   rownum between 2 and 5; -- 아무것도 출력되지 않음

-- 문제 해결
select  first_name, salary
from    (select  rownum rno,
                 first_name, salary
         from   (select  first_name, salary
                 from    employees
                 order by salary desc) o) r -- 급여를 내림차순으로 정렬한 테이블에 ROWNUM 적용한 테이블
where   rno between 2 and 5;                 


       
        
        

