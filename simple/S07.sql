-- S07: Catalog revenue by category for a promotion
SELECT /* tdb=S07 */
  i.i_category,
  SUM(cs_net_paid) AS category_revenue
FROM catalog_sales cs
JOIN item i
  ON cs.cs_item_sk = i.i_item_sk
WHERE i.i_category = :1
  AND cs.cs_promo_sk = :2
GROUP BY i.i_category;
