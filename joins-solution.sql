--Get all customers and their addresses.

SELECT * FROM "customers" JOIN "addresses" ON "customers"."id" = "addresses"."customer_id" ;

--Get all orders and their line items.

SELECT * FROM "orders" JOIN "line_items" ON "orders"."id" = "line_items"."order_id";

--Which warehouses have cheetos?

SELECT * FROM "warehouse" JOIN "warehouse_product" ON "warehouse"."id" = "warehouse_product"."warehouse_id"
JOIN "products" ON "products"."id" = "warehouse_product"."product_id" WHERE "products"."description" ILIKE 'cheetos';

--Which warehouses have diet pepsi?
SELECT "warehouse", "products"."description" FROM "warehouse" JOIN "warehouse_product"
ON "warehouse"."id" = "warehouse_product"."warehouse_id" JOIN "products" ON "products"."id" = "warehouse_product"."product_id"
WHERE "products"."description" ILIKE 'diet pepsi';

--Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.

SELECT count("orders"), "customers"."first_name" FROM "customers" JOIN "addresses" ON "customers"."id" = "addresses"."customer_id"
JOIN "orders" ON "orders"."address_id" = "addresses"."id" GROUP BY "customers"."id";

--How many customers do we have?

SELECT count(*) FROM "customers";

--How many products do we carry?


SELECT count(*) FROM "products";

--What is the total available on-hand quantity of diet pepsi?

SELECT "products"."description", SUM("on_hand") FROM "products" JOIN "warehouse_product" ON "products"."id" = "warehouse_product"."product_id"
WHERE "products"."description" ILIKE 'diet pepsi' GROUP BY "products"."description";
