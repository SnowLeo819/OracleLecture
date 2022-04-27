-- SQL 문제 풀기 → 월요일까지 풀어서 제출하기....

-- 1. 사원들이 근무하고 있는 근무 부서의 번호를 중복없이 가져오시오.  
SELECT DISTINCT(DEPTNO) AS DEPTNO
FROM EMP;

--(hint) 연결연산자 || 또는 concat 함수 이용 
--2.사원들의 이름과 직무를 다음 양식으로 가져온다. 000 사원의 담당 직무는 XXX 입니다. 
-- ||
SELECT ENAME||' 사원의 담당 직무는 '||JOB||' 입니다.' AS NAME_JOB
FROM EMP;
-- CONCAT
SELECT CONCAT(ENAME, CONCAT(' 사원의 담당 직무는 ',CONCAT(JOB, ' 입니다.')))
FROM EMP;

--(hint) 산술연산자 이용
--3. 각 사원들의 급여액과 급여액에서 1000을 더한 값, 200을 뺀 값, 2를 곱한 값, 2로 나눈 값을 가져오시오.  
SELECT SAL, SAL+1000,SAL-200, SAL*2, SAL/2
FROM EMP;

--4. 각 사원의 급여액, 커미션, 급여 + 커미션 액수를 가져오시오
SELECT SAL, COMM, SAL+NVL(COMM,0) AS TOTAL
FROM EMP;

--5.사원의 이름과 사원 번호를 가져온다
SELECT ENAME, EMPNO FROM EMP;

--6.사원의 이름과 사원 번호, 직무, 급여를 가져온다.
SELECT ENAME, EMPNO, JOB, SAL FROM EMP;

--7. 부서 번호와 부서 이름을 가져온다.
SELECT DEPTNO, DNAME FROM DEPT;

--8.  부서의 모든 정보를 가져온다.
SELECT * FROM DEPT;

--9.  사원의 모든 정보를 가져온다.
SELECT * FROM EMP;

--10.근무 부서가 10번인 사원들의 사원번호, 이름, 근무 부서를 가져온다. 
SELECT EMPNO, ENAME, DEPTNO
FROM EMP
WHERE DEPTNO = 10;

--11.근무 부서 번호가 10번이 아닌 사원들의 사원번호, 이름, 근무 부서 번호를 가져온다.
SELECT EMPNO, ENAME, DEPTNO
FROM EMP
WHERE DEPTNO <> 10;

--12.급여가 1500이상인 사원들의 사원번호, 이름, 급여를 가져온다.
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL >= 1500;

--13.이름이 SMITH 사원의 사원번호, 이름, 직무, 급여를 가져온다. 
SELECT EMPNO, ENAME, JOB, SAL FROM EMP WHERE ENAME ='SMITH';

--14. ??가 SALESMAN인 사원의 사원번호, 이름, 직무를 가져온다. - 직무로 계산
SELECT EMPNO, ENAME, JOB FROM EMP WHERE JOB ='SALESMAN';

--15.직무가 CLERK이 아닌 사원의 사원번호, 이름, 직무를 가져온다. 
SELECT EMPNO, ENAME, JOB FROM EMP WHERE JOB != 'CLERK';

--16. 1982년 1월 1일 이후에 입사한 사원의 사원번호, 이름, 입사일을 가져온다. 
SELECT EMPNO, ENAME, HIREDATE
FROM EMP
WHERE HIREDATE > '1982-01-01';

--(hint) where  논리연산자 이용 (and , or, not in, between  a and b 등등)
--17. 10번 부서에서 근무하고 있는 직무가 MANAGER인 사원의 사원번호, 이름, 근무부서, 직무를 가져온다.  
SELECT EMPNO, ENAME, DEPTNO, JOB
FROM EMP
WHERE DEPTNO = 10 AND JOB = 'MANAGER';

--18.입사년도가 1981년인 사원중에 급여가 1500 이상인 사원의 사원번호, 이름, 급여, 입사일을 가져온다.  
SELECT EMPNO, ENAME, SAL, HIREDATE
FROM EMP
WHERE HIREDATE BETWEEN '1981-01-01' AND '1981-12-31'
AND SAL >= 1500;

--19. 20번 부서에 근무하고 있는 사원 중에 급여가 1500 이상인 사원의 사원번호, 이름, 부서번호, 급여를 가져온다.
SELECT EMPNO, ENAME, DEPTNO, SAL
FROM EMP
WHERE DEPTNO = 20 AND SAL >=1500;

--20. 상관 사원 번호가 7698번인 사원중에 직무가 CLERK인 사원의 사원번호, 이름, 직속상관번호, 직무를 가져온다.
SELECT EMPNO, ENAME, MGR, JOB
FROM EMP
WHERE MGR = '7698' AND JOB = 'CLERK';

--21. 가 2000보다 크거나 1000보다 작은 사원의 사원번호, 이름, 급여를 가져온다. // ?? 급여?
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL BETWEEN 1000 AND 2000;

--22. 번호가 20이거나 30인 사원의 사원번호, 이름, 부서번호를 가져온다.
SELECT EMPNO, ENAME, DEPTNO
FROM EMP
WHERE DEPTNO IN (20, 30);

--23. 직무가 CLERK, SALESMAN, ANALYST인 사원의 사원번호, 이름, 직무를 가져온다.
SELECT EMPNO, ENAME, JOB
FROM EMP
WHERE JOB IN ('CLERK','SALESMAN','ANALYST');

--24.사원 번호가 7499, 7566, 7839가 아닌 사원들의 사원번호, 이름을 가져온다
SELECT EMPNO, ENAME
FROM EMP
--WHERE EMPNO NOT IN ('7499','7566','7839');
WHERE EMPNO NOT IN (7499,7566,7839);

--(hint) like            ==>   _ : 글자 하나를 의미한다.  % : 글자 0개 이상을 의미한다.
--25.이름이 F로 시작하는 사원의 이름과 사원 번호를 가져온다.
SELECT ENAME, EMPNO
FROM EMP
WHERE ENAME LIKE 'F%';

--26.이 S로 끝나는 사원의 이름과 사원 번호를 가져온다.
SELECT ENAME, EMPNO
FROM EMP
WHERE ENAME LIKE '%S';

--27.이름에 A가 포함되어 있는 사원의 이름과 사원 번호를 가져온다.
SELECT ENAME, EMPNO
FROM EMP
WHERE ENAME LIKE '%A%';

--28. 이름의 두번째 글자가 A인 사원의 사원 이름, 사원 번호를 가져온다.
SELECT ENAME, EMPNO
FROM EMP
WHERE ENAME LIKE '_A%';

--29.  이름이 4글자인 사원의 사원 이름, 사원 번호를 가져온다.
SELECT ENAME, EMPNO
FROM EMP
WHERE LENGTH(ENAME) = 4;

--(hint) is null  /  is not null
--30.사원중에 커미션을 받지 않는 사원의 사원번호, 이름, 커미션을 가져온다.
SELECT EMPNO, ENAME, COMM
FROM EMP
WHERE COMM IS NULL;

--31. 회사 대표(직속상관이 없는 사람)의 이름과 사원번호를 가져온다.
SELECT ENAME, EMPNO
FROM EMP
WHERE MGR IS NULL;

-- (hint) order by
--32.사원의 사원번호, 이름, 급여를 가져온다. 급여를 기준으로 오름차순 정렬을 한다.
SELECT EMPNO, ENAME, SAL
FROM EMP
ORDER BY SAL;

--33.사원의 사원번호, 이름, 급여를 가져온다. 사원번호를 기준으로 내림차순 정렬을 한다.
SELECT EMPNO, ENAME, SAL
FROM EMP
ORDER BY EMPNO DESC;

--34.사원의 사원번호, 이름을 가져온다, 사원의 이름을 기준으로 오름차순 정렬을 한다.
SELECT EMPNO, ENAME
FROM EMP
ORDER BY ENAME ASC;

--35.사원의 사원번호, 이름, 입사일을 가져온다. 입사일을 기준으로 내림차순 정렬을 한다.
SELECT EMPNO, ENAME, HIREDATE
FROM EMP
ORDER BY HIREDATE DESC;

--36.직무가 SALESMAN인 사원의 사원이름, 사원번호, 급여를 가져온다. 급여를 기준으로 오름차순 정렬을 한다.
SELECT ENAME, EMPNO, SAL
FROM EMP
WHERE JOB = 'SALESMAN'
ORDER BY SAL;

--37.1981년에 입사한 사원들의 사원번호, 사원 이름, 입사일을 가져온다. 사원 번호를 기준으로 내림차순 정렬을 한다.
SELECT EMPNO, ENAME, HIREDATE
FROM EMP
WHERE HIREDATE BETWEEN '1981-01-01' AND '1981-12-31'
ORDER BY EMPNO DESC;

