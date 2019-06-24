--user4 화면입니다.

CREATE TABLE tbl_student(
st_no CHAR(3) PRIMARY KEY not null,
st_name nVARCHAR2(20) not null,
st_add  nVARCHAR2(50),
st_gtade NUMBER(1) not null,
st_heignt NUMBER(3),
st_weight NUMBER(3),
st_nick NVARCHAR2(20),
st_nick_nem NVARCHAR2(50),
st_dep_no CHAR(3) not null
);

SELECT
    *
FROM tbl_student;

CREATE TABLE tbl_dept(
	dept_no	CHAR(3)	PRIMARY key NOT NULL,
	dep_name nVARCHAR2(30)NOT NULL,
	dep_pro	nVARCHAR2(50),
	dep_te	nVARCHAR2(50)		
    );
    SELECT * FROM tbl_dept;
    
    
    
    --DDL 생성 :CREATE
    --DDL 삭제 :DROP
    --DDL 변경: ALTER
    ALTER TABLE tbl_student RENAME COLUMN st_dep_no to st_dept_no;
    
    -- 칼럼의 타입
    --원래 존제하는 st_weight 칼럼의 데이터 타임변경
    -- 칼럼 크기를 잘못 변경을 하면 데이터를 읽게 되기도 한다.
    ALTER TABLE tbl_student MODIFY (st_weight NUmBER(5));
    
  ALTER TABLE tbl_dept RENAME COLUMN dep_te to dept_te;
  ALTER TABLE tbl_dept RENAME COLUMN  dep_nume to dept_nume;
  ALTER TABLE tbl_dept RENAME COLUMN dep_pro to dept_pro;
    
    SELECT * FROM tbl_student,tbl_dept
    WHERE st_dept_no=dept_no;
    
    
    
    
    
    -- 실제 데이터가 아니고
    --복잡한 구조의 select문을 마치 하나의 테이블 인것 처럼 취급하기위한 
    --데이터 객체
    CREATE VIEW view_student
    AS(
SELECT st.st_no, ST.st_name, ST.st_add, ST.st_dept_no, DT.dep_name
FROM tbl_student ST
 LEFT JOIN tbl_dept DT
 ON st.st_dept_no =dt.dept_no
);

SELECT *FROM view_student;

SELECT *FROM view_student
WHERE st_name='조용필';


--데이터를 복제하게 되면 원본 데이터에 있는 여러 제약조건이 해제 되기도 한다.
DROP TABLE  tbl_score;

CREATE TABLE tbl_score
as(
SELECT * FROM USER3.tbl_score
WHERE sc_subject='국어'
);

-- 복제된 데이터의 PK가 해제 되었기 때문에
--복제된 데이터에 PK를 제 설정 한다.

ALTER TABLE tbl_score 
--tbl_score 테이블에 sc_sep칼럼을 PRIMARY KEY로 설정을 하라
--이때 이름을 pk로 하라
ADD CONSTRAINT pk PRIMARY KEY (sc_sep);
--PK 삭제
ALTER TABLE tbl_score
DROP PRIMARY KEY;
SELECT * FROM tbl_score;