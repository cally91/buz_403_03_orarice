--user5화면입니다.
SELECT
    *
FROM tbl_stuent;

COMMIT;
SELECT MAX(st_no) FROM tbl_stuent;

-- 칼럼의 Type chat이고
-- 칼럼의 데이터들이 숫자형일때만 사용 가능한 문법
SELECT MAX (st_no) + 1 FROM tbl_stuent;

-- 현제 tbl_stuent에서 st_no의 가장 마지막 학번 +1 값으로
-- 새로운 학번을 생성
SELECT LPAD(MAX(ST_NO) +1,3,'0') FROM tbl_stuent;

--PAD 키워드는 특정한 길의 문자열의 패턴을 만드는 방법

--RPAD(값,크기,문자열)
--전체 문자열의 '크기'를 지정하고 , 
--값을 왼쪽에 위치 시키고, 
--남은 부분의 오른쪽에 문자열 채우기

SELECT RPAD(3,5,'0') FROM DUAL;

--LPAD(값,크기,문자열)
--전체 문자열의 '크기'를 지정하고 , 
--값을 오른쪽에 위치 시키고, 
--남은 부분의 왼쪽에 문자열 채우기


SELECT LPAD(3,5,'A') FROM DUAL;


ALTER TABLE tbl_stuent MODIFY ST_DEP_NAME	NVARCHAR2(50);

SELECT
    *
FROM tbl_score;
ALTER TABLE TBL_SCORE MODIFY sc_no NUMBER(5);
ALTER TABLE TBL_SCORE MODIFY SC_ST_NO CHAR(3);

