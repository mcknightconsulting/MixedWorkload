-- S13: Customer count in a state
SELECT /* tdb=S13 */
  ca_state AS state,
  COUNT(*) AS customer_cnt
FROM customer, customer_address
WHERE ca_state = :1
  AND c_current_addr_sk = ca_address_sk
GROUP BY ca_state;
