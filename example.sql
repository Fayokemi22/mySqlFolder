use cape_codd;
-- 2.17
SELECT SKU, SKU_Description
FROM INVENTORY;
-- 2.18
SELECT SKU_Description, SKU 
FROM INVENTORY;
-- 2.19
SELECT WarehouseID
FROM INVENTORY;
-- 2.20
SELECT DISTINCT WarehouseID
FROM INVENTORY;
-- 2.21
SELECT WarehouseID, SKU, SKU_Description, QuantityOnHAnd, QuantityOnOrder
FROM INVENTORY;
-- 2.22
SELECT *
FROM INVENTORY;
-- 2.23
SELECT *
FROM INVENTORY 
WHERE QuantityOnHand >0;
-- 2.24
SELECT SKU, SKU_Description
FROM INVENTORY
WHERE QuantityOnHand =0;
-- 2.25
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY 
WHERE QuantityOnHand =0
ORDER BY WarehouseID ASC;
-- 2.26
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY 
WHERE QuantityOnHand =0 
ORDER BY WarehouseID DESC, SKU ASC;
-- 2.27
SELECT SKU, SKU_Description, WarehouseID 
FROM INVENTORY
WHERE QuantityOnHand =0 AND QuantityOnOrder >0
ORDER BY WarehouseID DESC , SKU ASC;
-- 2.28
SELECT SKU, SKU_Description, WarehouseID 
FROM INVENTORY
WHERE QuantityOnHand =0 OR QuantityOnOrder =0
ORDER BY WarehouseID DESC , SKU ASC;

-- 2.29
SELECT SKU, SKU_Description, WarehouseID, QuantityOnHand 
FROM INVENTORY
WHERE QuantityOnHand >1 AND QuantityOnHand <10;
-- 2.30
SELECT SKU, SKU_Description, WarehouseID, QuantityOnHand 
FROM INVENTORY
WHERE QuantityOnHand BETWEEN 1 AND 10;
-- 2.31
SELECT DISTINCT SKU, SKU_Description
FROM INVENTORY
WHERE SKU_Description LIKE 'HALF-DOME%';
-- 2.32
SELECT DISTINCT SKU, SKU_Description
FROM INVENTORY
WHERE SKU_Description LIKE '%Climb%';

-- 2.33

SELECT DISTINCT SKU, SKU_Description
FROM INVENTORY 
WHERE SKU_Description LIKE'__d%';
-- 2.34
SELECT MIN(QuantityOnHand) as minimum_quantity, MAX(QuantityOnHand) as maximum_quantity, 
ROUND(AVG(QuantityOnHand),2) as average_quantity, SUM(QuantityOnHand) as sum_quantity
FROM INVENTORY;

-- 2.35
-- COUNT_ COunt the number of rows in the table/count the number of rows in the table where column name is not null
-- SUM: Calculate the number of all value (numeric columns only)

-- 2.36
SELECT WarehouseID, SUM(QuantityOnHand) as TotalItemsOnHand
FROM INVENTORY
GROUP BY WarehouseID
ORDER BY TotalItemsOnHand DESC;

-- 2.37
SELECT WarehouseID, SUM(QuantityOnHand) as TotalItemsOnHandLT3
FROM INVENTORY
WHERE QuantityOnHand  < 3
GROUP BY WarehouseID 
ORDER BY TotalItemsOnHandLT3 DESC;
-- 2.38
SELECT WarehouseID, SUM(QuantityOnHand) as TotalItemsOnHandLT3
FROM INVENTORY
WHERE QuantityOnHand  > 3
GROUP BY WarehouseID 
HAVING SUM(QuantityOnHand)>2
ORDER BY TotalItemsOnHandLT3 DESC;

--  2.39



-- 2.40

SELECT SKU, SKU_Description, INVENTORY.WarehouseID,
       WarehouseCity, WarehouseState
FROM INVENTORY, WAREHOUSE
WHERE INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
AND (WarehouseCity = 'Atlanta'
OR WarehouseCity = 'Bangor'
OR WarehouseCity = 'Chicago');

-- 2.41

SELECT SKU, SKU_Description, INVENTORY.WarehouseID,
       WarehouseCity, WarehouseState
FROM INVENTORY, WAREHOUSE
WHERE INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
AND WarehouseCity IN ('Atlanta', 'Bangor', 'Chicago');

-- 2.42
SELECT SKU, SKU_Description, INVENTORY.WarehouseID,
       WarehouseCity, WarehouseState
FROM INVENTORY, WAREHOUSE
WHERE INVENTORY.WarehouseID != WAREHOUSE.WarehouseID
AND NOT (WarehouseCity = 'Atlanta'
OR WarehouseCity = 'Bangor'
OR WarehouseCity = 'Chicago');

-- 2.43

SELECT SKU, SKU_Description, INVENTORY.WarehouseID,
       WarehouseCity, WarehouseState
FROM INVENTORY, WAREHOUSE
WHERE INVENTORY.WarehouseID != WAREHOUSE.WarehouseID
AND WarehouseCity NOT IN ('Atlanta', 'Bangor', 'Chicago');

-- 2.44

SELECT CONCAT(SKU_Description, 'is Located In' , WarehouseCity) AS ItemLocation
FROM INVENTORY,WAREHOUSE
WHERE INVENTORY.WarehouseId = WAREHOUSE.WarehouseId;

-- 2.45
SELECT SKU, SKU_Description,INVENTORY.WarehouseID
FROM INVENTORY
WHERE WarehouseID IN(
    SELECT WarehouseID
    FROM WAREHOUSE
    WHERE Manager = 'Lucille Smith'
)

-- 2.46




