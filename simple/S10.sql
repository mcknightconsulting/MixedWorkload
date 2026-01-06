-- S10: Store revenue by city
SELECT /* tdb=S10 */
  s.s_city,
  s.s_state,
  SUM(ss_net_paid) AS city_revenue
FROM store_sales ss
JOIN store s
  ON ss.ss_store_sk = s.s_store_sk
WHERE s.s_state = :1
  AND s.s_city  = :2
GROUP BY s.s_city, s.s_state;
