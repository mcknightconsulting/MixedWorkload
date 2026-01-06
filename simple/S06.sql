-- S06: Monthly catalog revenue for a promotion
SELECT /* tdb=S06 */
  d.d_year,
  d.d_moy,
  cs.cs_promo_sk,
  SUM(cs_net_paid) AS monthly_revenue
FROM catalog_sales cs
JOIN date_dim d
  ON cs.cs_sold_date_sk = d.d_date_sk
WHERE d.d_year     = :1
  AND d.d_moy      = :2
  AND cs.cs_promo_sk = :3
GROUP BY d.d_year, d.d_moy, cs.cs_promo_sk;
