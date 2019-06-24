--여기는 USER3화면입니다

SELECT *FROM tbl_score;
SELECT *FROM tbl_student;


INSERT INTO tbl_score(sc_sep,sc_num,sc_subject,sc_score)
VALUES (SEQ_SCORE.nextval,'00003',',국어',70);

INSERT INTO tbl_score(sc_sep,sc_num,sc_subject,sc_score)
VALUES (SEQ_SCORE.nextval,'00003','영어',80);
INSERT INTO tbl_score(sc_sep,sc_num,sc_subject,sc_score)
VALUES (SEQ_SCORE.nextval,'00003','수학',90);

COMMIT;

--user2와 user3 모두 dba 권한을 가지고있다.
-- 만약 user2rk DBA가 아닌 제한된 권한을 가진 사용자라면
-- 다른 SCHEMA에 있는 테이블은 조회가 불가능하다.
-- 내 schema에 있는 테이블을 다른 사용자가 조회할수있도록
-- 권한을 열어주어야한다.
-- 내 schema에 있는 tbl_score 테이블을 user2가 조회할수있도록
--권한을 열어준다
GRANT SELECT ON tbl_score TO user2;

GRANT INSERT ON tbl_score TO user2;
GRANT DELETE ON tbl_score TO user2;
GRANT UPDATE ON tbl_score TO user2;

GRANT INSERT,SELECT,UPDATE,DELETE ON tbl_score to user2;

-- 전체 부여권한조회
SELECT *FROM DBA_SYS_PRIVS ORDER BY grantee;
-- 현재 사용자 권한 조회
SELECT * FROM USER_SYS_PRIVS;
-- 현재 사용자가 다른 사용자의 권한 조회
SELECT
    *
FROM USER_TAB_PRIVS;
