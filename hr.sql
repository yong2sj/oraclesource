*-- hr(����Ŭ ������ ����)
-- scott�� ������ �ִ� ������ ����


-- select��
-- select <�÷���> from <���̺��>

-- ����1. employee ���̺� ��ü ���� ��ȸ
select * from employees

-- ����2. employees ���̺��� first_name, last_name, job_id ��ȸ
select first_name, last_name, job_id from employees

-- ����3. employees ���̺��� ��� ���� ��ȸ
-- employees_id : empno
-- manager_id : mgr
-- department_id : deptno
-- �� ������ ���� ��Ī�� �ٿ��� ��ȸ
-- ��ȸ�� �� �μ���ȣ�� �������� ������������ �����ϵ� �μ� ��ȣ�� ���ٸ�
-- ��� �̸�(First name)�� �������� �������� ����

-- t1. �ڽ��� ��� �Ŵ����� ����Ϻ��� ���� �Ի��� ã��(employees ��������)

-- t2. ���� �̸��� T�� �����ϴ� ������ ��� ������� ���, last_name, department_id,
-- city ���(employees, departments, locations ���̺� ����)

-- t3. ��ġ ID�� 1700�� ������� employee_id, last_name, department_id, salary
-- ���(employees, departments ����)

-- t4. �� �μ��� ��� ����(�Ҽ��� 2�ڸ�����), ��� �� ��ȸ
-- 

-- t5. Exeutive �μ��� �ٹ��ϴ� ��� ������� department_id, last_name, job_id ���
-- (employees, departments ����)

-- t6. ������ ������ ������ ������ �ִ� ������� employee_id, job_id ���
-- employees ���� ����, job_history ��������)

-- t7. �� ����� �ҼӺμ����� �ڽź��� �ʰ� ���Ǿ����� ���� ���� ������ �޴� �����
-- department_id, last_name, salary, hire_date ���
-- employees ���� ����

