-- 관리자 질의 작성기 화면
SELECT * 
FROM access$;

SELECT *
FROM access$
WHERE d_obj# =1299;

--SQL 명령문은 대표 키워드로 시작해서 보조 키워드 들이 나열되는 형태이다
-- 일반적으로 명령문이나 변수명들은 대소문자 구별이없다.
--다만 작성할때 학습차원에서
--키워드는 대문자로 사용하고 , 기타 변수명등은 소문자로 작성한다.

--SQL명령문은 여러줄에 걸쳐 사용할수 있고
--명령문 끝에는 세미콘론(;) 붙여준다.

-- 명령문 중간에서 Ctrol +엔터를 누르면
-- 해당하는 명령문을 오라클 DBMS에게 전송하고
--결과를 보여준다

--테이블 객체
--연습을 위해서 잠시 DBA가 되어 봅시다.
-- CREATE TABLE 은 데이터 저장소의 최소단의
-- 실제로 데이터들을 보관할 장소
-- 테이블 객체를 생성할수 있는권한은 DBA에게 있다
--DBA가 아닌 경우는 일반적으로 테이블 객체를 생성할수없다
CREATE TABLE tbl_student (
    at_name nVARCHAR2(30), --데이터의 필드, 맴버 변수역활이며 DB 에서는 칼럼이라고 불른다.
    at_age NUMBER
);
-- CRUD key word는
-- 기본 ket word 와 보조  ker word가있는데
-- 기본 key word 에 따라 보조 key word 가 필수 적으로 따라 다녀야 하는 경우가 있다

--INSERT INTO VALUBS
--SELECT FROM
-- UPDATE SET 
--DELETE FROM
INSERT INTO tbl_student(at_name,at_age)
VALUES('홍길동',33);

INSERT INTO tbl_student(at_name,at_age)
VALUES('성춘향',16);

INSERT INTO tbl_student(at_name,at_age)
VALUES('이몽룡',22);

SELECT*FROM tbl_student;

SELECT*FROM tbl_student
WHERE at_name='성춘향';

SELECT * FROM tbl_student
WHERE at_age =16;

    -- 매우 조심해서 연습할 키워드
    --UPDATE 와 DELETE를 연습
    UPDATE tbl_student
    SET at_age=100
    WHERE at_name= '이몽룡';
SELECT * FROM tbl_student;

DELETE FROM tbl_student
WHERE at_name='김길동';

 --------------
 -- CRUD 표준 명령
 ----------
  --Create
 INSERT INTO 테이블명(칼럼리스트)
 VALUES(데이터리스트);
 
 --Read
SELECT *FROM 테이블명
 WHERE 칼럼=조건;
 
 --Update
 UPDATE 테이블명
 SET 칼럼1=값,칼럼2=값
 WHERE 칼럼 = 조건;

DELETE FROM 테이블명
WHERE 칼럼=조건;