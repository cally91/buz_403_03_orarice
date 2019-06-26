--여기는 유저4 화면입니다

SELECT *FROM tbl_iniist;

SELECT COUNT(*) FROM tbl_iniist;

SELECT io_inout, COUNT(*) FROM tbl_iniist
GROUP by   io_inout;

SELECT io_inout,sum(io_total) FROM tbl_iniist
GROUP BY io_inout;
-- 매입매출 리스트중에서
--2018 10 01~2018-10-31까지 데이터만 보고싶다.
--io_date 칼럼은 VARCHAR2로 설정되어 문자열 데이터를 저장하고 있다.
--일반적인 프로그래밍 언어에서는 부등호 관계산이 숫자형데이터만 허용이된다.
--하지만SQL에서는 저장되는 문자열의 길이 모두같고
--저장되는 형식이 같으면 부등호 관계연산을 수행할수있다
SELECT *
FROM tbl_iniist
WHERE io_date>= '2018-10-01' AND io_date<= '2018=10-31'
ORDER BY io_date;

SELECT io_pcode
FROM tbl_iniist
WHERE io_pcoed>= 'p000011' AND io_pcoed<='P000020'
ORDER BY io_pcoed;

SELECT io_pcode, p_name
FROM tbl_iniist IO
 LEFT JOIN tbl_product P
 WHERE io.io_pcoed >= 'p000011' AND io.io_pcoed<='p000020'
 ORDER BY io.io_pcoed;
 --매입과 매출을 구분하여 리스트를 출력 해보려고 한다
 
 SELECT io_date,io_iNout,SUM(io_total)
 FROM tbl_iniist
 GROUP by io_date, io_inout
 ORDER by io_date;
 
 SELECT io_inout,DECODE(io_inout,'매입',io_total,0) AS 매입금액,
  DECODE(io_inout,'매출',io_total,0) AS 매출금액
  FROM tbl_iniist
  ORDER BY io_date;
  
  SELECT io_inout,SUM(DECODE(io_inout,'매입',io_total,0)) AS 매입금액,
 SUM( DECODE(io_inout,'매출',io_total,0)) AS 매출금액
  FROM tbl_iniist
  GROUP BY io_pcoed,io_inout
  ORDER BY io_pcoed,io_inout;
  
  SELECT io_inout,SUM(DECODE(io_inout,'매입',io_total,0)) AS 매입금액,
 SUM( DECODE(io_inout,'매출',io_total,0)) AS 매출금액
  FROM tbl_iniist
  GROUP BY io_date,io_inout
  ORDER BY io_date,io_inout;
  
  -- 날짤 칼럼의 값을 앞에서 7개 잘라서 년,월만 남기고
  --년-월 값으로 그룹을 설정한 후
  -- 매입, 매출 집계를 셰산
  --월펼 매입 ,매출 합계리스트
  SELECT SUBSTR(io_date,0,7), io_inout,
  SUM(DECODE(io_inout,'매입',io_total,0)) AS 매입금액,
 SUM( DECODE(io_inout,'매출',io_total,0)) AS 매출금액,
 
 
 SUM( DECODE(io_inout,'매출',io_total,0)) -
 SUM(DECODE(io_inout,'매입',io_total,0)) AS 마진
  FROM tbl_iniist
  GROUP BY SUBSTR(io_date,0,7),io_pcoed,io_inout
  ORDER BY SUBSTR(io_date,0,7),io_pcoed,io_inout;
  
  
  SELECT SUBSTR(io_date,0,7), 
 SUM( DECODE(io_inout,'매출',io_total,0)) -
 SUM(DECODE(io_inout,'매입',io_total,0)) AS 마진
  FROM tbl_iniist
  GROUP BY SUBSTR(io_date,0,7)
  ORDER BY SUBSTR(io_date,0,7);
  
  --전체 기간에 매입,매출,마진을 계산하기
  
  SELECT
  SUM(DECODE(io_inout,'매입',io_total,0)) AS 매입금액,
 SUM( DECODE(io_inout,'매출',io_total,0)) AS 매출금액,
 
 SUM( DECODE(io_inout,'매출',io_total,0)) -
 SUM(DECODE(io_inout,'매입',io_total,0)) AS 마진
  FROM tbl_iniist;
  
  
    SELECT
  SUM(DECODE(io_inout,'매입',io_total,0)) AS 매입금액,
 SUM( DECODE(io_inout,'매출',io_total,0)) AS 매출금액,
 
 SUM( DECODE(io_inout,'매출',io_total,0)) -
 SUM(DECODE(io_inout,'매입',io_total,0)) AS 마진
  FROM tbl_iniist
  WHERE io_date >= '2018-03-01' and io_date <'2018=03-31';
  
  SELECT  *
  FROM tbl_iniist
WHERE io_date >= '2018-03-01' and io_date <='2018=03-31';

-- 범위를 지정하여 검색할때
-- 두 범위값이 포함될경우 <=이 있을경우>에는
-- BETWEEW 키워드를 사용해서 범위 검색을 할 수 있다.
SELECT  *
  FROM tbl_iniist
WHERE io_date BETWEEN '2018-03-01'AND '2018-03-31';

--동일한 칼럼에 포함된 값들이 있는지 검사하는 방법
-- or 연산을 사용 하지않고  in키워드를 사용해서
-- WHERE 조건 검색을 실행 할 수 있다.
SELECT io_pcode,p_name, io.io_prtce ,io.io_total
FROM tbl_iniist IO
 LEFT JOIN tbl_product P
 on io_pcode = p_code
 
 WHERE  io.io_pcoed in ('P000037','P000031','P000021','P000011');
 
 SELECT p_code,p_name
 FROM tbl_product;
 
 SELECT p_code , p_name
 FROM tbl_product 
 WHERE p_name='(신)구이쥐치포';
 
  SELECT p_code , p_name
 FROM tbl_product 
 WHERE p_name LIKE'(신)%';
 
 -- '( 신)%'신으로 시작하는 모든 문자열
 -- '%( 신)'신으로 끝나는 모든 문자열
 -- '%( 신)%'을 포함한 모든 문자열
 
 SELECT p_code, p_name
 FROM tbl_product
 WHERE p_name LIKE'%바%';