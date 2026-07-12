DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    customer_name TEXT NOT NULL,
    email TEXT NOT NULL,
    registration_date DATE,
    customer_type TEXT
);

DROP TABLE IF EXISTS products;

CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT NOT NULL,
    category TEXT NOT NULL,
    subcategory TEXT,
    cost_price REAL NOT NULL
);

DROP TABLE IF EXISTS orders;

CREATE TABLE orders (

    order_id INTEGER PRIMARY KEY,

    customer_id INTEGER,

    order_date TEXT,

    status TEXT,

    region_code TEXT,

    FOREIGN KEY(customer_id)
    REFERENCES customers(customer_id)
);

DROP TABLE IF EXISTS order_items;

CREATE TABLE order_items (

    item_id INTEGER PRIMARY KEY,

    order_id INTEGER,

    product_id INTEGER,

    quantity INTEGER,

    unit_price REAL,

    discount_percent REAL,

    FOREIGN KEY(order_id)
    REFERENCES orders(order_id),

    FOREIGN KEY(product_id)
    REFERENCES products(product_id)

);