.mode columns
.header on

SELECT
  sex,
  ROUND(AVG(child_engagement)/60,6) AS 'child_engagement_in_hour'
FROM (
SELECT
  AVG(number_of_hh_children) AS 'num_of_kid',
  AVG(edited_sex) AS 'sex',
  SUM((activity_code/100 = 301 or activity_code = 180381) * (duration)) AS 'child_engagement'
FROM respondents
INNER JOIN activities ON
respondents.case_id = activities.case_id
INNER JOIN roster ON
respondents.case_id = roster.case_id AND
roster.line_no = 1
WHERE
respondents.number_of_hh_children > 0 AND
respondents.edited_labor_force_status in (1,2)
GROUP BY respondents.case_id
)
GROUP BY sex;
