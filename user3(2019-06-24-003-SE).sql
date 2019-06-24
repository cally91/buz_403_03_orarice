--USER3화면입니다.

SELECT *FROM tbl_score;
SELECT*  FROM tbl_student;


--score 테이블을 조회하면서
--학번에 해당하는 학생정보를 값이 보여주기
--완전JOIN(EQ TOIN)
SELECT * FROM tbl_score,tbl_student
WHERE sc_num=st_num;
--완전 JOIN은 두테이블에 WHERE 조건으로 연결하는 칼럼의
-- 값이 모두 존제할때 사용할수있는 JOIN
-- 두 테이블이 완전하게 Relation되었을때만 정상적인 리스트를 볼수있다.

SELECT*FROM tbl_score 
LEFT JOIN tbl_student 
ON tbl_score.sc_num=tbl_student.st_num;

SELECT tbl_score.sc_num, tbl_score.sc_subject, tbl_score.sc_score,tbl_score.sc_name FROM tbl_score
LEFT JOIN tbl_student  
ON tbl_score.sc_num=tbl_student.st_num;


--LEFR join =OUTTER JOIN
--왼쪽에 잇는 데이블의 데이터는 모두 보여주고
-- 오른쪽에 잇는 데이블에 데이터는 ON조건에 맞는 데이터만 보여라
--만약 없으면 NULL표시하라
SELECT  sc.sc_num, sc.sc_subject, sc.sc_score,st.st_name
FROM tbl_score SC --tbl_score AS sc
LEFT JOIN tbl_student ST --tbl_student AS ST
ON sc.sc_num=st.st_num;
