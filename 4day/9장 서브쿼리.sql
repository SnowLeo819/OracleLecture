-- 서브쿼리.. 쿼리안에 또다른 쿼리 넣기

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
                WHERE ENAME = 'JONES'  -- 스칼라 서브쿼리
            );
            
-- 서브쿼리 사용 EMP 중에 ALLEN 의 추가수당보다 많은 사람
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


--20번 부서 사람 중 전체사원 평균급여보다 높은 급여 받는자
SELECT *
FROM EMP
WHERE DEPTNO = 20 
AND SAL > (SELECT TRUNC(AVG(SAL)) FROM EMP);

SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO 
AND E.DEPTNO = 20
AND E.SAL >=(SELECT TRUNC(AVG(SAL)) FROM EMP);

-- 실행결과가 여러개 나올 경우

SELECT *
FROM EMP
WHERE DEPTNO IN (20,30);

-- 각 부서 최고급여 받는자
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
GROUP BY DEPTNO;  -- 이 계열로 묶음(그룹)


-- 각 부서 최고급여 받는자 // 다른방법
SELECT *                          -- ANY 는 값이 하나만 있어도 TRUE
FROM EMP                          -- ALL 모든 조건을 만족해야 TRUE
WHERE SAL = ANY (SELECT MAX(SAL)   
                FROM EMP
                GROUP BY DEPTNO);
                
SELECT *                          -- SOME 은 ANY와 같은 조건..
FROM EMP
WHERE SAL = SOME (SELECT MAX(SAL) 
                FROM EMP
                GROUP BY DEPTNO);

--필터링 느낌..
SELECT *
FROM EMP
WHERE SAL = ALL(1000,2000,3000);

SELECT *
FROM EMP
WHERE SAL = ANY(1000,2000,3000);

SELECT *
FROM EMP
WHERE EXISTS (SELECT DNAME FROM DEPT WHERE DEPTNO = 10);


-- EMP 10 부서의 모든 사람들 보다 일찍 입사한 사람,

SELECT *
FROM EMP -- 행/열이 있으면 TABLE
WHERE HIREDATE < ALL (SELECT HIREDATE FROM EMP WHERE DEPTNO = 10);

-- SELECT 절에 사용하는 서브쿼리 스칼라 서브쿼리
-- WHERE 절에 쓰는 서브쿼리 는  다중열 서브쿼리(중첩서브쿼리)
-- FROM 절에 쓰는 서브쿼리 는 INLINE VIEW   인라인 뷰( 뷰는 테이블과 비슷 테이블 중에 보여줄 부분만 보여줌 )

SELECT *
FROM EMP
WHERE DEPTNO = 10;
SELECT *
FROM DEPT;

SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
FROM (SELECT * FROM EMP WHERE DEPTNO =10) E10, 
    (SELECT * FROM DEPT) D
WHERE E10.DEPTNO = D.DEPTNO;

-- SELECT 절에 사용하는 서브쿼리 스칼라 서브쿼리
SELECT EMPNO, ENAME, JOB, SAL,
        ( SELECT GRADE FROM SALGRADE WHERE E.SAL BETWEEN LOSAL AND HISAL )AS SALGRADE,
        DEPTNO,
        ( SELECT DNAME FROM DEPT WHERE E.DEPTNO = DEPT.DEPTNO )AS DNAME
FROM EMP E;
SELECT GRADE FROM SALGRADE;

-- 20번 부서에서 



