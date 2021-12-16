/* 단일행 함수 */

-- 문자함수 
-- INITCAP(컬럼명):첫 글자만 대문자, 나머지는 소문자
select  email, initcap(email), department_id
from    employees
where   department_id= 100;
  
-- LOWER(컬럼명):입력값을 전부 소문자로 변경 
-- UPPER(컬럼명):입력값을 전부 대문자로 변경
select  first_name, lower(first_name), upper(first_name)
from    employees
where   department_id= 100;

-- SUBSTR(컬럼명, 시작위치, 글자수):주어진 문자열에서 특정길이의 문자열을 출력
-- 시작위치가 음수인 경우 문자열 끝에서부터 시작
select  first_name, substr(first_name, 1, 3), substr(first_name, -3, 2)
from    employees
where   department_id= 100;

-- LPAD(컬럼명, 자리수, 채울문자):왼쪽 공백에 특정문자로 채우기
-- RPAD(컬럼명, 자리수, 채울문자):오른쪽 공백에 특정문자로 채우기
select  first_name, lpad(first_name, 10, '*'), rpad(first_name, 10, '#')
from    employees;

-- REPLACE(컬럼명, 문자1, 문자2):컬럼명에서 문자1을 문자2로 바꾸기
select  first_name, 
        replace(first_name, 'a', '*'), 
        replace(first_name, substr(first_name, 2, 3), '***')
from    employees
where   department_id= 100
order by first_name asc;

-- 숫자함수
-- ROUND(숫자, 출력을 원하는 자리수 n):주어진 숫자를 소수점 n자리수까지 반올림하여 출력
select  round(43.34625, 2) "r2", 
        round(3.156, 0) "r0", 
        round(123.456, -1) "r-1"
from    dual;

-- TRUNC(숫자, 출력을 원하는 자리수 n):주어진 숫자를 소수점 n자리수까지 버림하여 출력
select  trunc(123.346, 2) "r2", 
        trunc(123.456, 0) "r0", 
        trunc(123.456, -1) "r-1"
from    dual;

-- 날짜함수
-- SYSDATE():현재 날짜 출력
select  sysdate
from    dual;

-- MONTHS_BETWEEN(d1, d2):d1과 d2 사이의 개월수 출력
select  months_between(sysdate, hire_date),
        round(months_between(sysdate, hire_date), 0),
        trunc(months_between(sysdate, hire_date), 0)
from    employees
where   department_id= 100;

-- TO_CHAR(숫자, '출력모양'):숫자형->문자형으로 변환
select  first_name, salary,
        to_char(salary*12, '$999999'),
        to_char(salary*12, '0999999'),
        to_char(salary*12, '999999.99'),
        to_char(salary*12345, '$999,999,999,999')
from    employees
where   department_id= 100;

-- TO_CHAR(날짜, '출력모양'):날짜->문자형으로 변환
select  sysdate,
        to_char(sysdate, 'YYYY"년" MM"월" DD"일" HH24"시" MI"분" SS"초"')
from    dual;

