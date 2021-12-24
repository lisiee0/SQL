-- 문제 1
select  first_name||' '||last_name "이름", manager_id "매니저아이디",
        nvl(commission_pct, '0') "커미션 비율", salary "월급"
from    employees
where   manager_id is not null
and     commission_pct is null
and     salary> 3000;


-- 문제 2
select  employee_id "직원번호", first_name "이름", salary "급여", 
        to_char(hire_date,'YYYY-MM-DD DAY') "입사일",
        replace(phone_number,'.', '-') "전화번호", department_id "부서번호"
from    employees
where   (department_id, salary) in (select  department_id, max(salary)
                                    from    employees
                                    group by department_id)
order by salary desc;                   
                   

-- 문제 3
select  e.employee_id "매니저아이디", e.first_name "매니저이름", 
        avg "평균급여", min "최소급여", max "최대급여"
from    employees e, (select  manager_id, round(avg(salary),0) avg, 
                              min(salary) min, max(salary) max
                      from    employees
                      where   hire_date> '2004/12/31'
                      group by manager_id
                      having  round(avg(salary),0)>= 5000
                      order by round(avg(salary),0) desc) m
where   e.employee_id= m.manager_id;


-- 문제 4
select  e1.employee_id "사번", e1.first_name "이름", 
        department_name "부서명", e2.first_name "매니저이름" 
from    employees e1, employees e2, departments d
where   e1.manager_id= e2.employee_id
and     e1.department_id= d.department_id(+);


-- 문제 5
/*
문제5.
2005년 이후 입사한 직원중에 입사일이 11번째에서 20번째의 직원의 
사번, 이름, 부서명, 급여, 입사일을 입사일 순서로 출력하세요
*/



