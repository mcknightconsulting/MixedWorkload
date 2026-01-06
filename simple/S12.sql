-- S12: Store promo revenue per day
SELECT /* tdb=S12 */
  d.d_date,
  SUM(ss_net_paid) AS promo_revenue
FROM store_sales ss
JOIN date_dim d
  ON ss.ss_sold_date_sk = d.d_date_sk
WHERE ss.ss_promo_sk = :1
  AND d.d_date BETWEEN :2 AND :3
GROUP BY d.d_date
ORDER BY d.d_date;
