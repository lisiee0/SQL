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
select  r.rno "입사일순서", employee_id "사번", first_name "이름",
        d.department_name "부서명", salary "급여", hire_date "입사일"
from    (select  rownum rno,
                 employee_id, first_name, salary, hire_date, department_id
         from    (select  employee_id, first_name, salary, hire_date, department_id
                  from    employees
                  where   hire_date> '2004/12/31'
                  order by hire_date asc) o) r,
        departments d
where   r.department_id= d.department_id
and     r.rno between 11 and 20
order by r.rno;


-- 문제 6
select  first_name||' '||last_name "이름", salary "연봉", 
        department_name "부서명", hire_date "입사일"
from    employees e, departments d
where   hire_date in (select  max(hire_date)
                      from    employees)
and     e.department_id= d.department_id;           


-- 문제 7
select  e.employee_id "직원번호", e.first_name||' '||e.last_name "이름", 
        j.job_title "업무명", e.salary "연봉"
from    (select  rownum rno,
                 department_id, salary
         from    (select  department_id, avg(salary) salary
                  from    employees
                  group by department_id
                  order by salary desc) o) r,
        employees e,
        jobs j        
where   e.job_id= j.job_id
and     e.department_id= r.department_id
and     r.rno= 1;


-- 문제 8
-- 평균 급여(salary)가 가장 높은 부서는? 




select d.department_name, salary
from (select  department_id, avg(salary) salary
      from    employees
      group by department_id
      order by salary desc) o,
      departments d
where o.department_id= d.department_id
and   

