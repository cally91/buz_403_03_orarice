grant dba to USER6;
--여기는 user6 화면입니다.

 CREATE TABLE tbl_student (
 st_num VARCHAR2(5) PRIMARY key,
 st_name NVARCHAR2(50) NOT NULL,
 st_tel VARCHAR2(20),
 st_grade NUMBER
 );
 
 INSERT INTO tbl_student(st_num , st_name, st_tel ,st_grade)
 VALUES ('00001','홍길동','001',3);
 INSERT INTO tbl_student(st_num , st_name, st_tel ,st_grade)
 VALUES ('00002','성춘향','002',3);
 INSERT INTO tbl_student(st_num , st_name, st_tel ,st_grade)
 VALUES ('00003','이몽룡','003',3);
 INSERT INTO tbl_student(st_num , st_name, st_tel ,st_grade)
 VALUES ('00004','임꺽정','004',3);
 INSERT INTO tbl_student(st_num , st_name, st_tel ,st_grade)
 VALUES ('00005','장녹수','005',3);
 COMMIT;
 
 CREATE TABLE tbl_score(
  sc_seq NUMBER PRIMARY KEY,
  sc_st_num VARCHAR2(5) NOT NULL,
  sc_subject NVARCHAR2(20) not NULL,
  sc_score NUMBER
  );
  CREATE SEQUENCE seq_score
  START WITH 1
  INCREMENT BY 1;
  
  INSERT INTO tbl_score(sc_seq,sc_st_num,sc_subject,sc_score)
  VALUES(SEQ_SCOre.nextval,'00001','국어',90);
COMMIT;

SELECT seq_score.nextval from  dual;
SELECT
    *
FROM tbl_student;

SELECT* FROM tbl_score;
