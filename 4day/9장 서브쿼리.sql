-- ��������.. �����ȿ� �Ǵٸ� ���� �ֱ�

SELECT SAL 
FROM EMP
WHERE ENAME = 'JONES'; --2975

SELECT * 
FROM EMP
WHERE SAL > 2975;

SELECT * 
FROM EMP
WHERE SAL > (
                SELECT SAL 
                FROM EMP
                WHERE ENAME = 'JONES'  -- ��Į�� ��������
            );
            
-- �������� ��� EMP �߿� ALLEN �� �߰����纸�� ���� ���
SELECT * FROM EMP;

SELECT COMM
FROM EMP
WHERE ENAME = 'ALLEN';

SELECT *
FROM EMP
WHERE COMM > (
                SELECT COMM
                FROM EMP
                WHERE ENAME = 'ALLEN'
            );
            
SELECT *
FROM EMP
WHERE HIREDATE < (
                SELECT HIREDATE
                FROM EMP
                WHERE ENAME = 'BLAKE'
                );


--20�� �μ� ��� �� ��ü��� ��ձ޿����� ���� �޿� �޴���
SELECT *
FROM EMP
WHERE DEPTNO = 20 
AND SAL > (SELECT TRUNC(AVG(SAL)) FROM EMP);

SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO 
AND E.DEPTNO = 20
AND E.SAL >=(SELECT TRUNC(AVG(SAL)) FROM EMP);

-- �������� ������ ���� ���

SELECT *
FROM EMP
WHERE DEPTNO IN (20,30);

-- �� �μ� �ְ�޿� �޴���
SELECT *
FROM EMP
WHERE SAL IN (
                SELECT MAX(SAL) 
                FROM EMP
                GROUP BY DEPTNO
            )
ORDER BY DEPTNO;

SELECT MAX(SAL) 
FROM EMP
GROUP BY DEPTNO;  -- �� �迭�� ����(�׷�)


-- �� �μ� �ְ�޿� �޴��� // �ٸ����
SELECT *                          -- ANY �� ���� �ϳ��� �־ TRUE
FROM EMP                          -- ALL ��� ������ �����ؾ� TRUE
WHERE SAL = ANY (SELECT MAX(SAL)   
                FROM EMP
                GROUP BY DEPTNO);
                
SELECT *                          -- SOME �� ANY�� ���� ����..
FROM EMP
WHERE SAL = SOME (SELECT MAX(SAL) 
                FROM EMP
                GROUP BY DEPTNO);

--���͸� ����..
SELECT *
FROM EMP
WHERE SAL = ALL(1000,2000,3000);

SELECT *
FROM EMP
WHERE SAL = ANY(1000,2000,3000);

SELECT *
FROM EMP
WHERE EXISTS (SELECT DNAME FROM DEPT WHERE DEPTNO = 10);


-- EMP 10 �μ��� ��� ����� ���� ���� �Ի��� ���,

SELECT *
FROM EMP -- ��/���� ������ TABLE
WHERE HIREDATE < ALL (SELECT HIREDATE FROM EMP WHERE DEPTNO = 10);

-- SELECT ���� ����ϴ� �������� ��Į�� ��������
-- WHERE ���� ���� �������� ��  ���߿� ��������(��ø��������)
-- FROM ���� ���� �������� �� INLINE VIEW   �ζ��� ��( ��� ���̺�� ��� ���̺� �߿� ������ �κи� ������ )

SELECT *
FROM EMP
WHERE DEPTNO = 10;
SELECT *
FROM DEPT;

SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
FROM (SELECT * FROM EMP WHERE DEPTNO =10) E10, 
    (SELECT * FROM DEPT) D
WHERE E10.DEPTNO = D.DEPTNO;

-- SELECT ���� ����ϴ� �������� ��Į�� ��������
SELECT EMPNO, ENAME, JOB, SAL,
        ( SELECT GRADE FROM SALGRADE WHERE E.SAL BETWEEN LOSAL AND HISAL )AS SALGRADE,
        DEPTNO,
        ( SELECT DNAME FROM DEPT WHERE E.DEPTNO = DEPT.DEPTNO )AS DNAME
FROM EMP E;
SELECT GRADE FROM SALGRADE;

-- 20�� �μ����� 



