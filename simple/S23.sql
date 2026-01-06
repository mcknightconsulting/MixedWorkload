-- S23: Catalog revenue by promo and category in a date range
SELECT /* tdb=S23 */
  cs.cs_promo_sk,
  i.i_category,
  SUM(cs.cs_net_paid) AS revenue
FROM catalog_sales cs
JOIN date_dim d
  ON cs.cs_sold_date_sk = d.d_date_sk
JOIN item i
  ON cs.cs_item_sk = i.i_item_sk
WHERE cs.cs_promo_sk = :1
  AND d.d_date BETWEEN :2 AND :3
  AND i.i_category = :4
  AND cs.cs_quantity >= :5
GROUP BY cs.cs_promo_sk, i.i_category;
