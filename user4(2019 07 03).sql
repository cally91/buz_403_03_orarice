--USER4화면입니다.
SELECT *FROM tbl_student;

SELECT
ST_NO,
ST_NAME,
ST_ADD,
ST_GTADE,
ST_HEIGNT,
ST_WEIGHT,
ST_NICK,
ST_NICK_NEM
from tbl_student;

SELECT st_no,
st_name,
st_add,
st_gtade
FROM tbl_student;

UPDATE tbl_student
set st_add ='광주광역시'
WHERE st_no= '001';

DESC tbl_iniist;
DESC tbl_product;
SELECT
    *
FROM tbl_iniist ,tbl_product
WHERE tbl_iniist.io_pcoed =tbl_product.p_code;

SELECT io.io_sep,io.io_date,io.io_pcoed,p.p_name,io.io_prtce,io.io_ant
FROM tbl_iniist IO
LEFT JOIN tbl_product P
ON io.io_pcoed= p.p_code
WHERE io.io_inout ='매입'
ORDER BY IO_DATE;

CREATE VIEW VIEW_IOLIST
AS
(
SELECT io.io_sep,io.io_date,io.io_pcoed,p.p_name,io.io_prtce,io.io_ant,(io.io_prtce*io.io_ant) AS 매입금액
FROM tbl_iniist IO
LEFT JOIN tbl_product P
ON io.io_pcoed= p.p_code
WHERE io.io_inout ='매입'
);
ORDER BY IO_DATE;

SELECT SUM( DECODE(io_inout,'매입',io_total,0))AS 매입금액,
 SUM(DECODE(io_inout,'매출',io_total,0))AS 매출 금액,
 SUM(DECODE(io_inout,'매입',io_total,0) -
 DECODE(io_inout,'매출',io_total,0)) AS 마진
 FROM tbl_iniist;
