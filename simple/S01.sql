-- S01: Daily store revenue
SELECT /* tdb=S01 */
  d.d_date,
  ss.ss_store_sk,
  SUM(ss_net_paid) AS daily_revenue
FROM store_sales ss
JOIN date_dim d
  ON ss.ss_sold_date_sk = d.d_date_sk
WHERE d.d_date      = :1
  AND ss.ss_store_sk = :2
GROUP BY d.d_date, ss.ss_store_sk;
