-- S16: Average item price by category and brand
SELECT /* tdb=S16 */
  i_category,
  i_brand,
  AVG(i_current_price) AS avg_price
FROM item
WHERE i_category = :1
  AND i_brand    = :2
GROUP BY i_category, i_brand;
