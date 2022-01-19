-- CRUD 
-- INSERT / SELECT / UPDATE / DELETE ===  TML
-- CREATE == DDL

-- 데이터사전  ----------------------------------------------------------------------------------------
-- SYS 계정 > 공용동의어 가면 확인 가능..
SELECT * FROM DICT;

-- SEQUENCE 순서 매기기


SELECT * FROM DICTIONARY;

SELECT TABLE_NAME
FROM USER_TABLES;

SELECT * FROM USER_TABLES;

SELECT TABLE_NAME
FROM USER_TABLES;

SELECT OWNER, TABLE_NAME FROM ALL_TABLES;

-- DBA : 데이터베이스 최 상위 권한!
-- SYS 또는 SYSTEM 계정에서만 접근 가능...
SELECT * FROM DBA_TABLES;

-- INDEX --------------------------------------------------------------------------------------------------------------

-- INDEX 는 검색을 빨리 하기 위함... 데이터가 많을 수록 효과가 나타남
SELECT * FROM USER_INDEXES;

-- 생성 : CREATE INDEX  이름 ON 대상 테이블 (대상컬럼);
CREATE INDEX IDX_EMP_SAL
ON EMP (SAL);

SELECT * FROM USER_IND_COLUMNS;

-- 삭제 
DROP INDEX IDX_EMP_SAL;


-- VIEW ------------------------------------------------------------------------------------------------------------------------------------
----- VIEW 뷰 생성..

CREATE VIEW VW_EMP20
AS (
    SELECT EMPNO, ENAME, JOB, DEPTNO 
    FROM EMP
    WHERE DEPTNO =  20
    );
    
    
SELECT * FROM VW_EMP20;    
SELECT * FROM USER_VIEWS;

-- 뷰 삭제
DROP VIEW VW_EMP20;


DROP TABLE DEPT_TEMP
CREATE TABLE DEPT_TEMP
    AS SELECT * FROM DEPT;
    
SELECT * FROM DEPT_TEMP;

    CREATE VIEW VW_TEMP
AS (
    SELECT DEPTNO, DNAME, LOC
    FROM DEPT_TEMP
    WHERE DEPTNO =  20
    );

UPDATE DEPT_TEMP
SET LOC = 'SEOUL',
      DNAME = 'DATABASE';
      
INSERT INTO DEPT_TEMP VALUES (20,'TECHLEADER','SEOUL');
      
ROLLBACK;      
   
SELECT * FROM VW_TEMP;

-- 뷰는  원본의 데이터를 자동으로 가져옴..  VIEW에는 INSERT 나 DELETE 를 하지 않는다.


 -- 이 구문은 ORDER BY 를 사용하면 ROWNUM 이 꼬인다.. 정렬이 맨 뒤이기때문..
SELECT ROWNUM, E.* 
FROM EMP E
--ORDER BY SAL DESC
;

-- 해결방법1. 서브쿼리로 전환..  → 서브쿼리를 FROM 절에 넣어서 ROWNUM 보다 먼저 ORDER BY 명령을 실행한다.    // INLINE VIEW 
SELECT ROWNUM, E.* 
FROM ( SELECT * FROM EMP ORDER BY SAL DESC ) E
WHERE ROWNUM <= 3
;

-- 해결방법2. WITH 가상 테이블  1.과 마찬가지로  ROWNUM 보다 먼저 ORDER BY 명령을 실행
WITH E AS ( SELECT * FROM EMP ORDER BY SAL DESC )
SELECT ROWNUM, E.*
FROM E
WHERE ROWNUM <= 3;



--- SEQUENCE 번호 메기기 ------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE DEPT_SEQUENCE
AS (
        SELECT * FROM DEPT
        WHERE 1=0
    )  ;

SELECT * FROM DEPT_SEQUENCE;


-- 시퀀스 생성
CREATE SEQUENCE SEQ_DEPT_SEQUENCE
    INCREMENT BY 10
    START WITH 10
    MAXVALUE 90
    MINVALUE 0
    NOCYCLE
    CACHE 2;

-- 입력시 활용
INSERT INTO DEPT_SEQUENCE (DEPTNO,DNAME,LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL,'REVIEW','SEOUL');

-- 다른 입력 방법 ( 시퀀스 사용하지 않는 경우,, 오류가 생길 우려가 있음 )
INSERT INTO DEPT_SEQUENCE (DEPTNO,DNAME,LOC)
VALUES ((SELECT MAX(DEPTNO) +10 FROM DEPT_SEQUENCE),'REVIEW','SEOUL');

SELECT * FROM DEPT_SEQUENCE;

DROP TABLE DEPT_SEQUENCE;
DROP SEQUENCE SEQ_DEPT_SEQUENCE;

SELECT SEQ_DEPT_SEQUENCE.CURRVAL
FROM DUAL;

-- 시퀀스 수정
ALTER SEQUENCE SEQ_DEPT_SEQUENCE
INCREMENT BY 5
MAXVALUE 1000
NOCYCLE;


--- 동의어   SYNONYM  권한 부여 해야함 -------------------------------------------------------------------
CREATE SYNONYM E FOR EMP;









