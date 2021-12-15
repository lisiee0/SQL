/*
select문
select절
from절
*/

-- 직원테이블 전체 조회
select *
from    employees;

-- 부서 테이블 전체조회
select  *
from    departments;

-- 원하는 컬럼만 조회
select  first_nam,
        last_name,
        salary,
        phone_number,
        email,
        hire_date
from    employees;    

--출력할 컬럼명 별명 적용하기
select  employee_id as empNo,
        first_name as "f-name",
        salary as "연 봉"
from    employees;    

--예제1)
select  first_name as 이름,
        phone_number as 전화번호,
        hire_date as 입사일,
        salary as 급여
from    employees;        

--예제2)
select  employee_id as 사원번호,
        first_name as 이름,
        last_name as 성,
        salary as 급여,
        phone_number as 전화번호,
        email as 이메일,
        hire_date as 입사일
from    employees;

--연결 연산자(Concatenation)로 컬럼들 붙이기
select  first_name || last_name
from    employees;

select  first_name || ' ' || last_name
from    employees;

-- 산술 연산자 사용하기
select  first_name, 
        salary 월급,
        salary*12 연봉
from    employees;

select  first_name, 
        salary 월급,
        salary*12 연봉,
        (salary+300)*12
from    employees;

--예제)
select  job_id
from    employees;

select  first_name ||'-'|| last_name 성명,
        salary 급여,
        salary*12 연봉,
        salary*12+5000 연봉2,
        phone_number 전화번호
from    employees;

-- where 절
-- 비교 연산자
-- 부서번호가 10인 사원의 이름을 구하시오
select  first_name,
        last_name,
        salary
from    employees
where   department_id= 10;

-- 예제)
select  first_name,
        last_name,
        salary
from    employees
where   salary>= 15000;

select  first_name,
        last_name, 
        hire_date
from    employees
where   hire_date>= '07/01/01';

select  salary
from    employees
where   first_name= 'Lex';
        
-- 조건이 2개이상 일때 한꺼번에 조회하기
-- 연봉이 14000 이상 17000이하인 사원의 이름과 연봉구하기
select  first_name, salary
from    employees
where   salary>= 14000
and     salary<= 17000;

-- 연봉이 14000 이하이거나 17000이상인 사원의 이름과 연봉 출력
select  first_name,
        last_name,
        salary
from    employees
where   salary<= 14000
or      salary>= 17000;

-- 입사일이 04/01/01 에서 05/12/31 사이의 사원의 이름과 입사일 출력
select  first_name,
        last_name,
        hire_date
from    employees
where   hire_date>= '04/01/01'
and     hire_date<= '05/12/31';

-- between 연산자로 특정구간 값 출력하기
select  first_name,
        salary
from    employees
where   salary between 14000 and 17000;

-- Like 연산자로 비슷한것들 모두 찾기
select  first_name, last_name, salary
from    employees
where   first_name like 'L%';

-- 이름에 am 을 포함한 사원의 이름과 연봉을 출력
select  first_name, last_name, salary
from    employees
where   first_name like '%am%';

-- 이름의 두번째 글자가 a 인 사원의 이름과 연봉을 출력
select  first_name, last_name, salary
from    employees
where   first_name like '_a%';

-- in연산자로 여러 조건 검사
select *
from    employees
where   first_name = 'Neena' 
or      first_name = 'Lex'
or      first_name = 'John';

-- in으로 위 내용과 똑같이 표현
select *
from    employees
where   first_name
in ('Neena', 'John', 'Lex');

-- 연봉이 2100 3100 4100 5100 사원의 이름과 연봉 표기
select *
from    employees
where   salary 
in (2100, 3100, 4100, 5100);


-- 이름의 네번째 글자가 a인 사원의 이름
select *
from    employees
where   first_name like '___a';

-- 이름이 4글자인 사원의 끝에서 두번쨰 글자가 a인 사원의 이름
select *
from    employees
where   first_name like '__a_';

-- 연봉 13000이상 15000이하인 직원 이름, 급여, 커미션퍼센트 출력
SELECT  first_name,
        salary,
        commission_pct,        
        salary*commission_pct        
FROM    employees
where   salary between 13000 and 15000;

    
-- is null / in not null
select *
from    employees
where   commission_pct is null; --커미션을 가진 사람 == 영업사원


-- 커미션 비율 있는 사원의 이름 과 연봉 커미션 비율 출력
select  first_name,
        salary,
        commission_pct
from    employees
where   commission_pct is not null; 

-- 담당매니저가 없고 커미션 비율이 없는 직원의 이름 출력 (and 동시만족)
select  first_name
from    employees
where   commission_pct is null
and     manager_id is null;

-- order by 절
select  first_name, salary
from    employees
order by salary asc, first_name asc;

select  first_name, salary
from    employees
where   salary>= 9000
order by salary asc;

-- 예제
select  department_id, salary, first_name
from    employees
order by department_id asc;

select  first_name, salary
from    employees
where   salary>= 10000
order by salary desc;

select department_id, salary, first_name
from employees
order by department_id asc, salary desc;
