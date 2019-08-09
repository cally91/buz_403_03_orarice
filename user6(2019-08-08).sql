--user6 
drop TABLE tbl_ems;

CREATE TABLE tbl_ems(
ems_seq	NUMBER	PRIMARY KEY	,
ems_to_email	VARCHAR2(50)		NOT NULL,
ems_from_email	VARCHAR2(50)		NOT NULL,
ems_to_name	nVARCHAR2(50)		NOT NULL,
ems_from_name	nVARCHAR2(50)		,
ems_send_date	VARCHAR2(10)		NOT NULL,
ems_send_time	VARCHAR2(20)		NOT NULL,
ems_subject	nVARCHAR2(125)		NOT NULL,
ems_content	nVARCHAR2(1000)		NOT NULL,
ems_file1	VARCHAR2(64)		,
ems_file2	VARCHAR2(64)		
);


CREATE SEQUENCE seq_ems
START WITH 1
INCREMENT by 1;