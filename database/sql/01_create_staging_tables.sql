-- =====================================================
-- RhythmStock
-- Sprint 2 - Create Staging Tables
-- =====================================================

DROP TABLE IF EXISTS stg_calendar;

CREATE TABLE stg_calendar (
    date DATE,
    wm_yr_wk INT,
    weekday VARCHAR(20),
    wday INT,
    month INT,
    year INT,
    d VARCHAR(20),
    event_name_1 VARCHAR(100),
    event_type_1 VARCHAR(50),
    event_name_2 VARCHAR(100),
    event_type_2 VARCHAR(50),
    snap_ca INT,
    snap_tx INT,
    snap_wi INT,
);

-- =====================================================
-- Sell Prices Staging Table
-- Source: sell_prices.csv
-- =====================================================

DROP TABLE IF EXISTS stg_sell_prices;

CREATE TABLE stg_sell_prices (
    store_id VARCHAR(20),
    item_id VARCHAR(30),
    wm_yr_wk INT,
    sell_price DECIMAL(10, 2)
);