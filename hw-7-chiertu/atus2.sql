.mode columns
.header on

SELECT
  AVG(worked_last_week = 1) as 'employment_lswk',
  (spouse_or_partner_present == 1 or spouse_or_partner_present == 2)  as 'cohabiting'
FROM respondents
WHERE spouse_or_partner_present > 0 AND (worked_last_week == 1 or worked_last_week == 2)
GROUP BY cohabiting;
