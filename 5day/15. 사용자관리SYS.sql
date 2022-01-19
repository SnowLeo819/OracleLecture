-- 15. 사용자 관리

-- 사용자생성
CREATE USER ORACLESTUDY IDENTIFIED BY ORACLE;

GRANT CREATE SESSION TO ORACLESTUDY;   -- 접속권한
GRANT RESOURCE, CREATE SESSION, CREATE TABLE TO ORACLESTUDY;  -- 접속권한 + 테이블 작성 권한


-- 사용자 삭제  //1. 접속 해제.. 2. 삭제..
DROP USER ORACLESTUDY CASCADE;

--TEST_USER

CREATE USER TEST_USER IDENTIFIED BY TEST;
GRANT RESOURCE, CREATE SESSION, CREATE TABLE TO TEST_USER; 

DROP USER TEST_USER CASCADE;

-- 다른 사람의 테이블 조회 권한.

-- 역할  ROLE   미리 역할에 따른 권한을 부여해두면 필요할 때 권한부여를 한번에 줄 수 있음...
CREATE ROLE ROLESTUDY;
GRANT CONNECT, RESOURCE, CREATE TABLE, CREATE VIEW, CREATE SYNONYM, CREATE SESSION TO ROLESTUDY;

CREATE USER NEWORCL IDENTIFIED BY ORACLE;
GRANT ROLESTUDY TO NEWORCL;
REVOKE ROLESTUDY FROM NEWORCL;