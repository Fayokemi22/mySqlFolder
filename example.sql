use cape_codd;

SELECT SKU, SKU_Description
FROM INVENTORY;

SELECT SKU_Description, SKU 
FROM INVENTORY;

SELECT WarehouseID
FROM INVENTORY;

SELECT DISTINCT WarehouseID
FROM INVENTORY;

SELECT WarehouseID, SKU, SKU_Description, QuantityOnHAnd, QuantityOnOrder
FROM INVENTORY;

SELECT *
FROM INVENTORY;

SELECT *
FROM INVENTORY 
WHERE QuantityOnHand >0;

SELECT SKU, SKU_Description
FROM INVENTORY
WHERE QuantityOnHand =0;

SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY 
WHERE QuantityOnHand =0
ORDER BY WarehouseID ASC;

SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY 
WHERE QuantityOnHand =0 
ORDER BY WarehouseID DESC, SKU ASC;

SELECT SKU, SKU_Description, WarehouseID 
FROM INVENTORY
WHERE QuantityOnHand =0 AND QuantityOnOrder >0
ORDER BY WarehouseID DESC , SKU ASC;

SELECT SKU, SKU_Description, WarehouseID 
FROM INVENTORY
WHERE QuantityOnHand =0 OR QuantityOnOrder =0
ORDER BY WarehouseID DESC , SKU ASC;


SELECT SKU, SKU_Description, WarehouseID, QuantityOnHand 
FROM INVENTORY
WHERE QuantityOnHand >1 AND QuantityOnHand <10;

SELECT SKU, SKU_Description, WarehouseID, QuantityOnHand 
FROM INVENTORY
WHERE QuantityOnHand BETWEEN 1 AND 10;

SELECT DISTINCT SKU, SKU_Description
FROM INVENTORY
WHERE SKU_Description LIKE 'HALF-DOME%';

SELECT DISTINCT SKU, SKU_Description
FROM INVENTORY
WHERE SKU_Description LIKE '%Climb%';

SELECT DISTINCT SKU, SKU_Description
FROM INVENTORY 
WHERE SKU_Description LIKE'__d%';

SELECT MIN(QuantityOnHand) as minimum_quantity, MAX(QuantityOnHand) as maximum_quantity, 
ROUND(AVG(QuantityOnHand),2) as average_quantity, SUM(QuantityOnHand) as sum_quantity
FROM INVENTORY;

SELECT WarehouseID, SUM(QuantityOnHand) as TotalItemsOnHand
FROM INVENTORY
GROUP BY WarehouseID
ORDER BY TotalItemsOnHand DESC;

SELECT WarehouseID, SUM(QuantityOnHand) as TotalItemsOnHandLT3
FROM INVENTORY
WHERE QuantityOnHand  < 3
GROUP BY WarehouseID 
ORDER BY TotalItemsOnHandLT3 DESC;

SELECT WarehouseID, SUM(QuantityOnHand) as TotalItemsOnHandLT3
FROM INVENTORY
WHERE QuantityOnHand  > 3
GROUP BY WarehouseID 
HAVING SUM(QuantityOnHand)>2
ORDER BY TotalItemsOnHandLT3 DESC;

 

SELECT COUNT(*) AS NumberOfRows,
COUNT(QuantityOnHand )
FROM INVENTORY;


-- 2.40

SELECT SKU, SKU_Description, WarehouseID, WarehouseCity, WarehouseState
FROM INVENTORY
JOIN WareHouse 
onWAREHOUSE

