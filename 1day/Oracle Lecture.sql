-- �ּ��� �̷���...
SELECT * FROM EMP;
--DESC emp;
--DESC bonus;

-- ���� ���� �ѹ��� ��������
SELECT ename,empno,job FROM emp;

-- �ߺ� ���� ��ɾ� distinct
SELECT deptno from emp;             -- �ߺ��ڷ� �״�� ����
SELECT ALL deptno from emp;       -- �ߺ��ڷ� �״�� ����(�⺻���̹Ƿ� �Ƚᵵ ��)
SELECT distinct deptno from emp;   -- �ߺ��ڷ� ����

SELECT distinct deptno,job from emp; 

--ex) �޿����� ��������
SELECT ENAME, SAL FROM EMP;
SELECT ENAME, SAL, COMM, SAL*12+COMM AS ANNUALINCOME FROM EMP;
SELECT ENAME, SAL AS ����, COMM AS �߰�����, SAL*12+COMM AS ���� FROM EMP;

-- �޿��� ���� �������
-- ORDER BT   ���� ��ɾ� ���� �� �ڿ� ��.
SELECT * FROM EMP
-- ORDER BY SAL ASC     -- ASC�������� ����(����������) �⺻��, �Ƚᵵ ��
-- ORDER BY SAL DESC    --  DESC ������ ��������(ū������)
ORDER BY DEPTNO ASC, SAL DESC    --  ASC �� DESC ȥ��Ȱ��
;

-- ������ �߰��ϴ� WHERE
SELECT * FROM EMP
WHERE EMPNO = 7698
;

--�μ� ��ȣ�� 30���� ���. + ������ CLERK
SELECT * FROM EMP
WHERE DEPTNO = 30 OR JOB ='CLERK'
;

-- �μ���ȣ�� 20 �̰ų� ������ �������
SELECT * FROM EMP
WHERE DEPTNO = 20 OR JOB ='SALESMAN'
;

-- SAL �� 3000 �̻�
SELECT * FROM EMP
WHERE SAL >=3000
;

-- �̸��� S �̻�?..?   ���ڿ��ε� ���� �񱳸� �� �� ����...
SELECT * FROM EMP
WHERE ENAME >= 'S'
;

-- ����,,  != / <> / ^=   ������ !=�� <>�� ���־�
SELECT * FROM EMP
WHERE SAL != 3000;

--JOB �� MANAGER  SALESMAN, CLERK
SELECT * FROM EMP
WHERE JOB = 'MANAGER' OR JOB = 'SALESMAN' OR JOB = 'CLERK'
ORDER BY JOB ASC
;

SELECT * FROM EMP
WHERE JOB IN ('MANAGER', 'SALESMAN','CLERK')
ORDER BY JOB ASC
;

-- ���� ����
SELECT * FROM EMP
WHERE JOB NOT IN ('MANAGER', 'SALESMAN','CLERK')
ORDER BY JOB ASC
;

--�μ���ȣ 10,20 
SELECT * FROM EMP
WHERE DEPTNO IN(10,20)
--WHERE DEPTNO = 10 OR DEPTNO = 20
ORDER BY DEPTNO
;

--������ 2000~3000 ����
SELECT * FROM EMP
WHERE SAL >=2000 AND SAL <=3000
ORDER BY SAL
;

SELECT * FROM EMP
WHERE SAL BETWEEN 2000 AND 3000
ORDER BY SAL
;

--2000 �����۰� 3000���� ū
SELECT * FROM EMP
WHERE SAL <=2000 OR SAL >=3000
ORDER BY SAL
;

SELECT * FROM EMP
WHERE SAL NOT BETWEEN 2000 AND 3000
ORDER BY SAL
;

-- �˻�...  % �� ���̿� ��� ���� ��� ����
-- ��ü ��ġ�� = ����.,  �Ϻ� ��ġ�� LIKE�� Ȱ������
SELECT * FROM EMP
--WHERE ENAME = 'MARTIN'
--WHERE ENAME LIKE 'M%'  
WHERE ENAME LIKE '%ER'
;

-- �ι�° ���ڰ� L �� ���   _ �� �ѱ���
SELECT * FROM EMP
WHERE ENAME LIKE '_L%'
--WHERE ENAME LIKE '%M%'  
;

--NULL ��ȸ�ϱ�   
-- NULL �� "=" ���� ��ȸ�� �ȵȴ�..  IS �Լ��� ���!  NOT �� �������� ����
SELECT * FROM EMP
WHERE COMM IS NULL
--WHERE COMM IS NOT NULL
;

-- ������ UNION        ����̵Ǵ� ���̺��� ���� �� ��� ������...  < �ߺ��� x >
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP
WHERE DEPTNO = 20
UNION
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP
WHERE DEPTNO = 30;

-- ������ UNION ALL      < �ߺ��� O > 
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP
WHERE DEPTNO = 10
UNION ALL
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP
WHERE DEPTNO = 10;

-- ������   A - B
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP
MINUS
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP
WHERE DEPTNO = 10;

-- ������
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP
INTERSECT
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP
WHERE DEPTNO = 10;


