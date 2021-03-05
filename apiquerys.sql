-- api/v1/getItems?catalog=coffee
SELECT c.barcode, c.item_name, c.time_created, c.item_picture, c.quantity, ca.name, u.uname FROM catalog as c
INNER JOIN catagory as ca ON c.catagory = ca.id
INNER JOIN users as u on c.created_by = u.id