-- S20: Monthly store revenue
SELECT /* tdb=S20 */
  d.d_year,
  d.d_moy,
  ss.ss_store_sk,
  SUM(ss_net_paid) AS monthly_revenue
FROM store_sales ss
JOIN date_dim d
  ON ss.ss_sold_date_sk = d.d_date_sk
WHERE ss.ss_store_sk = :1
  AND d.d_year      = :2
GROUP BY d.d_year, d.d_moy, ss.ss_store_sk
ORDER BY d.d_moy;
