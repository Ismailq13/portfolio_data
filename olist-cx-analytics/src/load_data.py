import duckdb
from pathlib import Path

RAW = Path("data/raw")
con = duckdb.connect("data/olist.duckdb")

for csv in sorted(RAW.glob("*.csv")):
    name = csv.stem.replace("olist_", "").replace("_dataset", "")
    con.execute(f"""
        CREATE OR REPLACE TABLE {name} AS
        SELECT * FROM read_csv_auto('{csv.as_posix()}')
    """)
    n = con.execute(f"SELECT COUNT(*) FROM {name}").fetchone()[0]
    print(f"{name:40s} {n:>10,} baris")

con.close()