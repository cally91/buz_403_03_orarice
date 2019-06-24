--여기는 user3보여기는 화면입니다

--USER2 에 생성된 tbl_student는
-- 같은 학번의 학생정보를 입력해도
--아무런 문제가 없어 insert가 정상으로 수행된다

-- 이럴 셩우 학법이 값은 다른 학생의 정보들이
--중복되어 INSERT 가 될것이다.

--학번이 중복되고 나머지 정보가 다른학생이 입력되면
-- 이테이블은 경함이 있는 데이터가 된다
--데이터를 입력하는 사용자는 많은 데이터를 입력하다보면
--반드시 실수를 통해 중복데이터를 추가할수밖에 없다.

-- 그래서
--테이블을 생성하면서 특정한 칼럼에 절대 중복데이터가 입력되는
-- 일이 없도록 막는 제약 조건을 설정해서 
-- 오류가 있는 데이터를 추가하지 못하도록 해야한다.

CREATE TABLE tbl_student (
 st_num CHAR(5) UNIQUE, --st_num 칼럼에는 절대 중복된 데이터가 입력될수 없다.
 st_name nVARCHAR2(50),
 st_tel VARCHAR2(15)
);

INSERT INTO tbl_student(st_num,st_name, st_tel)
VALUES('001','홍길동','001-001');

INSERT INTO tbl_student(st_name, st_tel)
VALUES('성춘향','00010001');

SELECT * FROM tbl_student;

--테이블 삭제
DROP TABLE tbl_student; 

CREATE TABLE tbl_student (
-- UNIQUE와 not null옵션은 특정 칼럼의 데이터를
--   유일하고 비여있지 않는 상태로 유지하여
--  table 전체의 무결점을 유지하기 위한 설정이다.
--UNIQUE :st_num 칼럼에는 절대 중복된 데이터가 입력될수 없다.
-- NOT NULL; st_num 칼럼에는 절대 비워둘수없다
 st_num CHAR(5) UNIQUE NOT NULL, 
 st_name nVARCHAR2(50),
 st_tel VARCHAR2(15)
);

INSERT INTO tbl_student(st_num,st_name)
VALUES('00001','홍길동');

INSERT INTO tbl_student(st_name)
VALUES('홍길동');

DROP TABLE tbl_student; 

CREATE TABLE tbl_student (

    -- PK는 데이터 테이블의 무결성을 보장하기 위한 매우 중요한 설정
    --PK로 설정된 칼럼은 그 값이 유일하고 결점이 없다는 보장을 한다.
 st_num CHAR(5) PRIMARY KEY,  --UNIQUE NOT NULL, 
 st_name nVARCHAR2(50) NOT NULL,
 st_tel VARCHAR2(15)
);

--PK 칼럼과 NOT NULL 칼럼의 데이터가 정상일때 추가 성공 
INSERT INTO tbl_student(st_num,st_name)
VALUES('00001','홍길동');

--이미 추가된 학번과 같은 학번을 INSERT 시도하여
--오류가 발생하면서 추가가 안됨
--unique constraint:중복오류
INSERT INTO tbl_student(st_num,st_name)
VALUES('00001','성춘향');

--not enough values
INSERT INTO tbl_student(st_num,st_name)
VALUES('00002');

--cannot insert NULL into 
INSERT INTO tbl_student(st_num)
VALUES('00002');

--학번도 다르게 이름도 반드시 있게
--정상적으로 추가 성공
INSERT INTO tbl_student(st_num,st_name)
VALUES('00002','성춘향');

SELECT *FROM tbl_student;


-- UPDATE명령을 수행하면서
--PK로 설정된 칼럼을  where 절로 설정을 하면
-- 이테이블에 저장된 데이터중에서
-- 단 한개의 레코드만 변경될 것이다.
UPDATE tbl_student
SET st_tel='001-001'
WHERE st_NUM='00002';

--  DELETE 명령을 수행하면서
--pk로 설정된 칼럼을 where 절로 설정을하면
-- 이테이블에 저장된 데이터중에서
-- 단 한개의 레코드만 삭제될 것이다.
DELETE FROM tbl_student
WHERE st_num ='00002'

-- 무결성이란
--테이블에 데이터를 추가할때 pk로 설정된 칼럼은
-- 절데 중복 될 수 없고 , 빈값을 남겨 질수 없다.
--PK칼럼을 조건으로 하여 UPDATA,DELETE를 수행했을때
-- 반드시 1개의 레코드에만 영향이 미친다는 보장



