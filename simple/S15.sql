-- S15: Average household dependents & vehicles by income band
SELECT /* tdb=S15 */
  hd_income_band_sk,
  AVG(hd_dep_count)     AS avg_dependents,
  AVG(hd_vehicle_count) AS avg_vehicles
FROM household_demographics
WHERE hd_income_band_sk = :1
GROUP BY hd_income_band_sk;
