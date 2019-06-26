-- user4화면입니다.


SELECT SUBSTR(io_date,0,7),
  SUM(DECODE(IO_INOUT,'매입',io_total,0)) as 매입합계,
  SUM(DECODE(IO_INOUT,'매출',io_total,0)) as 매입합계,
  
  SUM(DECODE(IO_INOUT,'매입',io_total,0)) -
  SUM(DECODE(IO_INOUT,'매출',io_total,0)) as 마진
  
  FROM tbl_iniist
  GROUP by substr(io_date,0,7);
  
  
  SELECT
  SUM(DECODE(IO_INOUT,'매입',io_total,0)) as 매입합계,
  SUM(DECODE(IO_INOUT,'매출',io_total,0)) as 매입합계,
  
  SUM(DECODE(IO_INOUT,'매입',io_total,0)) -
  SUM(DECODE(IO_INOUT,'매출',io_total,0)) as 마진
  FROM tbl_iniist;
  
  union
  select '=====',00000,00000,00000 from dual
  
  union
  SELECT
  '총계',
   SUM(DECODE(IO_INOUT,'매입',io_total,0)) as 매입합계,
  SUM(DECODE(IO_INOUT,'매출',io_total,0)) as 매입합계,
  
  SUM(DECODE(IO_INOUT,'매입',io_total,0)) -
  SUM(DECODE(IO_INOUT,'매출',io_total,0)) as 마진
 
 FROM tbl_iniist;