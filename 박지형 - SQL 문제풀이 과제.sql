-- SQL ���� Ǯ�� �� �����ϱ��� Ǯ� �����ϱ�....

-- 1. ������� �ٹ��ϰ� �ִ� �ٹ� �μ��� ��ȣ�� �ߺ����� �������ÿ�.  
SELECT DISTINCT(DEPTNO) AS DEPTNO
FROM EMP;

--(hint) ���Ῥ���� || �Ǵ� concat �Լ� �̿� 
--2.������� �̸��� ������ ���� ������� �����´�. 000 ����� ��� ������ XXX �Դϴ�. 
-- ||
SELECT ENAME||' ����� ��� ������ '||JOB||' �Դϴ�.' AS NAME_JOB
FROM EMP;
-- CONCAT
SELECT CONCAT(ENAME, CONCAT(' ����� ��� ������ ',CONCAT(JOB, ' �Դϴ�.')))
FROM EMP;

--(hint) ��������� �̿�
--3. �� ������� �޿��װ� �޿��׿��� 1000�� ���� ��, 200�� �� ��, 2�� ���� ��, 2�� ���� ���� �������ÿ�.  
SELECT SAL, SAL+1000,SAL-200, SAL*2, SAL/2
FROM EMP;

--4. �� ����� �޿���, Ŀ�̼�, �޿� + Ŀ�̼� �׼��� �������ÿ�
SELECT SAL, COMM, SAL+NVL(COMM,0) AS TOTAL
FROM EMP;

--5.����� �̸��� ��� ��ȣ�� �����´�
SELECT ENAME, EMPNO FROM EMP;

--6.����� �̸��� ��� ��ȣ, ����, �޿��� �����´�.
SELECT ENAME, EMPNO, JOB, SAL FROM EMP;

--7. �μ� ��ȣ�� �μ� �̸��� �����´�.
SELECT DEPTNO, DNAME FROM DEPT;

--8.  �μ��� ��� ������ �����´�.
SELECT * FROM DEPT;

--9.  ����� ��� ������ �����´�.
SELECT * FROM EMP;

--10.�ٹ� �μ��� 10���� ������� �����ȣ, �̸�, �ٹ� �μ��� �����´�. 
SELECT EMPNO, ENAME, DEPTNO
FROM EMP
WHERE DEPTNO = 10;

--11.�ٹ� �μ� ��ȣ�� 10���� �ƴ� ������� �����ȣ, �̸�, �ٹ� �μ� ��ȣ�� �����´�.
SELECT EMPNO, ENAME, DEPTNO
FROM EMP
WHERE DEPTNO <> 10;

--12.�޿��� 1500�̻��� ������� �����ȣ, �̸�, �޿��� �����´�.
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL >= 1500;

--13.�̸��� SMITH ����� �����ȣ, �̸�, ����, �޿��� �����´�. 
SELECT EMPNO, ENAME, JOB, SAL FROM EMP WHERE ENAME ='SMITH';

--14. ??�� SALESMAN�� ����� �����ȣ, �̸�, ������ �����´�. - ������ ���
SELECT EMPNO, ENAME, JOB FROM EMP WHERE JOB ='SALESMAN';

--15.������ CLERK�� �ƴ� ����� �����ȣ, �̸�, ������ �����´�. 
SELECT EMPNO, ENAME, JOB FROM EMP WHERE JOB != 'CLERK';

--16. 1982�� 1�� 1�� ���Ŀ� �Ի��� ����� �����ȣ, �̸�, �Ի����� �����´�. 
SELECT EMPNO, ENAME, HIREDATE
FROM EMP
WHERE HIREDATE > '1982-01-01';

--(hint) where  �������� �̿� (and , or, not in, between  a and b ���)
--17. 10�� �μ����� �ٹ��ϰ� �ִ� ������ MANAGER�� ����� �����ȣ, �̸�, �ٹ��μ�, ������ �����´�.  
SELECT EMPNO, ENAME, DEPTNO, JOB
FROM EMP
WHERE DEPTNO = 10 AND JOB = 'MANAGER';

