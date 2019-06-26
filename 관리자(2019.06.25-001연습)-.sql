-- 여기는 관리자 화면입니다.
--C:\bizwork\mydb 풀더에 USER5TS이름으로 테이블 스페이스를 생성하고
-- 초기크기는 500MB, 자동증가 100KB


--USER5사용자를 생성
--DBA로 권한 을 부여


CREATE TABLESPACE user5TS
DATAFILE 'C:/bizwork/MYDB/user5TS.dbf'
SIZE 500M AUTOEXTEND ON NEXT 100K; 

CREATE USER user5
IDENTIFIED BY 1234
DEFAULT TABLESPACE user5TS;

GRANT DBA TO user5;
