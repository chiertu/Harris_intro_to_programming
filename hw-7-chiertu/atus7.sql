.mode columns
.header on

SELECT sex, education_level, AVG(time)/60 AS 'housework_time'
FROM (
SELECT
  AVG(edited_sex) AS 'sex',
  AVG(educational_attainment) AS 'education_level',
  SUM((activity_code/10000 == 2) * (duration)) AS 'time'
FROM roster
INNER JOIN cps ON
 roster.case_id = cps.case_id AND
 roster.line_no = 1 AND
 cps.line_no = 1
INNER JOIN activities ON
 roster.case_id = activities.case_id AND
 roster.line_no = 1
GROUP BY roster.case_id
)
GROUP BY education_level,sex;