--18.�Ի�⵵�� 1981���� ����߿� �޿��� 1500 �̻��� ����� �����ȣ, �̸�, �޿�, �Ի����� �����´�.  
SELECT EMPNO, ENAME, SAL, HIREDATE
FROM EMP
WHERE HIREDATE BETWEEN '1981-01-01' AND '1981-12-31'
AND SAL >= 1500;

--19. 20�� �μ��� �ٹ��ϰ� �ִ� ��� �߿� �޿��� 1500 �̻��� ����� �����ȣ, �̸�, �μ���ȣ, �޿��� �����´�.
SELECT EMPNO, ENAME, DEPTNO, SAL
FROM EMP
WHERE DEPTNO = 20 AND SAL >=1500;

--20. ��� ��� ��ȣ�� 7698���� ����߿� ������ CLERK�� ����� �����ȣ, �̸�, ���ӻ����ȣ, ������ �����´�.
SELECT EMPNO, ENAME, MGR, JOB
FROM EMP
WHERE MGR = '7698' AND JOB = 'CLERK';

--21. �� 2000���� ũ�ų� 1000���� ���� ����� �����ȣ, �̸�, �޿��� �����´�. // ?? �޿�?
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL BETWEEN 1000 AND 2000;

--22. ��ȣ�� 20�̰ų� 30�� ����� �����ȣ, �̸�, �μ���ȣ�� �����´�.
SELECT EMPNO, ENAME, DEPTNO
FROM EMP
WHERE DEPTNO IN (20, 30);

--23. ������ CLERK, SALESMAN, ANALYST�� ����� �����ȣ, �̸�, ������ �����´�.
SELECT EMPNO, ENAME, JOB
FROM EMP
WHERE JOB IN ('CLERK','SALESMAN','ANALYST');

--24.��� ��ȣ�� 7499, 7566, 7839�� �ƴ� ������� �����ȣ, �̸��� �����´�
SELECT EMPNO, ENAME
FROM EMP
--WHERE EMPNO NOT IN ('7499','7566','7839');
WHERE EMPNO NOT IN (7499,7566,7839);

--(hint) like            ==>   _ : ���� �ϳ��� �ǹ��Ѵ�.  % : ���� 0�� �̻��� �ǹ��Ѵ�.
--25.�̸��� F�� �����ϴ� ����� �̸��� ��� ��ȣ�� �����´�.
SELECT ENAME, EMPNO
FROM EMP
WHERE ENAME LIKE 'F%';

--26.�� S�� ������ ����� �̸��� ��� ��ȣ�� �����´�.
SELECT ENAME, EMPNO
FROM EMP
WHERE ENAME LIKE '%S';

--27.�̸��� A�� ���ԵǾ� �ִ� ����� �̸��� ��� ��ȣ�� �����´�.
SELECT ENAME, EMPNO
FROM EMP
WHERE ENAME LIKE '%A%';

--28. �̸��� �ι�° ���ڰ� A�� ����� ��� �̸�, ��� ��ȣ�� �����´�.
SELECT ENAME, EMPNO
FROM EMP
WHERE ENAME LIKE '_A%';

--29.  �̸��� 4������ ����� ��� �̸�, ��� ��ȣ�� �����´�.
SELECT ENAME, EMPNO
FROM EMP
WHERE LENGTH(ENAME) = 4;

--(hint) is null  /  is not null
--30.����߿� Ŀ�̼��� ���� �ʴ� ����� �����ȣ, �̸�, Ŀ�̼��� �����´�.
SELECT EMPNO, ENAME, COMM
FROM EMP
WHERE COMM IS NULL;

--31. ȸ�� ��ǥ(���ӻ���� ���� ���)�� �̸��� �����ȣ�� �����´�.
SELECT ENAME, EMPNO
FROM EMP
WHERE MGR IS NULL;

-- (hint) order by
--32.����� �����ȣ, �̸�, �޿��� �����´�. �޿��� �������� �������� ������ �Ѵ�.
SELECT EMPNO, ENAME, SAL
FROM EMP
ORDER BY SAL;

