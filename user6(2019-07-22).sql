--user6

CREATE TABLE tbl_iolist(

io_seq	NUMBER	PRIMARY KEY	,
io_date	VARCHAR2(10)		NOT NULL,
io_product	nVARCHAR2(50)		NOT NULL,
io_comp	nVARCHAR2(50)		NOT NULL,
io_com_ceo	nVARCHAR2(50)		,
io_inout	nVARCHAR2(10)		NOT NULL,
io_qty	NUMBER		,
io_price	NUMBER	,	
io_total	NUMBER		
);

CREATE TABLE tbl_comp(
c_code	VARCHAR2(5)	PRIMARY KEY	,
c_name	Nvarchar2(50)		NOT NULL,
c_ceo	Nvarchar2(51)		NOT NULL,
c_tel	VARCHAR2(20)		,
c_addr	NVARCHAR2(255)		
);
CREATE TABLE tbl_product(
p_code	VARCHAR2(5)	PRIMARY KEY	,
p_name	nVARCHAR2(50)		NOT NULL,
p_iprice	NUMBER		,
p_oprice	NUMBER		
);

DELETE FROM tbl_iolist;

commlt;