--38.사원의 이름, 급여, 커미션을 가져온다. 커미션을 기준으로 오름차순 정렬을 한다.
SELECT ENAME, SAL, COMM FROM EMP ORDER BY COMM;
SELECT ENAME, SAL,  NVL(COMM,0) AS COMM FROM EMP ORDER BY COMM;

--39.사원의 이름, 급여, 커미션을 가져온다. 커미션을 기준으로 내림차순 정렬을 한다.
SELECT ENAME, SAL, COMM FROM EMP ORDER BY COMM DESC;
SELECT ENAME, SAL,  NVL(COMM,0) AS COMM FROM EMP ORDER BY COMM DESC;

--(hint) 숫자함수 round, abs, trunc 등등
--40. 전직원의 급여를 2000 삭감하고 삭감한 급여액의 절대값을 구한다.
SELECT EMPNO, ENAME, (SAL-2000) AS SUB, ABS(SAL-2000) AS ABS
FROM EMP;

--41. 급여가 1500 이상인 사원의 급여를 15% 삭감한다. 단 소수점 이하는 버린다.
SELECT EMPNO, ENAME, SAL, SAL-TRUNC(SAL*0.15) AS RESULT
FROM EMP
WHERE SAL >= 1500;

--42.급여가 2천 이하인 사원들의 급여를 20%씩 인상한다. 단 10의 자리를 기준으로 반올림한다.
SELECT EMPNO, ENAME, SAL, SAL+ROUND(SAL*0.2,-2) AS RISED
FROM EMP
WHERE SAL <=2000;

--43.전 직원의 급여를 10자리 이하를 삭감한다
SELECT EMPNO, ENAME, TRUNC(SAL,-2) AS TRUNC_SAL FROM EMP;

--( hint) decode / case 
--44. 각 사원의 부서 이름을 가져온다.
SELECT EMPNO, ENAME, DEPTNO,
DECODE ( DEPTNO,
                10, '인사과',
                20, '개발부',
                30, '경영지원팀',
                40, '생산부'
            ) AS DEPT_NAME
FROM EMP;

-- 45.직급에 따라 인상된 급여액을 가져온다.
SELECT EMPNO, ENAME, JOB, SAL, 
CASE 
WHEN JOB = 'CLERK' THEN TRUNC(SAL*1.1)
WHEN JOB = 'SALESMAN' THEN TRUNC(SAL*1.15)
WHEN JOB = 'PRESIDENT' THEN TRUNC(SAL*2)
WHEN JOB = 'MANAGER' THEN TRUNC(SAL*1.05)
WHEN JOB = 'ANALYST' THEN TRUNC(SAL*1.2)
END AS SAL_RESUTL
FROM EMP;

--46.급여액 별 등급을 가져온다.
SELECT EMPNO, ENAME, JOB, SAL,
CASE 
WHEN SAL < 1000 THEN 'C등급'
WHEN SAL BETWEEN 1000 AND 2000 THEN 'C등급'
ELSE 'A등급'
END AS SAL_GRADE
FROM EMP;

--47.직원들의 급여를 다음과 같이 인상한다.
SELECT EMPNO, ENAME, JOB, SAL,
CASE 
WHEN SAL < 1000 THEN SAL*2
WHEN SAL BETWEEN 1000 AND 2000 THEN SAL*1.5
ELSE SAL*3
END AS SAL_RESULT
FROM EMP;

--( hint)그룹함수 이용  sum/avg/count/max/min 등등
--48. 사원들의 커미션 총합을 구한다.
SELECT * FROM EMP;
SELECT SUM(NVL(COMM,0)) AS COMM FROM EMP;

--49.급여가 1500 이상인 사원들의 급여 총합을 구한다.
--SELECT * FROM EMP
--WHERE SAL >= 1500; -- > 25675
SELECT SUM(SAL) FROM EMP
WHERE SAL >= 1500;

--50.20번 부서에 근부하고 있는 사원들의 급여 총합을 구한다.
--SELECT * FROM EMP
--WHERE DEPTNO = 20; -- > 8875

SELECT SUM(SAL) FROM EMP
WHERE DEPTNO = 20; 

--51.직무가 SALESMAN인 사원들의 급여 총합을 구한다.
SELECT SUM(SAL) FROM EMP
WHERE JOB = 'SALESMAN';

--52. 직무가 SALESMAN인 사원들의 이름과 급여총합을 가져온다.--------------------------------------------  다시 ??
-- 부분합.. GROUP BY ROLLUP
SELECT ENAME, SUM(SAL) 
FROM EMP
WHERE JOB = 'SALESMAN'
GROUP BY ROLLUP (ENAME);

