-- 여기는 
CREATE TABLE tbl_iniist(
io_sep	NUMBER	PRIMARY KEY,
 io_date	VARCHAR(10)		NOT NULL,
io_product	nVARCHAR2(50)		NOT NULL,
io_dept	nVARCHAR2(50)		NOT NULL,
io_dept_ceo	nVARCHAR2(30)		,
io_inout	nVARCHAR2(10)		NOT NULL,
io_ant	NUMBER		,
io_prtce	NUMBER	,	
io_total	NUMBER

);

SELECT COUNT(*) FROM tbl_iniist
GROUP BY io_inout;

SELECT count(*) FROM tbl_iniist;

SELECT  io_inout, COUNT(*) FROM tbl_iniist
GROUP BY io_inout;

--tbl_ioLIST테이블의 제2정규화 작업을 진행
-- 상품정보를 tbl_ioLIST로부터 분리해서 상품테이블로 생성하기
SELECT io_product
FROM tbl_iniist
GROUP by io_product
ORDER BY io_product;

--상품테이블 생성
CREATE TABLE tbl_product(
p_code	VARCHAR(7)	PRIMARY key,
p_name	nVARCHAR2(50)		NOT NULL,
p_iprice	NUMBER		,
p_oprice	NUMBER		
);

SELECT COUNT(*) FROM tbl_product;
-- 거래처 정보 분리를 위해서
-- tbl_iniist에서 거래처 정보를 분리
SELECT io_dept, io_dept_ceo
FROM tbl_iniist
GROUP BY IO_DEPT,IO_dept_ceo 
ORDER BY IO_DEPT;

DROP TABLE tbl_comp;
CREATE TABLE tbl_comp(
c_cobe	VARCHAR2(5)	PRIMARY KEY,
c_name	nVARCHAR2(50)		NOT NULL,
c_ceo	nVARCHAR2(50)		NOT NULL,
c_tel	VARCHAR2(15)		,
c_addr	nVARCHAR2(125)	
);
SELECT COUNT (*)FROM tbl_comp;

ALTER TABLE TBL_INIIST add io_pcoed VARCHAR(7);
ALTER TABLE  TBL_INIIST add io_ccode VARCHAR(5);

UPDATE tbl_iniist IO
SET io.io_pcoed=
(
SELECT p.p_code FROM tbl_product P
WHERE p.p_name =io.io_pcoed
);

update tbl_iniist IO
SET io_ccode=
(
SELECT c.c_cobe FROM tbl_comp C
WHERE c.c_name =io.io_dept and
 c.c_ceo =io.io_dept_ceo
);
ALTER TABLE tbl_iniist DROP COLUMN io_product;
ALTER TABLE tbl_iniist DROP COLUMN io_dept;
ALTER TABLE tbl_iniist DROP COLUMN io_dept_ceo;