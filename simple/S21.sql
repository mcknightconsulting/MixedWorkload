-- S21: Store revenue by category and brand over a date range for a store
SELECT /* tdb=S21 */
  ss.ss_store_sk,
  i.i_category,
  i.i_brand,
  SUM(ss.ss_net_paid) AS revenue
FROM store_sales ss
JOIN date_dim d
  ON ss.ss_sold_date_sk = d.d_date_sk
JOIN item i
  ON ss.ss_item_sk = i.i_item_sk
WHERE ss.ss_store_sk = :1
  AND d.d_date BETWEEN :2 AND :3
  AND i.i_category = :4
  AND i.i_brand    = :5
GROUP BY ss.ss_store_sk, i.i_category, i.i_brand;
