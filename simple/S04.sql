-- S04: Daily web revenue by site
SELECT /* tdb=S04 */
  d.d_date,
  ws.ws_web_site_sk,
  SUM(ws_net_paid) AS daily_revenue
FROM web_sales ws
JOIN date_dim d
  ON ws.ws_sold_date_sk = d.d_date_sk
WHERE d.d_date          = :1
  AND ws.ws_web_site_sk = :2
GROUP BY d.d_date, ws.ws_web_site_sk;
