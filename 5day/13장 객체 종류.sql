-- CRUD 
-- INSERT / SELECT / UPDATE / DELETE ===  TML
-- CREATE == DDL

-- �����ͻ���  ----------------------------------------------------------------------------------------
-- SYS ���� > ���뵿�Ǿ� ���� Ȯ�� ����..
SELECT * FROM DICT;

-- SEQUENCE ���� �ű��


SELECT * FROM DICTIONARY;

SELECT TABLE_NAME
FROM USER_TABLES;

SELECT * FROM USER_TABLES;

SELECT TABLE_NAME
FROM USER_TABLES;

SELECT OWNER, TABLE_NAME FROM ALL_TABLES;

-- DBA : �����ͺ��̽� �� ���� ����!
-- SYS �Ǵ� SYSTEM ���������� ���� ����...
SELECT * FROM DBA_TABLES;

-- INDEX --------------------------------------------------------------------------------------------------------------

-- INDEX �� �˻��� ���� �ϱ� ����... �����Ͱ� ���� ���� ȿ���� ��Ÿ��
SELECT * FROM USER_INDEXES;

-- ���� : CREATE INDEX  �̸� ON ��� ���̺� (����÷�);
CREATE INDEX IDX_EMP_SAL
ON EMP (SAL);

SELECT * FROM USER_IND_COLUMNS;

-- ���� 
DROP INDEX IDX_EMP_SAL;


-- VIEW ------------------------------------------------------------------------------------------------------------------------------------
----- VIEW �� ����..

CREATE VIEW VW_EMP20
AS (
    SELECT EMPNO, ENAME, JOB, DEPTNO 
    FROM EMP
    WHERE DEPTNO =  20
    );
    
    
SELECT * FROM VW_EMP20;    
SELECT * FROM USER_VIEWS;

-- �� ����
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

-- ���  ������ �����͸� �ڵ����� ������..  VIEW���� INSERT �� DELETE �� ���� �ʴ´�.


 -- �� ������ ORDER BY �� ����ϸ� ROWNUM �� ���δ�.. ������ �� ���̱⶧��..
SELECT ROWNUM, E.* 
FROM EMP E
--ORDER BY SAL DESC
;

-- �ذ���1. ���������� ��ȯ..  �� ���������� FROM ���� �־ ROWNUM ���� ���� ORDER BY ����� �����Ѵ�.    // INLINE VIEW 
SELECT ROWNUM, E.* 
FROM ( SELECT * FROM EMP ORDER BY SAL DESC ) E
WHERE ROWNUM <= 3
;

-- �ذ���2. WITH ���� ���̺�  1.�� ����������  ROWNUM ���� ���� ORDER BY ����� ����
WITH E AS ( SELECT * FROM EMP ORDER BY SAL DESC )
SELECT ROWNUM, E.*
FROM E
WHERE ROWNUM <= 3;



--- SEQUENCE ��ȣ �ޱ�� ------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE DEPT_SEQUENCE
AS (
        SELECT * FROM DEPT
        WHERE 1=0
    )  ;

SELECT * FROM DEPT_SEQUENCE;


-- ������ ����
CREATE SEQUENCE SEQ_DEPT_SEQUENCE
    INCREMENT BY 10
    START WITH 10
    MAXVALUE 90
    MINVALUE 0
    NOCYCLE
    CACHE 2;

-- �Է½� Ȱ��
INSERT INTO DEPT_SEQUENCE (DEPTNO,DNAME,LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL,'REVIEW','SEOUL');

-- �ٸ� �Է� ��� ( ������ ������� �ʴ� ���,, ������ ���� ����� ���� )
INSERT INTO DEPT_SEQUENCE (DEPTNO,DNAME,LOC)
VALUES ((SELECT MAX(DEPTNO) +10 FROM DEPT_SEQUENCE),'REVIEW','SEOUL');

SELECT * FROM DEPT_SEQUENCE;

DROP TABLE DEPT_SEQUENCE;
DROP SEQUENCE SEQ_DEPT_SEQUENCE;

SELECT SEQ_DEPT_SEQUENCE.CURRVAL
FROM DUAL;

-- ������ ����
ALTER SEQUENCE SEQ_DEPT_SEQUENCE
INCREMENT BY 5
MAXVALUE 1000
NOCYCLE;


--- ���Ǿ�   SYNONYM  ���� �ο� �ؾ��� -------------------------------------------------------------------
CREATE SYNONYM E FOR EMP;









