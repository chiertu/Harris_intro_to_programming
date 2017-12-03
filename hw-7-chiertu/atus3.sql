.mode columns
.header on


SELECT state_code,
  AVG(educational_attainment > 38) as 'highschool_grad'
FROM cps
WHERE state_code > 0 AND educational_attainment > 0
GROUP BY state_code
ORDER BY highschool_grad
LIMIT 10;
