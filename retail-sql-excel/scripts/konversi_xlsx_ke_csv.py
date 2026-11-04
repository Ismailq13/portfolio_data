from pathlib import Path
import pandas as pd

RAW = Path("data/raw/online_retail_II.xlsx")
OUT = Path("data/csv/online_retail_ii.csv")
OUT.parent.mkdir(parents=True, exist_ok=True)

# 1) Baca KEDUA sheet sekaligus (sheet_name=None -> hasilnya kamus {nama_sheet: tabel})
sheets = pd.read_excel(
    RAW,
    sheet_name=None,
    dtype={"Invoice": str, "StockCode": str},  # jaga supaya tidak diubah jadi angka
)

for nama, df in sheets.items():
    print(nama, "->", len(df), "baris")

# 2) Gabungkan jadi satu tabel
df = pd.concat(sheets.values(), ignore_index=True)

# 3) Samakan nama kolom: huruf kecil, tanpa spasi
df = df.rename(columns={
    "Invoice": "invoice",
    "StockCode": "stock_code",
    "Description": "description",
    "Quantity": "quantity",
    "InvoiceDate": "invoice_date",
    "Price": "price",
    "Customer ID": "customer_id",
    "Country": "country",
})

# 4) customer_id terbaca sebagai desimal (12346.0); ubah jadi bilangan bulat yang boleh kosong
df["customer_id"] = df["customer_id"].astype("Int64")

# 5) Simpan ke CSV (tanpa kolom nomor baris pandas)
df.to_csv(OUT, index=False, date_format="%Y-%m-%d %H:%M:%S")

print("Total:", len(df), "baris ->", OUT)