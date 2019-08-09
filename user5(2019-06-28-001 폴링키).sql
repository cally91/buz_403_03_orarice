--USER5화면입니다.

-- 매우 위험한 명령

TRUNCATE TABLE tbl_student;

TRUNCATE TABLE  TBL_SCORE;

--DDL 명령 FOREIG KEY(외래키)
-- 두 테이블의 연관 제약사향을 만드는 방법

--창조 무결성 조건
-- 학생과 성적을 입력하는데 
--학생에 없는 학번은 절대 성적에 입력할 수없도록 방지하여(오류 메세지발생)
--학생에 없는 학번을 성적에 입력하는 실수를 방지하는 방법

ALTER TABLE TBL_SCORE
ADD CONSTRAINT f_no FOREIGN KEY (sc_st_no)
REFERENCES tbl_student(st_no);


INSERT into tbl_score(sc_no,sc_day,sc_st_no ,SC_SUBJET,SC_SCORE)
VALUES (1,'2019-06-28','001','국어',90);

INSERT INTO tbl_student(st_no,st_name,st_grade,st_dept_name)
VALUES('001','홍길동',3,'컴공과');



DELETE FROM tbl_student;

ALTER TABLE tbl_score
DROP CONSTRAINT f_no;

ALTER TABLE tbl_student MODIFY st_no VARCHAR2(3);
ALTER TABLE tbl_score MODIFY sc_st_no VARCHAR2(3);

DESC tbl_student;
DESC tbl_score;

SELECT
    *
FROM tbl_student;

ALTER TABLE tbl_score
add c



DROP TABLE TBL_SCORE;
DROP TABLE tbl_student;



CREATE TABLE  tbl_student(
st_no	CHAR(3)	PRIMARY KEY	NOT NULL,
st_name	nVARCHAR2(30)		NOT NULL,
st_addr	nVARCHAR2(50)		,
st_grade	NUMBER(1)		NOT NULL,
st_height	NUMBER(3)		,
st_weight	NUMBER(3)		,
st_nick	nVARCHAR2(20)		,
st_nick_rem	nVARCHAR2(50)	,	
st_dept_name	 nVARCHAR2(20)		NOT NULL
			
);


CREATE TABLE tbl_score(
sc_seq	NUMBER	PRIMARY KEY	NOT NULL,
sc_date	VARCHAR2(10)		NOT NULL,
sc_st_no	CHAR(3)		NOT NULL,
sc_subject	nVARCHAR2(50)		NOT NULL,
sc_score	NUMBER		

);

SELECT * FROM tbl_score;
SELECT * FROM tbl_student;

