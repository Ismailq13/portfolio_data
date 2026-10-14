import duckdb
import pandas as pd
from pathlib import Path

XLSX = Path("data/raw/online_retail_II.xlsx")
DB = "data/retail.duckdb"

# 1. Baca kedua sheet Excel sekaligus
print("Membaca Excel (2 sheet), tunggu 3-6 menit...")
sheets = pd.read_excel(XLSX, sheet_name=None)
for nama, isi in sheets.items():
    print(f"  {nama}: {len(isi):,} baris")

# 2. Gabungkan jadi satu tabel
df = pd.concat(sheets.values(), ignore_index=True)

# 3. Rapikan nama kolom: huruf kecil, spasi jadi garis bawah
df.columns = [c.strip().lower().replace(" ", "_") for c in df.columns]
df = df.rename(columns={
    "invoiceno": "invoice",
    "unitprice": "price",
    "customerid": "customer_id",
    "invoicedate": "invoice_date",
})

# 4. Samakan tipe data
df["invoice"] = df["invoice"].astype(str)
df["stockcode"] = df["stockcode"].astype(str)
df["description"] = df["description"].astype("string")
df["customer_id"] = df["customer_id"].astype("Int64")

# 5. Simpan ke DuckDB sebagai tabel transactions
con = duckdb.connect(DB)
con.execute("CREATE OR REPLACE TABLE transactions AS SELECT * FROM df")
print(con.sql("DESCRIBE transactions"))
n = con.execute("SELECT COUNT(*) FROM transactions").fetchone()[0]
print(f"Total baris di DuckDB: {n:,}")
con.close()