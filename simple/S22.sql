-- S22: Web revenue by customer state for a site in a month
SELECT /* tdb=S22 */
  ws.ws_web_site_sk,
  ca_state,
  SUM(ws.ws_net_paid) AS revenue
FROM web_sales ws
JOIN date_dim d
  ON ws.ws_sold_date_sk = d.d_date_sk
JOIN customer c
  ON ws.ws_bill_customer_sk = c.c_customer_sk
JOIN customer_address ca_state
  ON c_current_addr_sk = ca_address_sk
WHERE ws.ws_web_site_sk = :1
  AND d.d_year          = :2
  AND d.d_moy           = :3
  AND ca_state          = :4
GROUP BY ws.ws_web_site_sk, ca_state;
