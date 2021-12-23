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



