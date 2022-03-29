*-- hr(오라클 연습용 계정)
-- scott가 가지고 있는 정보의 원본


-- select문
-- select <컬럼명> from <테이블명>

-- 문제1. employee 테이블 전체 내용 조회
select * from employees

-- 문제2. employees 테이블의 first_name, last_name, job_id 조회
select first_name, last_name, job_id from employees

-- 문제3. employees 테이블의 모든 열을 조회
-- employees_id : empno
-- manager_id : mgr
-- department_id : deptno
-- 위 세개의 열은 별칭을 붙여서 조회
-- 조회할 때 부서번호를 기준으로 내림차순으로 정렬하되 부서 번호가 같다면
-- 사원 이름(First name)을 기준으로 오름차순 정렬

-- t1. 자신의 담당 매니저의 고용일보다 빠른 입사자 찾기(employees 셀프조인)

-- t2. 도시 이름이 T로 시작하는 지역에 사는 사원들의 사원, last_name, department_id,
-- city 출력(employees, departments, locations 테이블 조인)

-- t3. 위치 ID가 1700인 사원들의 employee_id, last_name, department_id, salary
-- 출력(employees, departments 조인)

-- t4. 각 부서별 평균 연봉(소숫점 2자리까지), 사원 수 조회
-- 

-- t5. Exeutive 부서에 근무하는 모든 사원들의 department_id, last_name, job_id 출력
-- (employees, departments 조인)

-- t6. 기존의 직업을 여전히 가지고 있는 사원들의 employee_id, job_id 출력
-- employees 셀프 조인, job_history 내부조인)

-- t7. 각 사워별 소속부서에서 자신보다 늦게 고용되었으나 보다 많은 연봉을 받는 사원의
-- department_id, last_name, salary, hire_date 출력
-- employees 셀프 조인

