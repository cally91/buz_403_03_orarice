--여기는 user4화면
 
 DROP TABLE tbl_score;
 CREATE TABLE tbl_score (
 	sc_seq	NUMBER	PRIMARY KEY 	NOT NULL,
	sc_date	VARCHAR2(10)		NOT NULL,
sc_st_no	CHAR(3)		NOT NULL,
sc_subject	nVARCHAR2(50)		NOT NULL,
sc_score	NUMBER		

 );
 
 -- score를 위한 SEQUENCE 를 생성
 -- 시작 번호를 100으로 한 이유는
 --현재 엑셀에 데이터를 입력해서 임포트를 할려고한다
 -- 엑셀에 입력되어 있는데이터가 일련번호 21까지 차지하고있어거
 --이후 INSERT를 수행할때 새로운번호 100부터 시작하기 위함이다.
 CREATE SEQUENCE sep_scoer
 START WITH 100
 INCREMENT by 1;
 
 SELECT
     *
 FROM tbl_score;
 
 --만약 성적데이터에 포함된 과목명이 변경되는 일이 발생하면
 --예을들어 국어 한국어로 바꾸려고한다.
 --UPDATE tbl_score
 --SET  sc_subject='한국어'
 --WHERE sc_subject='국어';
 
 --성적테이블 과 학생테이블이 분리된 상태
 --성적정보를 보면서 학번에 대한 학생이 누구인지 알고 싶으면
 -- join을 실행한다
 CREATE TABLE tal_test
 as(
 SELECT SC.sc_date,SC.sc_st_no,ST.st_name,st.st_add,SC.sc_subject,SC.sc_score
 FROM tbl_score SC
 LEFT JOIN  tbl_student ST
 ON SC.sc_st_no=ST.st_no
 );
 
 SELECT *FROM tal_test;
 
 UPDATE tal_test
 SET st_add = '서울특별시'
 WHERE st_name='조용필';
 
 SELECT*FROM tbl_student;
 UPDATE tbl_student
 SET st_add= '서울특별시'
 WHERE st_no='001';
 
 SELECT SC.sc_date,SC.sc_st_no,ST.st_name,st.st_add,SC.sc_subject,SC.sc_score
 FROM tbl_score SC
 LEFT JOIN  tbl_student ST
 ON SC.sc_st_no=ST.st_no;
 
 
 -- 데이터 베이스 제2 정규화
 --성적데이터로 부터 과목정보를 별도로 분리하여
 -- 과목 데이블로 생성을 하고 
 --성적을 조회할때 과목테이블과 JOIN하여 볼수 있도록 설정할 예정
 
 -- 1.성적 데이터로 부터 과목 정보를 추출
 SELECT sc_subject
 FROM tbl_score
 GROUP by sc_subject
 ORDER by sc_subject;
 
 drop TABLE tbl_subject;
 
 CREATE TABLE tbl_subject(
 sd_no	CHAR(3)	PRIMARY key	NOT NULL,
sd_name	nVARCHAR2(10)		NOT NULL,
sd_rem	NVARCHAR2(50)		
 );
 
 INSERT INTO tbl_subject(sd_no,sd_name, sd_rem)
 VALUES('001','국어','한국어능력시험');
 
 INSERT INTO tbl_subject(sd_no,sd_name, sd_rem )
 VALUES('002','수학','고등수학');
 
 INSERT INTO tbl_subject(sd_no,sd_name, sd_rem )
 VALUES('003','영어','스피킹');
 
 
 SELECT
     *
 FROM tbl_subject;
 
 SELECT
     *
 FROM tbl_score SC
 LEFT JOIN tbl_subject SB
 ON sc.sc_subject=sb.sd_name;
 
 ALTER TABLE tbl_score add(sc_sb_no CHAR(3));
 
 --나. 과목테이블로 부터 정수 테이블에 있는 과목이름를 참조하여
 --  과목코드를 점수 테이블에 업데이트
 
 
 --A.먼저 tbl_score테이블을 펄쳐놓고
 -- tbl_score 테이블의 sc_subject 칼럼의 값을
 --sud SQL 인 SELECT 문에게 보낸다
 -- B. sud SQL (Ouery)인 SELECT문은
 --    tbl_subject 테이블에서 
 --  sc_subject (과목명)을 검색하여
 -- 일치하는 값이 있으면
 -- 과목코드를 리턴한다
 -- c. UPDATE 명령은 리턴받는 과목 코드를 tbl_subject SC_SB_NO칼럼에
 -- 업데이트을 실행
 UPDATE tbl_score SC
 SET sc.sc_sb_no =
 (
 SELECT sd_no FROM tbl_subject SB
 WHERE sb.sd_name=sc.sc_subject
 );
 SELECT *FROM tbl_score;
 
 
 
 
 --tbl_score 의 sc_subjct kffjadmf tkrwp
 ALTER TABLE tbl_score DROP COLUMN sc_subject;
 
 SELECT
     *
 FROM tbl_score;
 
 --tbl_score테이블을 제 2 정규화 완료했다..
 
 SELECT *FROM tbl_score SC
 LEFT JOIN tbl_subject SB
 ON sc.sc_sb_no= sb.sd_no;
 
 SELECT *FROM tbl_subject;
 
 UPDATE tbl_subject
 SET sd_rem ='훈민정음'
WHERE sd_no='001';
 
 -- 점수를 확인하면서 
 -- 과목코드에 대한 과목명도 보고
 -- 학번에 대한 학생이름도 같이보고
 CREATE VIEW view_score
 AS(
 SELECT sc.sc_date,sc.sc_st_no,st.st_name,st.st_add,
 sc.sc_sb_no,sb.sd_name,
 sc.sc_score
 FROM tbl_score SC
 LEFT JOIN tbl_subject SB
 ON sc.sc_sb_no= sb.sd_no
 LEFT JOIN tbl_student ST
 ON sc.sc_st_no =st.st_no
 );
 SELECT*FROM view_score;
 
 