--53.전 사원의 급여 평균을 구한다.
SELECT AVG(SAL) FROM EMP;

--54.커미션을 받는 사원들의 커미션 평균을 구한다.
--SELECT * FROM EMP
SELECT AVG(COMM) AS COMM_AVG FROM EMP
WHERE COMM IS NOT NULL;

--55.전 사원의 커미션의 평균을 구한다.
SELECT AVG(NVL(COMM,0)) AS COMM_AVG FROM EMP;

--56.커미션을 받는 사원들의 급여 평균을 구한다.
SELECT AVG(SAL) FROM EMP
WHERE COMM IS NOT NULL;

--57.30번 부서에 근무하고 있는 사원들의 급여 평균을 구한다.
SELECT AVG(SAL) FROM EMP
WHERE DEPTNO = 30;

--58.직무가 SALESMAN인 사원들의 급여 + 커미션 평균을 구한다.
SELECT JOB, SAL, COMM, SAL+NVL(COMM,0) AS SAL_COMM FROM EMP
WHERE JOB = 'SALESMAN';

--59. 사원들의 총 수를 가져온다.
--SELECT * FROM EMP; --13명..
SELECT COUNT(EMPNO) AS COUNT FROM EMP;

--60. 커미션을 받는 사원들의 총 수를 가져온다.
--SELECT * FROM EMP;
SELECT COUNT(EMPNO) AS COUNT FROM EMP
WHERE COMM IS NOT NULL AND COMM <> 0;
--OR
SELECT COUNT(EMPNO) AS COUNT FROM EMP
WHERE NVL(COMM,0) <> 0;


--61. 사원들의 급여 최대, 최소값을 가져온다.
SELECT MAX(SAL) AS MAX_SAL, MIN(SAL) AS MIN_SAL FROM EMP;

--( hint)그룹함수 이용  sum/avg/count/max/min  group by 이용
--62. 각 부서별 사원들의 급여 평균을 구한다.
SELECT DEPTNO, TRUNC(AVG(SAL)) AS AVG_SAL FROM EMP
GROUP BY DEPTNO;

--63. 각 직무별 사원들의 급여 총합을 구한다.
SELECT JOB, SUM(SAL) FROM EMP
GROUP BY JOB;

--64. 1500 이상 급여를 받는 사원들의 부서별 급여 평균을 구한다.
SELECT DEPTNO, TRUNC(AVG(SAL)) AS DEPT_AVG_SAL FROM EMP
WHERE SAL >=1500
GROUP BY DEPTNO;

--( hint) having  이용
--65. 부서별 평균 급여가 2000이상인 부서의 급여 평균을 가져온다.
SELECT DEPTNO, TRUNC(AVG(SAL)) AS AVG_SAL FROM EMP
--WHERE AVG(SAL) >= 2000
GROUP BY DEPTNO
HAVING TRUNC(AVG(SAL)) >= 2000;

--66. 부서별 최대 급여액이 3000이하인 부서의 급여 총합을 가져온다.
SELECT DEPTNO, SUM(SAL) AS TOTAL FROM EMP
GROUP BY DEPTNO
HAVING MAX(SAL) <= 3000;
--SELECT * FROM EMP WHERE DEPTNO = 30;

--67. 부서별 최소 급여액이 1000 이하인 부서에서 직무가 CLERK인 사원들의 급여 총합을 구한다
SELECT DEPTNO, JOB, SUM(SAL) AS TOTAL FROM EMP
GROUP BY DEPTNO, JOB
HAVING MIN(SAL) <= 1000 AND JOB = 'CLERK';

--68. 각 부서의 급여 최소가 900이상 최대가 10000이하인 부서의 사원들 중1500이상의 급여를 받는 사원들의 평균 급여액을 가져온다.
SELECT DEPTNO, TRUNC(AVG(SAL)) AS AVG_SAL FROM EMP
WHERE SAL >= 1500
GROUP BY DEPTNO
HAVING MIN(SAL)>=900 AND MAX(SAL) <= 10000;

--(hint)  join 이용
--69. 사원의 사원번호, 이름, 근무부서 이름을 가져온다.
SELECT E.EMPNO, E.ENAME, E.DEPTNO, D.DNAME 
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

--70. 사원의 사원번호, 이름, 근무지역을 가져온다.
SELECT E.EMPNO, E.ENAME, D.LOC 
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

