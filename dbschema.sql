CREATE DATABASE inventory;

CREATE TABLE catagory (
    id SERIAL UNIQUE PRIMARY KEY,
    name varchar
);

CREATE TABLE catalog (
    id SERIAL UNIQUE PRIMARY KEY,
    barcode varchar UNIQUE,
    item_name varchar,
    time_created timestamp,
    created_by integer,
    item_picture varchar,
    quantity int,
    catagory integer
);

CREATE TABLE stock (
    id SERIAL UNIQUE PRIMARY KEY,
    barcode varchar,
    time_scanned timestamp,
    scanned_by integer
);

CREATE TABLE items_out (
    id SERIAL UNIQUE PRIMARY KEY,
    catalog_id integer,
    item_removed integer,
    time_removed timestamp,
    removed_by integer
);

CREATE TABLE users (
    id SERIAL UNIQUE PRIMARY KEY,
    email varchar UNIQUE,
    uname varchar UNIQUE,
    password varchar
);

-- CONSTRAINTS

ALTER TABLE "catalog" ADD FOREIGN KEY ("created_by") REFERENCES "users" ("id");

ALTER TABLE "catalog" ADD FOREIGN KEY ("catagory") REFERENCES "catagory" ("id");

-- This should remain disabled unless I find a reason to add a fk
-- ALTER TABLE "stock" ADD FOREIGN KEY ("catalog_id") REFERENCES "catalog" ("id");

ALTER TABLE "stock" ADD FOREIGN KEY ("scanned_by") REFERENCES "users" ("id");

ALTER TABLE "items_out" ADD FOREIGN KEY ("catalog_id") REFERENCES "catalog" ("id");

ALTER TABLE "items_out" ADD FOREIGN KEY ("removed_by") REFERENCES "users" ("id");