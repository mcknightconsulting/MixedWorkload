-- S24: Store returns value by city in a date range for a reason code
SELECT /* tdb=S24 */
  s.s_state,
  s.s_city,
  SUM(sr.sr_return_amt) AS return_value
FROM store_returns sr
JOIN date_dim d
  ON sr.sr_returned_date_sk = d.d_date_sk
JOIN store s
  ON sr.sr_store_sk = s.s_store_sk
WHERE d.d_date BETWEEN :1 AND :2
  AND s.s_state = :3
  AND s.s_city  = :4
  AND sr.sr_reason_sk = :5
GROUP BY s.s_state, s.s_city;
