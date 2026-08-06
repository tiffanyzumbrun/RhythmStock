-- RhythmStock
-- Sprint 3 : Business Tables
-- Schema aligned with M5 dataset

-- Drop tables in dependency order.
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS prices;
DROP TABLE IF EXISTS calendar;
DROP TABLE IF EXISTS stores;
DROP TABLE IF EXISTS products;


--Products
--One row per unique M5 item
CREATE TABLE products (
    item_id VARCHAR(50) PRIMARY KEY,
    dept_id VARCHAR(50) NOT NULL,
    cat_id VARCHAR(50) NOT NULL
);

--Stores
--One row per unique M5 store
CREATE TABLE stores (
    store_id VARCHAR(50) PRIMARY KEY,
    state_id VARCHAR(50) NOT NULL
);

--Calendar
--One row per unique M5 day identifier
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

--Prices
--One price per item, store and week
CREATE TABLE prices (
    item_id VARCHAR(50) NOT NULL,
    store_id VARCHAR(50) NOT NULL,
    year_week INTEGER NOT NULL,
    sell_price NUMERIC(10, 2) NOT NULL,

    PRIMARY KEY (item_id, store_id, year_week),

    CONSTRAINT fk_prices_product
        FOREIGN KEY (item_id)
        REFERENCES products(item_id),

    CONSTRAINT fk_prices_store
        FOREIGN KEY (store_id)
        REFERENCES stores(store_id)
);

--Sales
--One row per item, store and day
CREATE TABLE sales (
    item_id VARCHAR(50) NOT NULL,
    store_id VARCHAR(50) NOT NULL,
    day_id VARCHAR(20) NOT NULL,
    units_sold INTEGER NOT NULL,

    PRIMARY KEY (item_id, store_id, day_id),

    CONSTRAINT fk_sales_product
        FOREIGN KEY (item_id)
        REFERENCES products(item_id),

    CONSTRAINT fk_sales_store
        FOREIGN KEY (store_id)
        REFERENCES stores(store_id),

    CONSTRAINT fk_sales_calendar
        FOREIGN KEY (day_id)
        REFERENCES calendar(day_id)
);

--Supporting indexes for analysis and joins
CREATE INDEX idx_sales_store_id ON sales(store_id);

CREATE INDEX idx_sales_day_id ON sales(day_id);

CREATE INDEX idx_prices_store_week ON prices(store_id, year_week);