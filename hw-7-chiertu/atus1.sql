.mode columns
.header on

SELECT sex, ROUND(AVG(time)/60,2) AS 'gaming_in_hour',
 printf('%s-%2d', (age/10)*10,(((age/10)*10)+9)) as 'age_range'
FROM ( SELECT
  roster.case_id,
  edited_age AS 'age', edited_sex AS 'sex',
  SUM((activity_code == 120307) * (duration)) AS 'time'
FROM roster,activities
WHERE edited_age >19 AND edited_age < 50 AND
roster.case_id = activities.case_id AND
roster.line_no = 1
 GROUP BY roster.case_id
)GROUP BY sex, age_range;
