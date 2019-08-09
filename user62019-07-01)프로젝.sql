--여기는 유저 6화면입니다
CREATE TABLE tbl_product (
p_code	VARCHAR2(5)	PRIMARY KEY	,
p_name	Nvarchar2(50)		NOT NULL,
p_iprice	NUMBER		,
p_opruce	NUMBER		

);
SELECT
    *
FROM tbl_product;