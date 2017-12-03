.mode columns
.header on

SELECT
  cps.educational_attainment,
  AVG(spouse_or_partner_present == 1 or spouse_or_partner_present == 2) as 'cohabiting'
FROM cps, respondents
WHERE
cps.case_id = respondents.case_id AND
cps.line_no = 1 AND
cps.educational_attainment > 0 AND
respondents.spouse_or_partner_present > 0
GROUP BY cps.educational_attainment;