--33.����� �����ȣ, �̸�, �޿��� �����´�. �����ȣ�� �������� �������� ������ �Ѵ�.
SELECT EMPNO, ENAME, SAL
FROM EMP
ORDER BY EMPNO DESC;

--34.����� �����ȣ, �̸��� �����´�, ����� �̸��� �������� �������� ������ �Ѵ�.
SELECT EMPNO, ENAME
FROM EMP
ORDER BY ENAME ASC;

--35.����� �����ȣ, �̸�, �Ի����� �����´�. �Ի����� �������� �������� ������ �Ѵ�.
SELECT EMPNO, ENAME, HIREDATE
FROM EMP
ORDER BY HIREDATE DESC;

--36.������ SALESMAN�� ����� ����̸�, �����ȣ, �޿��� �����´�. �޿��� �������� �������� ������ �Ѵ�.
SELECT ENAME, EMPNO, SAL
FROM EMP
WHERE JOB = 'SALESMAN'
ORDER BY SAL;

--37.1981�⿡ �Ի��� ������� �����ȣ, ��� �̸�, �Ի����� �����´�. ��� ��ȣ�� �������� �������� ������ �Ѵ�.
SELECT EMPNO, ENAME, HIREDATE
FROM EMP
WHERE HIREDATE BETWEEN '1981-01-01' AND '1981-12-31'
ORDER BY EMPNO DESC;

--38.����� �̸�, �޿�, Ŀ�̼��� �����´�. Ŀ�̼��� �������� �������� ������ �Ѵ�.
SELECT ENAME, SAL, COMM FROM EMP ORDER BY COMM;
SELECT ENAME, SAL,  NVL(COMM,0) AS COMM FROM EMP ORDER BY COMM;

--39.����� �̸�, �޿�, Ŀ�̼��� �����´�. Ŀ�̼��� �������� �������� ������ �Ѵ�.
SELECT ENAME, SAL, COMM FROM EMP ORDER BY COMM DESC;
SELECT ENAME, SAL,  NVL(COMM,0) AS COMM FROM EMP ORDER BY COMM DESC;

--(hint) �����Լ� round, abs, trunc ���
--40. �������� �޿��� 2000 �谨�ϰ� �谨�� �޿����� ���밪�� ���Ѵ�.
SELECT EMPNO, ENAME, (SAL-2000) AS SUB, ABS(SAL-2000) AS ABS
FROM EMP;

--41. �޿��� 1500 �̻��� ����� �޿��� 15% �谨�Ѵ�. �� �Ҽ��� ���ϴ� ������.
SELECT EMPNO, ENAME, SAL, SAL-TRUNC(SAL*0.15) AS RESULT
FROM EMP
WHERE SAL >= 1500;

--42.�޿��� 2õ ������ ������� �޿��� 20%�� �λ��Ѵ�. �� 10�� �ڸ��� �������� �ݿø��Ѵ�.
SELECT EMPNO, ENAME, SAL, SAL+ROUND(SAL*0.2,-2) AS RISED
FROM EMP
WHERE SAL <=2000;

--43.�� ������ �޿��� 10�ڸ� ���ϸ� �谨�Ѵ�
SELECT EMPNO, ENAME, TRUNC(SAL,-2) AS TRUNC_SAL FROM EMP;

--( hint) decode / case 
--44. �� ����� �μ� �̸��� �����´�.
SELECT EMPNO, ENAME, DEPTNO,
DECODE ( DEPTNO,
                10, '�λ��',
                20, '���ߺ�',
                30, '�濵������',
                40, '�����'
            ) AS DEPT_NAME
FROM EMP;

-- 45.���޿� ���� �λ�� �޿����� �����´�.
SELECT EMPNO, ENAME, JOB, SAL, 
CASE 
WHEN JOB = 'CLERK' THEN TRUNC(SAL*1.1)
WHEN JOB = 'SALESMAN' THEN TRUNC(SAL*1.15)
WHEN JOB = 'PRESIDENT' THEN TRUNC(SAL*2)
WHEN JOB = 'MANAGER' THEN TRUNC(SAL*1.05)
WHEN JOB = 'ANALYST' THEN TRUNC(SAL*1.2)
END AS SAL_RESUTL
FROM EMP;

