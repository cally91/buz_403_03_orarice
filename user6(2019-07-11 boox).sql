--USER6의 창입니다

--도서정보를 지정할 tadie을 생성
CREATE TABLE tbl_books(

b_sep NUMBER PRIMARY KEY,
b_title NVARCHAR2(100),
b_comp NVARCHAR2(50),
b_auth NVARCHAR2(50),
b_price NUMBER
);

CREATE SEQUENCE seq_dook
START WITH 1
INCREMENT BY 1;