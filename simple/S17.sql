-- S17: Inventory on hand for a specific item in one warehouse
SELECT /* tdb=S17 */
  w.w_warehouse_name,
  SUM(inv_quantity_on_hand) AS qty_on_hand
FROM inventory inv
JOIN warehouse w
  ON inv.inv_warehouse_sk = w.w_warehouse_sk
WHERE w.w_warehouse_name = :1
  AND inv.inv_item_sk    = :2
GROUP BY w.w_warehouse_name;
