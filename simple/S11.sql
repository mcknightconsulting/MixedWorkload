-- S11: Store revenue by weekday (0–6)
SELECT /* tdb=S11 */
  d.d_dow,
  SUM(ss_net_paid) AS dow_revenue
FROM store_sales ss
JOIN date_dim d
  ON ss.ss_sold_date_sk = d.d_date_sk
WHERE d.d_year = :1
  AND d.d_moy  = :2
GROUP BY d.d_dow
ORDER BY d.d_dow;
