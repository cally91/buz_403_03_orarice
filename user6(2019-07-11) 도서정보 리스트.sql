
CREATE TABLE tbl_books(
b_seq  NUMBER PRIMARY KEY,
b_title NVARCHAR2(100),
b_comp NVARCHAR2(50),
b_auth NVARCHAR2(50),
b_price NUMBER

);

DROP TABLE tbl_books;

CREATE SEQUENCE seq_book
START WITH 1
INCREMENT BY 1;


SELECT
    *
FROM tbl_books;

DELETE FROM tbl_books;

INSERT INTO tbl_books(b_seq,b_title,b_comp,b_auth,b_price)
VALUES(seq_book.Nextval,'모바일','오라클','홍형경',15000);

INSERT INTO tbl_books(b_seq,b_title,b_comp,b_auth,b_price)
VALUES(seq_book.Nextval,'안드로이드','오라클','채식',15000); 


commit;