.mode columns
.header on

SELECT
  AVG(cohabbiting == 1) AS 'married',
  (religious_time > 0) AS 'religious'
FROM(
SELECT
  AVG(spouse_or_partner_present) AS 'cohabbiting',
  SUM((activity_code/100 == 1401) * (duration)) AS 'religious_time'
FROM activities, respondents
WHERE
respondents.case_id = activities.case_id AND
respondents.dow_of_diary_day in (1, 6, 7) AND
respondents.number_of_hh_children > 0 AND
respondents.spouse_or_partner_present >0
GROUP BY activities.case_id
)
GROUP BY religious;
