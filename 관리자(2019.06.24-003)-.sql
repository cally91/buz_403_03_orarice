--관리자 화면입니다.
-- C:/bizwork/MYDB 폴저에 user4TS이름으로 데이블스페이스 생성하고
--이름 user4TS  데이터파일 user4TS.dbf
--크기 :500m.자동증가 100k
CREATE TABLESPACE user4TS
DATAFILE 'C:/bizwork/MYDB/user4TS.dbf'
SIZE 500m AUTOEXTEND ON NEXT 100K;

 --USER4을 생성
 -- 비밀본호 1234,기본 tabl
 
 CREATE USER user4
 IDENTIFIED BY 1234
 DEFAULT TABLESPACE user4TS;
 
GRANT DBA TO user4;
  