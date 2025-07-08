/* 주의 사항
 * 단일 line 주석 작성시 -- 와 내용 사이에 blank 필수
 
 step01 - 기본 검색
 select 절 - 
 from 절
  : select엔 검색 컬럼, from 절 table명
  
  step02 - 정렬 검색
select 절
 from 절 order by절
  order by절엔 어떤 컬럼을 내림(desc) 오름(desc)할지
  
 */
use fisa;

show tables;

select * from emp;
select * from dept;
desc emp; -- mysql에서만 가능
desc dept;

-- 1. 해당 계정이 사용 가능한 모든 table 검색
show tables;

-- 2. emp table의 모든 내용(모든 사원(row), 속성(컬럼)) 검색
select * from emp;

-- 3. emp의 구조 검색
desc emp;

-- 4. emp의 사번(empno)만 검색
select empno from emp ;

-- 오름차순 정렬
-- 오름차순 : asc / 내림차순 : desc
select empno from emp order by empno ASC;
select empno from emp order by empno DESC ;

-- 5. emp의 사번(empno), 이름(ename)만 검색
-- 하나 이상의 컬럼 검색시 "," 표기가 구분
select empno, ename from emp order by empno desc;
select empno employee_number, ename employee_name from emp order by empno desc;

-- alias 에 공백 포함하고싶으면 쌍따옴표로 묶어라
select empno "employee number", ename "employee name" from emp order by empno desc;


-- 6. emp의 사번(empno), 이름(ename)만 검색(별칭 적용)
-- "as 별칭" 문법 적용


-- 7. 부서 번호(deptno) 검색
select deptno 부서번호 from emp;


-- 8. 중복 제거된 부서 번호 검색 / distinct
select distinct deptno 부서번호 from emp;

-- 9. 8 + 오름차순 정렬(order by)해서 검색
-- 오름 차순 : asc  / 내림차순 : desc
select deptno 부서번호 from emp order by deptno asc;


-- 10. ? 사번(empno)과 이름(ename) 검색 단 사번은 내림차순(order by desc) 정렬
select empno 사번, ename 이름 
from emp 
order by empno desc;

-- 11. ? dept table의 deptno 값만 검색 단 오름차순(asc)으로 검색
-- 정렬이 필요하다면 디폴트 신경쓰지말고 반드시 order by 절로 처리할것
select deptno 
from dept 
order by deptno asc;

-- 12. ? 입사일(hiredate) 검색, 
-- 입사일이 오래된 직원부터 검색되게 해 주세요
-- 고려사항 : date 타입도 정렬(order by) 가능 여부 확인
-- 데이터 탐색용 단순 검색을 하고 명령어 써라
select hiredate 
from emp
order by hiredate asc;

-- 13. ?모든 사원의 이름과 월 급여(sal)와 연봉 검색
select ename 이름, sal 급여 
from emp;


-- 14. ?모든 사원의 이름과 월급여(sal)와 연봉(sal*12) 검색
-- 단 comm 도 고려(+comm) = 연봉(sal*12) + comm
-- 모든 사원의 이름과 월급여(sal)와 연봉(sal*12)+comm 검색
select ename 이름, (sal  * 12)연봉 from emp;


select ename 이름, (sal * 12) + ifnull(comm, 0) as 연봉 from emp;

-- *** 조건식 ***
-- 15. comm이 null인 사원들의 이름과 comm만 검색
-- where 절 : 조건식 의미
select ename, comm
from emp
where comm is NULL;


-- 16. comm이 null이 아닌 사원들의 이름과 comm만 검색
-- where 절 : 조건식 의미
-- 아니다 라는 부정 연산자 : not 
select ename, comm 
from emp
where comm is not NULL;

-- ?모든 직원명, comm으로 내림 차순 정렬
select ename 이름, comm 커미션
from emp
where comm is not null
order by comm desc;

-- null값 보유컬럼 오름차순 정렬인 경우 null 부터 검색 
select ename 이름, comm 커미션
from emp
order by comm asc;

-- 17. ? 사원명이 스미스인 사원의 이름과 사번만 검색
-- = : db에선 동등비교 연산자
-- 참고 : 자바에선  == 동등비교 연산자 / = 대입연산자
select ename 이름, empno 사번 
from emp
where ename = "SMITH";



