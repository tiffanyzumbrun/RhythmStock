-- RhythmStock
-- Sprint 1: PostgreSQL database schema

DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS prices;
DROP TABLE IF EXISTS calendar;
DROP TABLE IF EXISTS stores;
DROP TABLE IF EXISTS products;

CREATE TABLE products (
    product_id VARCHAR(50) PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    brand VARCHAR(100),
    department_id VARCHAR(50) NOT NULL,
    category_id VARCHAR(50) NOT NULL
);

CREATE TABLE stores (
    store_id VARCHAR(50) PRIMARY KEY,
    store_name VARCHAR(150),
    city VARCHAR(100),
    state VARCHAR(50)
);

CREATE TABLE calendar (
    day_id VARCHAR(20) PRIMARY KEY,
    calendar_date DATE NOT NULL UNIQUE,
    year_week INTEGER NOT NULL,
    weekday VARCHAR(20) NOT NULL,
    weekday_number INTEGER NOT NULL,
    month_number INTEGER NOT NULL,
    year_number INTEGER NOT NULL,
    event_name_1 VARCHAR(100),
    event_type_1 VARCHAR(50),
    event_name_2 VARCHAR(100),
    event_type_2 VARCHAR(50),
    snap_ca BOOLEAN NOT NULL,
    snap_tx BOOLEAN NOT NULL,
    snap_wi BOOLEAN NOT NULL
);

CREATE TABLE prices (
    product_id VARCHAR(50) NOT NULL,
    store_id VARCHAR(50) NOT NULL,
    year_week INTEGER NOT NULL,
    sell_price NUMERIC(10, 2) NOT NULL,

    PRIMARY KEY (product_id, store_id, year_week),

    CONSTRAINT fk_prices_product
        FOREIGN KEY (product_id)
        REFERENCES products(product_id),

    CONSTRAINT fk_prices_store
        FOREIGN KEY (store_id)
        REFERENCES stores(store_id)
);

CREATE TABLE sales (
    product_id VARCHAR(50) NOT NULL,
    store_id VARCHAR(50) NOT NULL,
    day_id VARCHAR(20) NOT NULL,
    quantity_sold INTEGER NOT NULL,
    sales_amount NUMERIC(10, 2),

    PRIMARY KEY (product_id, store_id, day_id),

    CONSTRAINT fk_sales_product
        FOREIGN KEY (product_id)
        REFERENCES products(product_id),

    CONSTRAINT fk_sales_store
        FOREIGN KEY (store_id)
        REFERENCES stores(store_id),

    CONSTRAINT fk_sales_calendar
        FOREIGN KEY (day_id)
        REFERENCES calendar(day_id)
);