from pathlib import Path

import pandas as pd


PROJECT_ROOT = Path(__file__).resolve().parents[1]
RAW_DATA_DIR = PROJECT_ROOT / "data" / "raw"
PROCESSED_DATA_DIR = PROJECT_ROOT / "data" / "processed"

INPUT_FILE = RAW_DATA_DIR / "sales_train_evaluation.csv"
OUTPUT_FILE = PROCESSED_DATA_DIR / "sales_evaluation_long.csv"

CHUNK_SIZE = 250

ID_COLUMNS = [
    "id",
    "item_id",
    "dept_id",
    "cat_id",
    "store_id",
    "state_id",
]


def main() -> None:
    """Convert M5 evaluation sales data from wide to long format in chunks."""

    PROCESSED_DATA_DIR.mkdir(parents=True, exist_ok=True)

    if OUTPUT_FILE.exists():
        OUTPUT_FILE.unlink()

    print(f"Reading data from {INPUT_FILE.name}...")

    total_rows_written = 0
    first_chunk = True

    for chunk_number, sales_chunk in enumerate(
        pd.read_csv(INPUT_FILE, chunksize=CHUNK_SIZE),
        start=1,
    ):
        day_columns = [
            column
            for column in sales_chunk.columns
            if column.startswith("d_")
        ]

        sales_long = sales_chunk.melt(
            id_vars=ID_COLUMNS,
            value_vars=day_columns,
            var_name="day_id",
            value_name="units_sold",
        )

        sales_long.to_csv(
            OUTPUT_FILE,
            mode="w" if first_chunk else "a",
            header=first_chunk,
            index=False,
        )

        total_rows_written += len(sales_long)
        first_chunk = False

        print(
            f"Chunk {chunk_number} complete — "
            f"{total_rows_written:,} rows written"
        )

    print("Transformation complete.")
    print(f"Total rows created: {total_rows_written:,}")
    print(f"Output file: {OUTPUT_FILE}")


if __name__ == "__main__":
    main()
