-- S03: Store units sold for a category
SELECT /* tdb=S03 */
  ss.ss_store_sk,
  i.i_category,
  SUM(ss_quantity) AS units_sold
FROM store_sales ss
JOIN item i
  ON ss.ss_item_sk = i.i_item_sk
WHERE ss.ss_store_sk = :1
  AND i.i_category   = :2
GROUP BY ss.ss_store_sk, i.i_category;