--46.�޿��� �� ����� �����´�.
SELECT EMPNO, ENAME, JOB, SAL,
CASE 
WHEN SAL < 1000 THEN 'C���'
WHEN SAL BETWEEN 1000 AND 2000 THEN 'C���'
ELSE 'A���'
END AS SAL_GRADE
FROM EMP;

--47.�������� �޿��� ������ ���� �λ��Ѵ�.
SELECT EMPNO, ENAME, JOB, SAL,
CASE 
WHEN SAL < 1000 THEN SAL*2
WHEN SAL BETWEEN 1000 AND 2000 THEN SAL*1.5
ELSE SAL*3
END AS SAL_RESULT
FROM EMP;

--( hint)�׷��Լ� �̿�  sum/avg/count/max/min ���
--48. ������� Ŀ�̼� ������ ���Ѵ�.
SELECT * FROM EMP;
SELECT SUM(NVL(COMM,0)) AS COMM FROM EMP;

--49.�޿��� 1500 �̻��� ������� �޿� ������ ���Ѵ�.
--SELECT * FROM EMP
--WHERE SAL >= 1500; -- > 25675
SELECT SUM(SAL) FROM EMP
WHERE SAL >= 1500;

--50.20�� �μ��� �ٺ��ϰ� �ִ� ������� �޿� ������ ���Ѵ�.
--SELECT * FROM EMP
--WHERE DEPTNO = 20; -- > 8875

SELECT SUM(SAL) FROM EMP
WHERE DEPTNO = 20; 

--51.������ SALESMAN�� ������� �޿� ������ ���Ѵ�.
SELECT SUM(SAL) FROM EMP
WHERE JOB = 'SALESMAN';

--52. ������ SALESMAN�� ������� �̸��� �޿������� �����´�.--------------------------------------------  �ٽ� ??
-- �κ���.. GROUP BY ROLLUP
SELECT ENAME, SUM(SAL) 
FROM EMP
WHERE JOB = 'SALESMAN'
GROUP BY ROLLUP (ENAME);

--53.�� ����� �޿� ����� ���Ѵ�.
SELECT AVG(SAL) FROM EMP;

--54.Ŀ�̼��� �޴� ������� Ŀ�̼� ����� ���Ѵ�.
--SELECT * FROM EMP
SELECT AVG(COMM) AS COMM_AVG FROM EMP
WHERE COMM IS NOT NULL;

--55.�� ����� Ŀ�̼��� ����� ���Ѵ�.
SELECT AVG(NVL(COMM,0)) AS COMM_AVG FROM EMP;

--56.Ŀ�̼��� �޴� ������� �޿� ����� ���Ѵ�.
SELECT AVG(SAL) FROM EMP
WHERE COMM IS NOT NULL;

--57.30�� �μ��� �ٹ��ϰ� �ִ� ������� �޿� ����� ���Ѵ�.
SELECT AVG(SAL) FROM EMP
WHERE DEPTNO = 30;

--58.������ SALESMAN�� ������� �޿� + Ŀ�̼� ����� ���Ѵ�.
SELECT JOB, SAL, COMM, SAL+NVL(COMM,0) AS SAL_COMM FROM EMP
WHERE JOB = 'SALESMAN';

--59. ������� �� ���� �����´�.
--SELECT * FROM EMP; --13��..
SELECT COUNT(EMPNO) AS COUNT FROM EMP;

--60. Ŀ�̼��� �޴� ������� �� ���� �����´�.
--SELECT * FROM EMP;
SELECT COUNT(EMPNO) AS COUNT FROM EMP
WHERE COMM IS NOT NULL AND COMM <> 0;
--OR
SELECT COUNT(EMPNO) AS COUNT FROM EMP
WHERE NVL(COMM,0) <> 0;


