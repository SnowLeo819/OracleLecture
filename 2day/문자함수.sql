-- �빮�� ��ȯ UPPER
SELECT * FROM EMP
WHERE ENAME = UPPER('smith');

-- �ҹ��� ��ȯ LOWER
SELECT * FROM EMP
WHERE ENAME = LOWER('SMITH');

-- ���� �������鼭 ù���ڸ� �빮�ڷ�
SELECT INITCAP(ENAME) FROM EMP;

-- �������� ���� ��������
SELECT ENAME, LENGTH(ENAME) AS LENGTH FROM EMP;

-- LENGTH �� ���ں� ����
SELECT ENAME, LENGTH(ENAME) AS LENGTH FROM EMP
WHERE LENGTH(ENAME) <= 4;

-- DUAL�� ��°�� Ȯ�ο� DUMMY TABLE...  TEST
-- LENGTH �� �ܼ� ���� ����..  LENGTHB �� ������ ����Ʈ��..
SELECT LENGTH('�ѱ�'), LENGTHB('�ѱ�'), LENGTHB('�ϳ�') FROM DUAL;

-- ���� �����ϱ�.. SUBSTR(���, ������ġ, ���⹮�ڼ�)
SELECT JOB, SUBSTR(JOB,1,2) AS ONE, SUBSTR(JOB,3,2) AS THREE FROM EMP;

-- �̸��߿� 3������ ����������    / �⺻���� ������.. ���ڼ� �ȳ־ ��...
SELECT ENAME, SUBSTR(ENAME,3,LENGTH(ENAME)-2) FROM EMP;
SELECT ENAME, SUBSTR(ENAME,3) FROM EMP;

-- INSTR  ���� ã�� (���ڿ� , �����)     // ���� ��ġ�� ���ڷ� ��ȯ��
SELECT INSTR('HELLO ORACLE','L') FROM DUAL;
-- INSTR  ���� ã�� (���ڿ� , ����� , �˻�������ġ)
SELECT INSTR('HELLO ORACLE','L' ,5) FROM DUAL;
-- INSTR  ���� ã�� (���ڿ� , ����� , �˻�������ġ ,n��° ������ ����)
SELECT INSTR('HELLO ORACLE','L' ,2,2) FROM DUAL;

--�˻�
SELECT * FROM EMP
WHERE ENAME LIKE '%S%';

SELECT * FROM EMP
WHERE INSTR(ENAME,'S') > 0;

-- REPLACE(���ڿ�,ã�¹���,�ٲܹ���)
SELECT '010-2564-4897' AS REPLACE_BEFORE,
REPLACE('010-2564-4897','-',' ')AS REPLACE_AFTER,
REPLACE('010-2564-4897','-','')AS REPLACE_AFTER2
FROM DUAL;

-- FILTERING
-- LPAD / RPAD  ����޲ٱ�
SELECT RPAD('901212-',14,'*') AS JUMIN,
       RPAD('010-2564-',13,'*') AS PHONE FROM DUAL;
SELECT 'ORACLE', LPAD('ORACLE',10,'#') AS LPADTEST FROM DUAL;     

-- CONCAT ���ڿ� �����ϱ�  || 2������ ����, ���ο� �ߺ���� ����
SELECT CONCAT(EMPNO, ENAME)FROM EMP;
SELECT EMPNO||ENAME FROM EMP;
SELECT CONCAT(EMPNO,CONCAT(' : ',ENAME))AS NONAME FROM EMP;

--TRIM () �ڸ���..��������..
SELECT '['||'      --ORACLE--     '||']' AS NOTTRIM,
       '['|| TRIM('      --ORACLE--     ')||']' AS TRIM01,
       TRIM('['||'      --ORACLE--     '||']') AS TRIM02  -- �̰� �ȵ�..
FROM DUAL;
--  ���� ���� �����ϱ� ����. ������ ���� FROM ����ڿ�
SELECT  '['|| TRIM('-' FROM '--ORACLE--')||']' AS TRIM03 FROM DUAL;
SELECT  '['|| TRIM(LEADING '-' FROM '--ORACLE--')||']' AS TRIM03 FROM DUAL;   -- �������� 2���� �̻��� ������..
SELECT  '['|| TRIM(TRAILING '-' FROM '--ORACLE--')||']' AS TRIM03 FROM DUAL;  -- ���������� 2���� �̻��� ������..

-- LTRIM / RTRIM    (����ڿ�,���﹮��) // 2���� �̻� ��������
SELECT LTRIM('ORACLE STUDY OOPS' , 'OO') AS LTRIM FROM DUAL;
SELECT LTRIM('ORACLE STUDY OOPS' , 'ORLE') AS LTRIM FROM DUAL; --��Ÿ�� ���ܵ� �´� ���ڱ��� ����ó��

SELECT RTRIM('ORACLE STUDY OOPS' , 'OOPS') AS RTRIM FROM DUAL; -- RTRIM �ں��� ����
SELECT RTRIM('ORACLE STUDY OOPS' , 'OOP') AS RTRIM FROM DUAL;  -- �� ö�� �ȸ����� ���� X

