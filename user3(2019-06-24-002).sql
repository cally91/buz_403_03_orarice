-- 여기는 user3 화면입니다.
CREATE TABLE tbl_score(
 sc_sep NUMBER PRIMARY key, --AUTO INCREMENT:다른 DBMS에서는 INSERT를 수행할때
 -- 칼럼의 값을 자동으로 넘버링 해주는 옵션,
 -- 오라클 11이하에서는 사용 불가
 -- 오라클 12이상에서는 사용 가능
 sc_num CHAR(5) NOT null,
 sc_subject NVARCHAR2(10),
 sc_score NUMBER
);

--오라클 11이하에서는 자동증가 옵션이 없는 관계로 
-- 별도의 넘버링용 요소(객체)를 사용해서 자동증가효과를 만든다.
INSERT INTO tbl_score(sc_sep,sc_num,sc_subject, sc_score)
 VALUES (1,'00001','국어',80);
 
 INSERT INTO tbl_score(sc_sep,sc_num,sc_subject, sc_score)
 VALUES (2,'00001','영어',90);
 
 INSERT INTO tbl_score(sc_sep,sc_num,sc_subject, sc_score)
 VALUES (3,'00001','수학',70);


SELECT *FROM tbl_score;

CREATE SEQUENCE seq_score
START WITH 1
INCREMENT BY 1;

SELECT seq_score.NEXTVAL FROM DUAL;

INSERT INTO tbl_score(sc_sep,sc_num,sc_subject,sc_score)
VALUES (SEQ_SCORE.NEXTVAL, '00002','국어',88);

INSERT INTO tbl_score(sc_sep,sc_num,sc_subject,sc_score)
VALUES (SEQ_SCORE.NEXTVAL, '00002','영어',99);

INSERT INTO tbl_score(sc_sep,sc_num,sc_subject,sc_score)
VALUES (SEQ_SCORE.NEXTVAL, '00002','수학',70);

SELECT*FROM tbl_score;

UPDATE tbl_score
SET sc_score=100
WHERE sc_sep=10;

UPDATE tbl_score
SET sc_score=100
WHERE sc_num='00002' and sc_subject='수학';
-- 여러칼럼에 조건을 설정하여
-- UPDATE나 DELETE 가급적 사용하지않는것이 좋다.
UPDATE sc_score 
SET sc_subject='미술' 
WHERE sc_subject ='수학'; 
--UPDATE나 insert DELETE 를 수행하여도
-- 실제로 물리적이 데이블에 데이터가 저장되지않는다.
--그래서 데이터를 강제로 물리적 데이블에 저장해 줄 필요가 있자.
COMMIT;


INSERT INTO tbl_score(sc_sep,sc_num,sc_subject,sc_score)
VALUES (SEQ_SCORE.NEXTVAL, '00003','국어',90);

INSERT INTO tbl_score(sc_sep,sc_num,sc_subject,sc_score)
VALUES (SEQ_SCORE.NEXTVAL, '00003','영어',88);

INSERT INTO tbl_score(sc_sep,sc_num,sc_subject,sc_score)
VALUES (SEQ_SCORE.NEXTVAL, '00003','수학',80);

SELECT
    *
FROM tbl_score;

-- INSERT,UPDATE, DELETE된 데이터를 되돌리는 기능
-- 취소와 비슷한 개념이며,

-- 가장 최근에 COMMIT된 이후 명령수행(CUD)을 취소하는 역활

ROLLBACK;

SELECT
    *
FROM tbl_score;