--61. ������� �޿� �ִ�, �ּҰ��� �����´�.
SELECT MAX(SAL) AS MAX_SAL, MIN(SAL) AS MIN_SAL FROM EMP;

--( hint)�׷��Լ� �̿�  sum/avg/count/max/min  group by �̿�
--62. �� �μ��� ������� �޿� ����� ���Ѵ�.
SELECT DEPTNO, TRUNC(AVG(SAL)) AS AVG_SAL FROM EMP
GROUP BY DEPTNO;

--63. �� ������ ������� �޿� ������ ���Ѵ�.
SELECT JOB, SUM(SAL) FROM EMP
GROUP BY JOB;

--64. 1500 �̻� �޿��� �޴� ������� �μ��� �޿� ����� ���Ѵ�.
SELECT DEPTNO, TRUNC(AVG(SAL)) AS DEPT_AVG_SAL FROM EMP
WHERE SAL >=1500
GROUP BY DEPTNO;

--( hint) having  �̿�
--65. �μ��� ��� �޿��� 2000�̻��� �μ��� �޿� ����� �����´�.
SELECT DEPTNO, TRUNC(AVG(SAL)) AS AVG_SAL FROM EMP
--WHERE AVG(SAL) >= 2000
GROUP BY DEPTNO
HAVING TRUNC(AVG(SAL)) >= 2000;

--66. �μ��� �ִ� �޿����� 3000������ �μ��� �޿� ������ �����´�.
SELECT DEPTNO, SUM(SAL) AS TOTAL FROM EMP
GROUP BY DEPTNO
HAVING MAX(SAL) <= 3000;
--SELECT * FROM EMP WHERE DEPTNO = 30;

--67. �μ��� �ּ� �޿����� 1000 ������ �μ����� ������ CLERK�� ������� �޿� ������ ���Ѵ�
SELECT DEPTNO, JOB, SUM(SAL) AS TOTAL FROM EMP
GROUP BY DEPTNO, JOB
HAVING MIN(SAL) <= 1000 AND JOB = 'CLERK';

--68. �� �μ��� �޿� �ּҰ� 900�̻� �ִ밡 10000������ �μ��� ����� ��1500�̻��� �޿��� �޴� ������� ��� �޿����� �����´�.
SELECT DEPTNO, TRUNC(AVG(SAL)) AS AVG_SAL FROM EMP
WHERE SAL >= 1500
GROUP BY DEPTNO
HAVING MIN(SAL)>=900 AND MAX(SAL) <= 10000;

--(hint)  join �̿�
--69. ����� �����ȣ, �̸�, �ٹ��μ� �̸��� �����´�.
SELECT E.EMPNO, E.ENAME, E.DEPTNO, D.DNAME 
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

--70. ����� �����ȣ, �̸�, �ٹ������� �����´�.
SELECT E.EMPNO, E.ENAME, D.LOC 
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

--71. DALLAS�� �ٹ��ϰ� �ִ� ������� �����ȣ, �̸�, ������ �����´�.
SELECT E.EMPNO, E.ENAME, E.JOB
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND D.LOC = 'DALLAS';

--72. SALES �μ��� �ٹ��ϰ� �ִ� ������� �޿� ����� �����´�.
--TEST
--SELECT TRUNC(AVG(SAL)) FROM EMP 
--WHERE DEPTNO = 30
--GROUP BY DEPTNO;

SELECT E.DEPTNO, TRUNC(AVG(E.SAL)) AS AVGSAL 
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND D.DNAME = 'SALES'
GROUP BY E.DEPTNO; 

--73. 1982�⿡ �Ի��� ������� �����ȣ, �̸�, �Ի���, �ٹ��μ��̸��� �����´�.
SELECT EMPNO, ENAME, HIREDATE, DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND HIREDATE BETWEEN '1982/01/01' AND '1982/12/31';

--74. �� ������� �����ȣ, �̸�, �޿�, �޿������ �����´�.
SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
FROM EMP E, SALGRADE S
WHERE SAL BETWEEN S.LOSAL AND S.HISAL;

