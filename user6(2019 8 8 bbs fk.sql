--유저 6입니다.

ALTER TABLE tbl_bbs_file -- N의 레코드가 있는 테이블
ADD CONSTRAINT FK_BBS_FILE --임의 이름
FOREIGN KEY (file_bbs_seq) -- 서로 연관(FK로 설정할 칼럼
REFERENCES tbl_bbs(bbs_seq) -- 1개의 레코드가 있는 테이블
ON DELETE CASCADE; 
--ON DELETE CASCADE
--만약 TBL_bbs의 어떤 레코드를 삭제했을때
--해당 값의 리스트를 tbl_bbs_file이 가지고 있으면
--몽땅 지워라

 SELECT * FROM tbl_bbs;
 SELECT
     *
 FROM tbl_bbs_file ORDER BY file_bbs_seq;
 
 DELETE FROM tbl_bbs WHERE bbs_seq = 142;
 
 COMMIT;