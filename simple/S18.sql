-- S18: Web orders above a minimum order total on a date
SELECT /* tdb=S18 */
  d.d_date,
  COUNT(*)        AS order_cnt,
  SUM(ws_net_paid) AS total_revenue
FROM web_sales ws
JOIN date_dim d
  ON ws.ws_sold_date_sk = d.d_date_sk
WHERE d.d_date        = :1
  AND ws.ws_net_paid >= :2
GROUP BY d.d_date;
