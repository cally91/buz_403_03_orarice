--USER3입니다

SELECT sc.sc_num,st.st_name,sc.sc_subject,sc.sc_score
FROM tbl_score SC
LEFT JOIN tbl_student ST
ON sc.sc_num =st.st_num;

SELECT sc.sc_num,st.st_name,round(avg(sc.sc_score))
FROM tbl_score SC
LEFT JOIN tbl_student ST
ON sc.sc_num =st.st_num
GROUP BY SC.sc_num,st.st_name
ORDER BY SC.SC_NUM;

-- ROUND :반올림,TREAT: 버림
SELECT sc.sc_num,st.st_name,TREAT(avg(sc.sc_score)),ROUND(avg(sc.sc_score))
FROM tbl_score SC
LEFT JOIN tbl_student ST
ON sc.sc_num =st.st_num
GROUP BY SC.sc_num,st.st_name
ORDER BY SC.SC_NUM;

SELECT sc.sc_num,st.st_name,SUM(SC.sc_score) AS 총점,TRUNC(AVG(sc.sc_score))AS 평균1,ROUND(AVG(sc.sc_score))AS 평균2
FROM tbl_score SC
LEFT JOIN tbl_student ST
ON sc.sc_num =st.st_num
GROUP BY SC.sc_num,st.st_name
HAVING(ROUND(avg(sc.sc_score)))>=80
ORDER BY SC.SC_NUM;
