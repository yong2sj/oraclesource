-- PL/SQL
-- SQL 만으로는 구현이 어렵거나 구현 불가능한 작업들을 수행하기 위해서
-- 제공하는 프로그래밍 언어

-- 키워드
-- DECLARE(선언부) : 변수,상수,커서 등을 선언(선택)
-- BEGIN(실행부) : 조건문,반복문,SELECT,DML(U,D,I),함수 등을 정의(필수)
-- EXCEPTION(예외처리부) : 오류(예외상황) 해결(선택)

-- 실행 결과를 화면에 출력
SET SERVEROUTPUT ON;

-- Hello 출력
BEGIN
    dbms_output.put_line('Hello! PL/SQL');
END;
/

DECLARE
    -- 변수선언
    v_empno NUMBER(4) := 7788;
    v_ename VARCHAR2(10);
BEGIN
    v_ename := 'SCOTT';
    dbms_output.put_line('V_EMPNO : ' || v_empno);
    dbms_output.put_line('V_ENAME : ' || v_ename);
END;
/

DECLARE
    -- 상수선언
    v_tax CONSTANT NUMBER(1) := 3;
BEGIN
    dbms_output.put_line('V_TAX : ' || v_tax);
END;
/


-- 변수의 기본값 지정
DECLARE
    v_deptno NUMBER(2) DEFAULT 10;
BEGIN
    dbms_output.put_line('V_DEPTNO : ' || v_deptno);
END;
/

-- NOT NULL 지정
DECLARE
    v_deptno NUMBER(2) NOT NULL := 10;
--    V_DEPTNO NUMBER(2) NOT NULL DEFAULT 20;
BEGIN
    dbms_output.put_line('V_DEPTNO : ' || v_deptno);
END;
/

-- IF 조건문
-- IF ~ THEN
-- IF ~ THEN ~ ELSE
-- IF ~ THEN ~ ELSIF


-- V_NUMBER 변수 선언하고 13 값을 할당한 뒤 해당변수가 홀,짝 출력
DECLARE
    v_number NUMBER := 13;
BEGIN
    IF MOD(v_number, 2) = 1 THEN
        dbms_output.put_line('홀수');
    END IF;
END;
/

DECLARE
    v_number NUMBER := 14;
BEGIN
    IF MOD(v_number, 2) = 1 THEN
        dbms_output.put_line('홀수');
    ELSE
        dbms_output.put_line('짝수');
    END IF;
END;
/

DECLARE
    v_number NUMBER := 87;
BEGIN
    IF v_number >= 90 THEN
        dbms_output.put_line('A 학점');
    ELSIF v_number >= 80 THEN
        dbms_output.put_line('B 학점');
    ELSIF v_number >= 70 THEN
        dbms_output.put_line('C 학점');
    ELSIF v_number >= 60 THEN
        dbms_output.put_line('D 학점');
    ELSE
        dbms_output.put_line('F 학점');
    END IF;
END;
/


-- CASE ~ WITH 
DECLARE
    v_score NUMBER := 77;
BEGIN
    CASE trunc(v_score / 10)
        WHEN 10 THEN
            dbms_output.put_line('A 학점');
        WHEN 9 THEN
            dbms_output.put_line('B 학점');
        WHEN 8 THEN
            dbms_output.put_line('C 학점');
        WHEN 7 THEN
            dbms_output.put_line('D 학점');
        ELSE
            dbms_output.put_line('F 학점');
    END CASE;
END;
/


-- 반복문
-- LOOP ~ END LOOP
-- WHILE LOOP ~ END LOOP
-- FOR LOOP
-- Cursor FOR LOOP


DECLARE
    v_deptno NUMBER := 0;
BEGIN
    LOOP
        dbms_output.put_line('현재 V_DEPTNO : ' || v_deptno);
        v_deptno := v_deptno + 1;
        EXIT WHEN v_deptno > 4;
    END LOOP;
END;
/

DECLARE
    v_deptno NUMBER := 0;
BEGIN
    WHILE v_deptno < 4 LOOP
        dbms_output.put_line('현재 V_DEPTNO : ' || v_deptno);
        v_deptno := v_deptno + 1;
    END LOOP;
END;
/


