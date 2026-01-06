-- S14: Customer count by marital status and education
SELECT /* tdb=S14 */
  cd_marital_status,
  cd_education_status,
  COUNT(*) AS customer_cnt
FROM customer_demographics
WHERE cd_marital_status   = :1
  AND cd_education_status = :2
GROUP BY cd_marital_status, cd_education_status;
