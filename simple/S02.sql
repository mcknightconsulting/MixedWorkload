-- S02: Weekly store revenue
SELECT /* tdb=S02 */
  d.d_year,
  d.d_week_seq,
  ss.ss_store_sk,
  SUM(ss_net_paid) AS weekly_revenue
FROM store_sales ss
JOIN date_dim d
  ON ss.ss_sold_date_sk = d.d_date_sk
WHERE d.d_year      = :1
  AND d.d_week_seq  = :2
  AND ss.ss_store_sk = :3
GROUP BY d.d_year, d.d_week_seq, ss.ss_store_sk;
