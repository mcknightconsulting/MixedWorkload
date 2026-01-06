-- S08: Store returns quantity per day
SELECT /* tdb=S08 */
  d.d_date,
  sr.sr_store_sk,
  SUM(sr_return_quantity) AS returned_qty
FROM store_returns sr
JOIN date_dim d
  ON sr.sr_returned_date_sk = d.d_date_sk
WHERE d.d_date BETWEEN :1 AND :2
  AND sr.sr_store_sk = :3
GROUP BY d.d_date, sr.sr_store_sk
ORDER BY d.d_date;
