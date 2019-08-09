--여기는 관리자 화면입니다.

CREATE TABLESPACE user6TS
DATAFILE 'C:/bizwork/MYDB/user6TS.dbf'
size 100m autoextend on next 100k;

CREATE USER USER6
IDENTIFIED BY 1234
default tablespace USER6ts;

grant dba to USER6;
