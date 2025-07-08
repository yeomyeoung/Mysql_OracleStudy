# Mysql_OracleStudy

## 📘 Oracle 문제 만들어서 풀기

### 내가 만든 문제  
커미션이 NULL이 아닌 직원을 가진 부서에 속한 사원 중,  
이름의 마지막 글자가 'N'인 사원의 부서 코드와 사원명을 출력  
컬럼명은 "부서 코드", "사원명"

```sql
SELECT deptno AS "부서 코드", ename AS "사원명"
FROM emp
WHERE comm IS NOT NULL AND ename LIKE '%N';



### 민지님 문제
각 부서 별 월급 평균, 부서 번호 출력 (부서 번호 오름차순)

SELECT AVG(sal) AS 평균월급, deptno AS 부서번호
FROM emp
GROUP BY deptno
ORDER BY deptno;



-- 소영님 문제
-- hiredate가 1981년 5월 이후인 직원들의 COMM을 출력하기 (NULL → 0으로 대체)
SELECT TO_CHAR(hiredate), NVL(comm, 0)
FROM emp
WHERE hiredate > TO_DATE('1981-04-30', 'YYYY-MM-DD');


-- 태우님 문제
-- SAL + COMM 총합 평균보다 높은 사람 조회 (COMM이 NULL이면 0으로 처리)
SELECT ename, empno
FROM emp
WHERE sal + NVL(comm, 0) > (
    SELECT AVG(sal + NVL(comm, 0))
    FROM emp
);