-- 시작값..종료값 : 반복문을 통해서 시작값 ~ 종료값을 사용
BEGIN
    FOR i IN 0..4 LOOP
        dbms_output.put_line('현재 i : ' || i);
    END LOOP;
END;
/

BEGIN
    FOR i IN REVERSE 0..4 LOOP
        dbms_output.put_line('현재 i : ' || i);
    END LOOP;
END;
/

-- 숫자 1~10까지 출력(홀수만)

BEGIN
    FOR i IN 1..10 LOOP
        IF MOD(i, 2) = 1 THEN
            dbms_output.put_line('i : ' || i);
        END IF;
    END LOOP;
END;
/


-- 변수 타입 선언시 특정 테이블의 컬럼 값 참조

DECLARE
    v_deptno dept.deptno%TYPE := 50;
BEGIN
    dbms_output.put_line('V_DEPTNO : ' || v_deptno);
END;
/

-- 변수 타입 선언시 특정 테이블의 하나의 컬럼이 아닌 행 구조 전체 참조

DECLARE
    v_dept_row dept%ROWTYPE;
BEGIN
    SELECT deptno, dname, loc INTO v_dept_row
    FROM dept
    WHERE deptno=40;
    dbms_output.put_line('DEPTNO : ' || v_dept_row.deptno);
    dbms_output.put_line('DNAME : ' || v_dept_row.dname);
    dbms_output.put_line('LOC : ' || v_dept_row.loc);
END;
/

-- 커서(CURSOR)
-- SELECT,DELETE,UPDATE,INSERT SQL 문 실행시 해당 SQL문을 처리하는 정보를
-- 저장한 메모리 공간

-- SELECT INTO 방식 : 결과값이 하나일 때 사용가능
-- 결과값이 몇 개인지 알 수 없을 경우 CURSOR 사용

-- 1) 명시적 커서
-- declare : 커서 선언
-- open : 커서 열기
-- fetch : 커서에서 읽어온 데이터 사용
-- close : 커서 닫기

DECLARE
    -- 커서 데이터를 입력할 변수 선언
    V_DEPT_ROW DEPT%ROWTYPE;
    -- 명시적 커서 선언
    CURSOR c1 IS
        SELECT DEPTNO,DNAME,LOC
        FROM DEPT
        WHERE DEPTNO=40;
BEGIN
    -- 커서 열기
    OPEN c1;
    
    -- 읽어온 데이터 사용
    FETCH c1 INTO V_DEPT_ROW;
    
    dbms_output.put_line('DEPTNO : ' || v_dept_row.deptno);
    dbms_output.put_line('DNAME : ' || v_dept_row.dname);
    dbms_output.put_line('LOC : ' || v_dept_row.loc);
    
    -- 커서 닫기
    CLOSE c1;
    
END;
/


-- 여러 행이 조회되는 경우

DECLARE
    -- 커서 데이터를 입력할 변수 선언
    V_DEPT_ROW DEPT%ROWTYPE;
    -- 명시적 커서 선언
    CURSOR c1 IS
        SELECT DEPTNO,DNAME,LOC
        FROM DEPT;
BEGIN
    -- 커서 열기
    OPEN c1;
    
    LOOP
        -- 읽어온 데이터 사용
        FETCH c1 INTO V_DEPT_ROW;
        
        -- 커서에서 더이상 읽어올 행이 없을 때 까지
        EXIT WHEN c1%NOTFOUND;
        
        
        dbms_output.put_line('DEPTNO : ' || v_dept_row.deptno);
        dbms_output.put_line('DNAME : ' || v_dept_row.dname);
        dbms_output.put_line('LOC : ' || v_dept_row.loc);
    END LOOP;
    
    
    -- 커서 닫기
    CLOSE c1;
    
END;
/

-- Cursor for ~ loop
DECLARE   
    -- 명시적 커서 선언
    CURSOR c1 IS
        SELECT DEPTNO,DNAME,LOC
        FROM DEPT;
BEGIN 
    
    FOR c1_rec IN c1 LOOP        
        dbms_output.put_line('DEPTNO : ' || v_dept_row.deptno
        || ' DNAME : ' || v_dept_row.dname
        || ' LOC : ' || v_dept_row.loc);
    END LOOP;
        
END;
/











