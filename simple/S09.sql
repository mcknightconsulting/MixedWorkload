-- S09: Web returns count per day
SELECT /* tdb=S09 */
  d.d_date,
  COUNT(*) AS return_cnt
FROM web_returns wr
JOIN date_dim d
  ON wr.wr_returned_date_sk = d.d_date_sk
WHERE d.d_year = :1
  AND d.d_moy  = :2
GROUP BY d.d_date
ORDER BY d.d_date;