--75. SALES �μ��� �ٹ��ϰ� �ִ� ����� �����ȣ, �̸�, �޿������ �����´�.
SELECT E.EMPNO, E.ENAME, S.GRADE
FROM EMP E, SALGRADE S, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND DNAME = 'SALES'
AND E.SAL BETWEEN S.LOSAL AND S.HISAL;

--76. �� �޿� ��޺� �޿��� ���հ� ���, ����Ǽ�, �ִ�޿�, �ּұ޿��� �����´�.
SELECT S.GRADE, SUM(E.SAL) AS SUM, TRUNC(AVG(E.SAL)) AS AVG,
        COUNT(*) AS COUNT, MAX(E.SAL) AS MAX, MIN(E.SAL) AS MIN
FROM SALGRADE S, EMP E
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
GROUP BY S.GRADE;

--77. �޿� ����� 4����� ������� �����ȣ, �̸�, �޿�, �ٹ��μ��̸�, �ٹ������� �����´�.
SELECT E.EMPNO, E.ENAME, E.SAL, D.DNAME, D.LOC
FROM SALGRADE S, EMP E, DEPT D
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL 
AND S.GRADE = 4
AND E.DEPTNO = D.DEPTNO;

--(hint) self join �̿�
--78. SMITH ����� �����ȣ, �̸�, ���ӻ�� �̸��� �����´�.
SELECT E1.EMPNO, E1.ENAME, E2.ENAME AS MGRNAME 
FROM EMP E1, EMP E2
WHERE E1.ENAME = 'SMITH' AND E1.MGR = E2.EMPNO;

--79. FORD ��� �ؿ��� ���ϴ� ������� �����ȣ, �̸�, ������ �����´�.
SELECT E2.EMPNO, E2.ENAME, E2.JOB
FROM EMP E1, EMP E2
WHERE E1.ENAME = 'FORD' AND E1.EMPNO = E2.MGR;

--80. SMITH ����� ���ӻ���� ������ ������ ������ �ִ� ������� �����ȣ, �̸�, ������ �����´�.
SELECT E3.EMPNO, E3.ENAME, E3.JOB
FROM EMP E1, EMP E2, EMP E3
WHERE E1.ENAME = 'SMITH' 
AND E1.MGR = E2.EMPNO
AND E2.JOB = E3.JOB;
--SELECT * FROM EMP
--WHERE JOB = 'ANALYST' ; -- 1��


--(hint) outer join �̿�
--81. �� ����� �̸�, �����ȣ, ������ �̸��� �����´�. �� ���ӻ���� ���� ����� �����´�.
SELECT E1.ENAME, E1.EMPNO, E2.ENAME AS MGR_NAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO;

--82. ��� �μ��� �Ҽ� ����� �ٹ��μ���, �����ȣ, ����̸�, �޿��� �����´�
SELECT E.DEPTNO, E.EMPNO, E.ENAME, E.SAL
FROM DEPT D, EMP E
WHERE E.DEPTNO = D.DEPTNO;
GROUP BY DEPTNO;

--(hint) subquery

--83. SMITH����� �ٹ��ϰ� �ִ� �μ��� �̸��� �����´�.
SELECT D.DEPTNO, D.DNAME
FROM (SELECT * FROM EMP WHERE ENAME = 'SMITH') E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

--84. SMITH�� ���� �μ��� �ٹ��ϰ� �ִ� ������� �����ȣ, �̸�, �޿���, �μ��̸��� �����´�.
SELECT E2.EMPNO, E2.ENAME, E2.SAL, D.DNAME
FROM (SELECT * FROM EMP WHERE ENAME = 'SMITH') E1, EMP E2, DEPT D
WHERE E1.DEPTNO = E2.DEPTNO AND E2.DEPTNO = D.DEPTNO;

--85. MARTIN�� ���� ������ ������ �ִ� ������� �����ȣ, �̸�, ������ �����´�.
SELECT E2.EMPNO, E2.ENAME, E2.JOB
FROM (SELECT * FROM EMP WHERE ENAME = 'MARTIN') E1, EMP E2
WHERE E1.JOB = E2.JOB;

