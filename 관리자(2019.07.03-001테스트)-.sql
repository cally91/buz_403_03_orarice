--관리자 화면
--데이터를 저장할때 물리적인 저장공간을 설정하는데
--TABLESPACE
CREATE TABLESPACE testTS
DATAFILE 'testTS'
SIZE 100m AUTOEXTEND on next 100k;

CREATE user testuser
IDENTIFIED BY 1234
DEFAULT TABLESPACE tesrTS;

GRANT DBA TO testuser;
REVOKE DBA FROM testuser;

CREATE TABLE tbl_test(
t1 number p
t2

);