--71. DALLAS에 근무하고 있는 사원들의 사원번호, 이름, 직무를 가져온다.
SELECT E.EMPNO, E.ENAME, E.JOB
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND D.LOC = 'DALLAS';

--72. SALES 부서에 근무하고 있는 사원들의 급여 평균을 가져온다.
--TEST
--SELECT TRUNC(AVG(SAL)) FROM EMP 
--WHERE DEPTNO = 30
--GROUP BY DEPTNO;

SELECT E.DEPTNO, TRUNC(AVG(E.SAL)) AS AVGSAL 
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND D.DNAME = 'SALES'
GROUP BY E.DEPTNO; 

--73. 1982년에 입사한 사원들의 사원번호, 이름, 입사일, 근무부서이름을 가져온다.
SELECT EMPNO, ENAME, HIREDATE, DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND HIREDATE BETWEEN '1982/01/01' AND '1982/12/31';

--74. 각 사원들의 사원번호, 이름, 급여, 급여등급을 가져온다.
SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
FROM EMP E, SALGRADE S
WHERE SAL BETWEEN S.LOSAL AND S.HISAL;

--75. SALES 부서에 근무하고 있는 사원의 사원번호, 이름, 급여등급을 가져온다.
SELECT E.EMPNO, E.ENAME, S.GRADE
FROM EMP E, SALGRADE S, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND DNAME = 'SALES'
AND E.SAL BETWEEN S.LOSAL AND S.HISAL;

--76. 각 급여 등급별 급여의 총합과 평균, 사원의수, 최대급여, 최소급여를 가져온다.
SELECT S.GRADE, SUM(E.SAL) AS SUM, TRUNC(AVG(E.SAL)) AS AVG,
        COUNT(*) AS COUNT, MAX(E.SAL) AS MAX, MIN(E.SAL) AS MIN
FROM SALGRADE S, EMP E
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
GROUP BY S.GRADE;

--77. 급여 등급이 4등급인 사원들의 사원번호, 이름, 급여, 근무부서이름, 근무지역을 가져온다.
SELECT E.EMPNO, E.ENAME, E.SAL, D.DNAME, D.LOC
FROM SALGRADE S, EMP E, DEPT D
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL 
AND S.GRADE = 4
AND E.DEPTNO = D.DEPTNO;

--(hint) self join 이용
--78. SMITH 사원의 사원번호, 이름, 직속상관 이름을 가져온다.
SELECT E1.EMPNO, E1.ENAME, E2.ENAME AS MGRNAME 
FROM EMP E1, EMP E2
WHERE E1.ENAME = 'SMITH' AND E1.MGR = E2.EMPNO;

--79. FORD 사원 밑에서 일하는 사원들의 사원번호, 이름, 직무를 가져온다.
SELECT E2.EMPNO, E2.ENAME, E2.JOB
FROM EMP E1, EMP E2
WHERE E1.ENAME = 'FORD' AND E1.EMPNO = E2.MGR;

--80. SMITH 사원의 직속상관과 동일한 직무를 가지고 있는 사원들의 사원번호, 이름, 직무를 가져온다.
SELECT E3.EMPNO, E3.ENAME, E3.JOB
FROM EMP E1, EMP E2, EMP E3
WHERE E1.ENAME = 'SMITH' 
AND E1.MGR = E2.EMPNO
AND E2.JOB = E3.JOB;
--SELECT * FROM EMP
--WHERE JOB = 'ANALYST' ; -- 1명


--(hint) outer join 이용
--81. 각 사원의 이름, 사원번호, 직장상사 이름을 가져온다. 단 직속상관이 없는 사원도 가져온다.
SELECT E1.ENAME, E1.EMPNO, E2.ENAME AS MGR_NAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO;

--82. 모든 부서의 소속 사원의 근무부서명, 사원번호, 사원이름, 급여를 가져온다
SELECT E.DEPTNO, E.EMPNO, E.ENAME, E.SAL
FROM DEPT D, EMP E
WHERE E.DEPTNO = D.DEPTNO;
GROUP BY DEPTNO;

--(hint) subquery

--83. SMITH사원이 근무하고 있는 부서의 이름을 가져온다.
SELECT D.DEPTNO, D.DNAME
FROM (SELECT * FROM EMP WHERE ENAME = 'SMITH') E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

