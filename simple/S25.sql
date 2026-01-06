-- S25: Inventory quantity on hand by warehouse for a month and item range
SELECT /* tdb=S25 */
  w.w_warehouse_name,
  SUM(inv.inv_quantity_on_hand) AS qty_on_hand
FROM inventory inv
JOIN date_dim d
  ON inv.inv_date_sk = d.d_date_sk
JOIN warehouse w
  ON inv.inv_warehouse_sk = w.w_warehouse_sk
WHERE d.d_year = :1
  AND d.d_moy  = :2
  AND w.w_warehouse_name = :3
  AND inv.inv_item_sk BETWEEN :4 AND :5
GROUP BY w.w_warehouse_name;
