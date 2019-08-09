-- 여기는 UEER
SELECT * FROM tbl_student;
SELECT * FROM tbl_score;
drop TABLE tbl_score;

CREATE TABLE tbl_score(
SC_SEQ	NUMBER,
SC_ST_NUM	VARCHAR2(5) not NULL,
SC_SUBJECT	NVARCHAR2(3)not NULL,
SC_SCORE	NUMBER,
PRIMARY KEY(Sc_SEQ)
);
--TBL_STUDENT 와 tbl_score
ALTER  TABLE tbl_score
ADD CONSTRAINT F_ST_NUM FOREIGN KEY (sc_st_num)
REFERENCES tbl_student(st_num)
on DELETE CASCADE;

--다중 칼럼
--학번이 같고, 과목번호가 같은 값이 2개이상 없도록 하라 제약상향
--학번 :0001 과목 1의 레코드가 있으면 0001,1의 갑은 저장하지말라
ALTER TABLE tbl_score
ADD CONSTRAINT u_st_num_subject UNIQUE (sc_st_num,sc_subject);

INSERT into TBL_SCORE(SC_SEQ,sc_st_num,sc_SUBJECT,sc_score)
VALUES(SEQ_SCORE.NExtval,'00001','1',90);
SELECT
    *
FROM tbl_score;

COMMIT;