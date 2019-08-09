--유저 6 화면
DROP TABLE tBL_iolist;
CREATE TABLE tbl_iolist(
io_seq	NUMBER	PRIMARY KEY	,
io_date	VARCHAR2(10)		NOT NULL,
io_pcode	Nvarchar2(5)		NOT NULL,
io_ccode	Nvarchar2(5)		NOT NULL,
io_inout	Nvarchar2(1)		NOT NULL,
io_pty	NUMBER		,
io_price	NUMBER	,	
io_total	NUMBER	
);
CREATE SEQUENCE seq_iolist
START WITH 1
INCREMENT by 1;

SELECT
    *
FROM tbl_iolist;