--86. ALLEN�� ���� ���ӻ���� ���� ������� / �����ȣ, �̸�,  / ���ӻ���̸� �� �����´�.  (E------------------------------ �ٽ�Ǯ��
SELECT E.EMPNO, E.ENAME, M.MGR, E2.ENAME AS MGR_NAME
FROM (SELECT * FROM EMP WHERE ENAME = 'ALLEN') M, EMP E, EMP E2
WHERE E.MGR = M.MGR AND M.MGR = E2.EMPNO;

---- ALLEN �� ���� ���
--SELECT E.EMPNO, E.ENAME, M.MGR
--FROM (SELECT * FROM EMP WHERE ENAME = 'ALLEN') M, EMP E
--WHERE E.MGR = M.MGR;
----����� ����̸� ��������
--SELECT E1.EMPNO, E1.ENAME, E2.ENAME AS MGR_NAME
--FROM EMP E1, EMP E2
--WHERE E1.MGR = E2.EMPNO;

--87. WARD�� ���� �μ��� �ٹ��ϰ� �ִ� ������� �����ȣ, �̸�, �μ���ȣ�� �����´�.
SELECT E.EMPNO, E.ENAME, E.DEPTNO
FROM EMP E, (SELECT * FROM EMP WHERE ENAME = 'WARD') D
WHERE E.DEPTNO = D.DEPTNO;


--88. SALESMAN�� ��� �޿����� ���� �޴� ������� �����ȣ, �̸�, �޿��� �����´�.
SELECT E.EMPNO, E.ENAME, E.SAL
FROM EMP E, (SELECT TRUNC(AVG(SAL)) AS AVG_SAL FROM EMP WHERE JOB='SALESMAN' GROUP BY JOB) E2
WHERE E.SAL > E2.AVG_SAL;  

---- ����..
--SELECT E.EMPNO, E.ENAME, E.SAL
--FROM EMP E
--WHERE E.SAL > (SELECT TRUNC(AVG(SAL)) AS AVG_SAL FROM EMP WHERE JOB='SALESMAN' GROUP BY JOB);

-- SALES ��ձ޿�
--SELECT TRUNC(AVG(SAL)) AS AVG_SAL
--FROM EMP 
--WHERE JOB='SALESMAN' 
--GROUP BY JOB;

--89. DALLAS ������ �ٹ��ϴ� ������� ��� �޿��� �����´�.
SELECT TRUNC(AVG(SAL)) 
FROM EMP E
WHERE E.DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC = 'DALLAS')
GROUP BY DEPTNO;

--90. SALES �μ��� �ٹ��ϴ� ������� �����ȣ, �̸�, �ٹ������� �����´�
SELECT EMPNO, ENAME, DNAME, LOC
FROM EMP E, (SELECT * FROM DEPT WHERE DNAME = 'SALES') D
WHERE E.DEPTNO = D.DEPTNO;

--91. CHICAGO ������ �ٹ��ϴ� ����� �� BLAKE�� ���ӻ���� ������� �����ȣ, �̸�, ������ �����´�.	
SELECT EMPNO, ENAME, JOB, LOC, MGR
FROM EMP E, (SELECT * FROM DEPT WHERE LOC = 'CHICAGO') D
WHERE E.DEPTNO = D.DEPTNO
AND MGR = (SELECT EMPNO FROM EMP WHERE ENAME = 'BLAKE');

--SELECT ENAME FROM EMP WHERE EMPNO = 7698;

--(hint) ����� �ϳ� �̻��� subquery�� in,some,any , all  �� �̿��Ѵ�.
--92. 3000 �̻��� �޿��� �޴� ������ ���� �μ��� // �ٹ��ϰ� �ִ� ����� �����ȣ, �̸�, �޿��� �����´�
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE SAL >= 3000);

--93. ������ CLERK�� ����� ������ �μ��� �ٹ��ϰ� �ִ� ������� �����ȣ, �̸�, �Ի��� �����´�.
SELECT EMPNO, ENAME, HIREDATE
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE JOB = 'CLERK');