--84. SMITH와 같은 부서에 근무하고 있는 사원들의 사원번호, 이름, 급여액, 부서이름을 가져온다.
SELECT E2.EMPNO, E2.ENAME, E2.SAL, D.DNAME
FROM (SELECT * FROM EMP WHERE ENAME = 'SMITH') E1, EMP E2, DEPT D
WHERE E1.DEPTNO = E2.DEPTNO AND E2.DEPTNO = D.DEPTNO;

--85. MARTIN과 같은 직무를 가지고 있는 사원들의 사원번호, 이름, 직무를 가져온다.
SELECT E2.EMPNO, E2.ENAME, E2.JOB
FROM (SELECT * FROM EMP WHERE ENAME = 'MARTIN') E1, EMP E2
WHERE E1.JOB = E2.JOB;

--86. ALLEN과 같은 직속상관을 가진 사원들의 / 사원번호, 이름,  / 직속상관이름 을 가져온다.  (E------------------------------ 다시풀기
SELECT E.EMPNO, E.ENAME, M.MGR, E2.ENAME AS MGR_NAME
FROM (SELECT * FROM EMP WHERE ENAME = 'ALLEN') M, EMP E, EMP E2
WHERE E.MGR = M.MGR AND M.MGR = E2.EMPNO;

---- ALLEN 과 같은 상관
--SELECT E.EMPNO, E.ENAME, M.MGR
--FROM (SELECT * FROM EMP WHERE ENAME = 'ALLEN') M, EMP E
--WHERE E.MGR = M.MGR;
----사원의 상관이름 가져오기
--SELECT E1.EMPNO, E1.ENAME, E2.ENAME AS MGR_NAME
--FROM EMP E1, EMP E2
--WHERE E1.MGR = E2.EMPNO;

--87. WARD와 같은 부서에 근무하고 있는 사원들의 사원번호, 이름, 부서번호를 가져온다.
SELECT E.EMPNO, E.ENAME, E.DEPTNO
FROM EMP E, (SELECT * FROM EMP WHERE ENAME = 'WARD') D
WHERE E.DEPTNO = D.DEPTNO;


--88. SALESMAN의 평균 급여보다 많이 받는 사원들의 사원번호, 이름, 급여를 가져온다.
SELECT E.EMPNO, E.ENAME, E.SAL
FROM EMP E, (SELECT TRUNC(AVG(SAL)) AS AVG_SAL FROM EMP WHERE JOB='SALESMAN' GROUP BY JOB) E2
WHERE E.SAL > E2.AVG_SAL;  

---- 동일..
--SELECT E.EMPNO, E.ENAME, E.SAL
--FROM EMP E
--WHERE E.SAL > (SELECT TRUNC(AVG(SAL)) AS AVG_SAL FROM EMP WHERE JOB='SALESMAN' GROUP BY JOB);

-- SALES 평균급여
--SELECT TRUNC(AVG(SAL)) AS AVG_SAL
--FROM EMP 
--WHERE JOB='SALESMAN' 
--GROUP BY JOB;

--89. DALLAS 지역에 근무하는 사원들의 평균 급여를 가져온다.
SELECT TRUNC(AVG(SAL)) 
FROM EMP E
WHERE E.DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC = 'DALLAS')
GROUP BY DEPTNO;

--90. SALES 부서에 근무하는 사원들의 사원번호, 이름, 근무지역을 가져온다
SELECT EMPNO, ENAME, DNAME, LOC
FROM EMP E, (SELECT * FROM DEPT WHERE DNAME = 'SALES') D
WHERE E.DEPTNO = D.DEPTNO;

--91. CHICAGO 지역에 근무하는 사원들 중 BLAKE이 직속상관인 사원들의 사원번호, 이름, 직무를 가져온다.	
SELECT EMPNO, ENAME, JOB, LOC, MGR
FROM EMP E, (SELECT * FROM DEPT WHERE LOC = 'CHICAGO') D
WHERE E.DEPTNO = D.DEPTNO
AND MGR = (SELECT EMPNO FROM EMP WHERE ENAME = 'BLAKE');

--SELECT ENAME FROM EMP WHERE EMPNO = 7698;

--(hint) 결과가 하나 이상인 subquery는 in,some,any , all  을 이용한다.
--92. 3000 이상의 급여를 받는 사원들과 같은 부서에 // 근무하고 있는 사원의 사원번호, 이름, 급여를 가져온다
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE SAL >= 3000);

--93. 직무가 CLERK인 사원과 동일한 부서에 근무하고 있는 사원들의 사원번호, 이름, 입사일 가져온다.
SELECT EMPNO, ENAME, HIREDATE
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE JOB = 'CLERK');
