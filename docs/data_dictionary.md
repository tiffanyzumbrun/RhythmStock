# RhythmStock Data Dictionary

## Dataset: calendar.csv

| Column | Data Type | Description |
|---------|-----------|-------------|
| date | DATE | Calendar date |
| wm_yr_wk | INTEGER | Walmart year/week identifier |
| weekday | TEXT | Name of the weekday |
| wday | INTEGER | Day number within the week |
| month | INTEGER | Month number |
| year | INTEGER | Calendar year |
| d | TEXT | Day identifier (d_1, d_2, etc.) |
| event_name_1 | TEXT | Primary event or holiday name |
| event_type_1 | TEXT | Primary event category |
| event_name_2 | TEXT | Secondary event name |
| event_type_2 | TEXT | Secondary event category |
| snap_CA | BOOLEAN | SNAP program active in California |
| snap_TX | BOOLEAN | SNAP program active in Texas |
| snap_WI | BOOLEAN | SNAP program active in Wisconsin |