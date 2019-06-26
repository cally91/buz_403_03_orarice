--user5화면입니다.



SELECT sc.sc_st_no AS 학번,
st.st_name AS 학생이름,

sum (DECODE(sc_subjet,'국어 ',sc_score,0)) AS 국어, 
sum (DECODE(sc_subjet,'영어 ',Sc_SCOER,0)) AS 영어,
sum (DECODE(sc_subjet,'수학 ',Sc_SCOER,0)) AS 수학,

SUM (DECODE(sc_subjet,'국어 ',Sc_SCOER,0) +
    DECODE(sc_subjet,'영어 ',Sc_SCOER,0)   +
    DECODE(sc_subjet,'수학',Sc_SCOER,0)) AS 총점,
    
    round (avg (DECODE(sc_subjet,'국어 ',Sc_SCOER,0)+
                DECODE(sc_subjet,'영어 ',Sc_SCOER,0)+
                DECODE(sc_subjet,'수학 ',sc_score,0)),1) as 평균
                
                FROM tbl_score sc
                LEFT JOIN tbl_stuent st
                GROUP by sc.sc_no, sc.sc_st_no, st.st_no, st.st_name
                ORDER by sc.sc_no;