-- 18. 부서번호가 10번 부서의 직원들 이름, 사번, 부서번호 검색
-- 단, 사번은 내림차순 검색

-- from -> where -> select -> order by // DB마다 다르긴 함 쨌든 from이 맨 먼저
select ename 이름, empno 사번, deptno 부서번호
from emp
where deptno = 10
order by empno desc;


-- 19. ? 기본 syntax를 기반으로 
-- emp  table 사용하면서 문제 만들기

-- 커미션이 null인 직원을 가진 부서를 출력(중복 제거해서 내림차순으로)하기.

select distinct deptno
from emp
where comm is null
order by deptno desc;

/*부서의 직원들 ename = 사원 명, empno = 사번, sal = 월급 으로검색
급여는 내림차순으로 정렬.*/

select ename "사원 명", empno 사번, sal 월급
from emp
order by sal desc;

-- ?부서 번호(deptno)는 오름 차순(asc) 
-- 단 해당부서(deptno)에 속한 직원번호(empno)도 오름차순(asc) 정렬


-- 결과가 맞는 문장인지의 여부 확인을 위한 추가 문장 개발해 보기 


-- 20. 급여(sal)가 900(>=)이상인 사원들 이름, 사번, 급여 검색 
select sal from emp;

select ename, empno, sal
from emp
where sal >= 900;

-- 이름으로 오름차순
select ename, empno, sal
from emp
where sal >= 900
order by ename asc;




select ename, empno, sal
from emp
where sal >= 900
order by sal asc, ename asc;

-- 21. deptno 10, job 은 manager(대문자로) 이름, 사번, deptno, job 검색
select ename, empno, deptno, job
from emp

where job = "MANAGER" &&  deptno = 10;

-- 대소문자 비교 하면서 검색 검색 불가
select job from emp where job=binary('manager');

-- 검색 성공
select job from emp where job=binary('MANAGER');


-- 무조건 데이터를 대문자로 변경후 검색
select job from emp where job=upper('manager');



-- smith 소문자를 대문자로 변경해서 비교
select ename
from emp
where ename = upper('smith');

-- 22.? deptno가 10 아닌 직원들 사번, 부서번호만 검색
-- 부정연산자 not / != / <>
select empno 사번, deptno 부서번호
from emp
where deptno <> 10;


-- 23. sal이 2000이하(sal <= 2000) 이거나(or) 3000이상(sal >= 3000)인 사원명, 급여 검색

select sal
from emp
where sal <= 2000 or sal >= 3000;


-- 24.  comm이 300 or 500 or 1400인
select sal
from emp
-- where (comm == 300 or comm 500 or comm == 1400) && comm is not null;
where comm in (300, 500, 1400);

-- in 연산식 사용해서 좀더 개선된 코드
-- 25. ?  comm이 300 or 500 or 1400이 아닌 사원명 검색
-- null값 미포함!!!


-- 26. 81/09/28 날 입사한 사원 이름.사번 검색
-- date 타입 비교 학습
-- date 타입은 '' 표현식 가능 
select ename 사번, empno 사번
from emp
where hiredate = '81-09-28';



-- yy/mm/dd 포멧은 차후에 변경 예정(함수)


-- 27. 날짜 타입의 범위를 기준으로 검색
-- 범위비교시 연산자 : between~and 1980-12-17~1981-09-28
select hiredate from emp oreder by hiredate acs;
select hiredater from emp 
where hiredate between '1980-12-17' and '1981-09-28'


-- 28. 검색시 포함된 모든 데이터 검색하는 기술
-- 참고: 실행속도는 낮음
-- 빠른 검색이 중요할 경우 검색 기능은 검색 엔진이 내장된 sw를 사용하길 권장

-- 순수 sql 문장으로 검색
-- like 연산자 사용
-- % : 철자 개수 무관하게 검색 / _ : 철자 개수 하나를 의미



-- 29. 두번째 음절의 단어가 M(_M)인 모든 사원명 검색 
select ename 사원
from emp
where ename like '_M%';


-- 두개의 글자, 단 두 번재 문자는 M이어야 함

-- 30. 단어가 M을 포함한 모든 사원명 검색
select ename 사원
from emp
where ename like '%M%';


