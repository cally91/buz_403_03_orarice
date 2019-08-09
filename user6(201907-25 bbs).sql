--User6화면입니다.
DELETE from tbl_menu;
CREATE TABLE TBL_MENU (

menu_id	VARCHAR2(5)	PRIMARY KEY	,
main_id	VARCHAR2(5)		,
menu_title	nVARCHAR2(50)		NOT NULL,
menu_href	nVARCHAR2(50)		NOT NULL
);

SELECT * --m.menu_id, m.menu_title, s.main_id, s.menu_title
FROM tbl_menu m
LEFT JOIN tbl_menu s
on m.menu_id=s.main_id
WHERE main_id is NULL;

CREATE TABLE tbl_bbs(
bbs_seq	NUMBER	PRIMARY KEY,
bbs_main_seq	NUMBER	,
bbs_layer	NUMBER	,
bbs_date	VARCHAR2(10)	,
bbs_time	VARCHAR2(20)	,
bbs_auth	nVARCHAR2(50)	,
bbs_title	nVARCHAR2(255)	,
bbs_content	nVARCHAR2(1000)	
);

CREATE SEQUENCE seq_bbs
START WITH 1
INCREMENT by 1;

DROP TABLE tbl_bbs_file;
CREATE TABLE tbl_bbs_file(
file_seq	NUMBER	PRIMARY KEY,
file_bbs_seq	NUMBER	,
file_origin_name	nVARCHAR2(1000)	,
file_name	nVARCHAR2(1000)	
);
SELECT * FROM tbl_bbs_file;

CREATE SEQUENCE seq_bbs_file
START WITH 1
INCREMENT by 1;

DELETE FROM tbl_bbs;
DELETE FROM tbl_bbs_file;

COMMIT;

SELECT * FROM tbl_bbs;