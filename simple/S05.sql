-- S05: Monthly web order count by ship mode
SELECT /* tdb=S05 */
  d.d_year,
  d.d_moy,
  ws.ws_ship_mode_sk,
  COUNT(*) AS order_cnt
FROM web_sales ws
JOIN date_dim d
  ON ws.ws_sold_date_sk = d.d_date_sk
WHERE d.d_year          = :1
  AND d.d_moy           = :2
  AND ws.ws_ship_mode_sk = :3
GROUP BY d.d_year, d.d_moy, ws.ws_ship_mode_sk;
