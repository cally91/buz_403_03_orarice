--여기는 user5화면입니다.

DROP TABLE  tbl_iolist;
CREATE TABLE tbl_iolist(

io_sep	NUMBER	PRIMARY KEY,
io_date	VARCHAR2(10)		NOT NULL,
io_produst	NVARCHAR2(50)		NOT NULL,
io_comp	Nvarchar2(50)		NOT NULL,
io_com_ceo	Nvarchar2(50)		,
io_inout	Nvarchar2(10)		NOT NULL,
io_pty	NUMBER		,
io_price	NUMBER	,	
io_total	NUMBER	

);
SELECT COUNT(*) FROM tbl_iolist
GROUP BY io_inout;

SELECT io_produst,count(*)
from tbl_iolist 
GROUP by io_produst;

SELECT io_produst 
FROM tbl_iolist
GROUP by io_produst
ORDER BY io_produst;

CREATE TABLE tbl_product(
p_code	VARCHAR(5)	PRIMARY KEY	,
p_name	Nvarchar2(50)		NOT NULL,
p_iprice	NUMBER		,
p_opruce	NUMBER		
);

SELECT * FROM tbl_product;

SELECT io.io_produst,p.p_name
FROM tbl_iolist IO
LEFT JOIN tbl_product P
on io.io_produst =p.p_name

WHERE p.p_name IS NULL;

ALTER TABLE tbl_iolist add io_pcoed VARCHAR2(5);


DESC  tbl_iolist;

--생성된 IO_PRODE 칼럼에 값을 업데이트 한다
--상품 
UPDATE tbl_iolist
SET io_pcoed =
(
SELECT p.p_code FROM tbl_product p
WHERE io_produst=p.p_name
)
;
-- 상품코드를 업데이트 하고 제대로 잘 수행 되었는지 검증
SELECT  io.io_pcoed ,p_code ,p_name
FROM tbl_iolist io
 LEFT JOIN tbl_product P
 on io_pcoed =P_CODE
 WHERE P_CODE IS NULL OR p.p_name IS NULL;


ALTER TABLE tbl_iolist drop COLUMN io_produst;
desc tbl_iolist;

SELECT * FROM tbl_iolist;
SELECT io_comp,io_com_ceo
FROM tbl_iolist
GROUP by io_comp,io_com_ceo
ORDER by io_comp;

CREATE TABLE tbl_comp(
c_code	VARCHAR2(5)	PRIMARY KEY	,
c_name	Nvarchar2(50)		NOT NULL,
c_ceo	Nvarchar2(51)		NOT NULL,
c_tel	VARCHAR2(20)		,
c_addr	Nvarchar2(255)		

);
SELECT * FROM tbl_comp;

SELECT COUNT(*) FROM tbl_comp;

SELECT io.io_comp, c.c_name
FROM tbl_iolist IO
LEFT JOIN tbl_comp C
ON io_COMP =c.c_name
WHERE c.c_name IS NULL;

ALTER TABLE TBL_iolist ADD IO_CCODE VARCHAR2(5); 
UPDATE tbl_iolist IO
SET io.io_comp =
(
SELECT c_code FROM tbl_comp c
WHERE io.io_comp =c.c_name and
io.io_com_ceo =c.c_ceo
);

SELECT io.io_ccode,io.io_comp,c.c_name,c.c_ceo
FROM tbl_iolist IO 
LEFT JOIN tbl_comp C
ON io.io_ccode= c.c_code
WHERE c.c_name IS NULL;

ALTER TABLE TBL_IOLIST DROP COLUMN IO_COMP;
ALTER TABLE TBL_IOLIST DROP COLUMN IO_COM_CEO;

DESC tbl_iolist;

-- 매입매출테이블 상품,거래처 테이블을 조인하여 리스트
--view 를 생성하기 위해 quert를 작성할때
-- 다른 테이블의 칼럼 이름들에 규칙성 있는 alais 를 설정해 두면
-- view 활용 해서 또다른 select를 구현할때
--월씬 편리하게 사용할수있다
DROP VIEW view_ioList;
CREATE VIEW view_ioList
as
(
SELECT
        
         IO_DATE,
        IO_PCOED, P_NAME as io_pro_name,
        IO_CCODE,C_NAME as io_comp,
        C_CEO as io_comp_ceo,
        C_TEL as io_comp_tel,
        IO_INOUT, 
        IO_PTY,
        IO_PRICE,
        IO_TOTAL
        
        
FROM tbl_iolist IO
LEFT JOIN tbl_product P
ON io.io_pcoed =p.p_code
LEFT JOIN tbl_comp C
 ON io.io_ccode =c.c_code
);

SELECT
    *
FROM view_iolist;

SELECT io_pcoed, io_pro_name
FROM view_iolist;






