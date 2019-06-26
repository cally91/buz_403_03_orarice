

DROP TABLE tbl_stuent;
CREATE TABLE  tbl_stuent(

st_no	CHAR(3)	NOT NULL	PRIMARY KEY,
st_name	nVARCHAR2(30)	NOT NULL	,
st_addr	nVARCHAR2(50)		,
st_grade	NUMBER(1)	NOT NULL	,
st_height	NUMBER(3)		,
st_weight	NUMBER(3)		,
st_nick	nVARCHAR2(30)		,
st_nick_rem	nVARCHAR2(50)	,	
st_dept	NUMBER(5)		,
st_dep_name	NVARCHAR2(5)	NOT NULL	

);

SELECT
    *
FROM tbl_stuent;
DROP TABLE tbl_score;
CREATE TABLE tbl_score(
sc_no	CHAR(3)	PRIMARY key	NOT NULL,
sc_day	VARCHAR(50)		NOT NULL,
sc_st_no	VARCHAR(50)		,
sc_subjet	nVARCHAR2(50),		
sc_score	NUMBER	
);
SELECT * FROM tbl_student ;
SELECT * FROM tbl_score ;
1
SELECT sc_day, sc_st_no,
    SUM(DECODE(sc_subjet,'국어',sc_score,0)) AS 국어,
    SUM(DECODE(sc_subjet,'영어',sc_score,0)) AS 영어,
    SUM(DECODE(sc_subjet,'수학',sc_score,0)) AS 수학
FROM tbl_score
GROUP BY sc_day, sc_st_no;

 