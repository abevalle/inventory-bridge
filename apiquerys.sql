-- Returns all items with category coffee
-- api/v1/getItems?cat=coffee
SELECT c.barcode, c.item_name, c.time_created, c.item_picture, c.quantity, ca.name, u.uname FROM catalog as c 
INNER JOIN catagory as ca ON c.catagory = ca.id
INNER JOIN users as u on c.created_by = u.id
WHERE ca.name = 'coffee'

-- Return item with category of coffee and quantity above 0
-- api/v1/getItems?cat=coffee?stockGreaterThan=0
SELECT c.barcode, c.item_name, c.time_created, c.item_picture, c.quantity, ca.name, ca.id, u.uname  FROM catalog as c 
INNER JOIN catagory as ca ON c.catagory = ca.id
INNER JOIN users as u on c.created_by = u.id
WHERE ca.id = 'coffee' AND ca.quantity > 0;

-- Return item with category of coffee and quantity below 10
-- api/v1/getItems?cat=coffee?stockGreaterThan=0
SELECT c.barcode, c.item_name, c.time_created, c.item_picture, c.quantity, ca.name, ca.id, u.uname  FROM catalog as c 
INNER JOIN catagory as ca ON c.catagory = ca.id
INNER JOIN users as u on c.created_by = u.id
WHERE ca.id = 'coffee' AND ca.quantity < 10;

-- Update quantity
-- api/v1/updateQty?barcode=6f5s4df6
UPDATE catalog 
SET quantity = (SELECT count(barcode) AS quantiy FROM stock WHERE barcode = '6f5s4df6'),
    last_updated = NOW()
WHERE id = 6;


-- Add category
-- api/v1/addCat?name=coffee
INSERT INTO category (name) VALUES ('coffee');

-- Edit category
-- api/v1/editCat?id=3?name=decaf coffee
UPDATE category SET name = 'decaf coffee' WHERE id = 3;

-- Archive category
-- api/v1/archiveCat?id=3
UPDATE category SET archived = 1 WHERE id = 3;

-- Add item to stock
-- api/v1/addStockItem?barcode=6f5s4df6?scannedBy=3
INSERT INTO stock (barcode, time_scanned, scanned_by) VALUES ('6f5s4df6', NOW(), 3);

-- Remove item from stock
-- api/v1/removeStockItem?catalogId=3?itemRemoved=6f5s4df6?removedBy=3
INSERT INTO items_out (catalog_id, item_removed, time_removed, removed_by) VALUES (3, '6f5s4df6', 3);

