-- S19: Web sales for an item in a specific month
SELECT /* tdb=S19 */
  d.d_year,
  d.d_moy,
  ws.ws_item_sk,
  SUM(ws_quantity)  AS qty_sold,
  SUM(ws_net_paid)  AS revenue
FROM web_sales ws
JOIN date_dim d
  ON ws.ws_sold_date_sk = d.d_date_sk
WHERE d.d_year      = :1
  AND d.d_moy       = :2
  AND ws.ws_item_sk = :3
GROUP BY d.d_year, d.d_moy, ws.ws_item_sk;
