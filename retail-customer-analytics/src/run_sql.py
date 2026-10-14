import sys
import duckdb

# 1. ambil nama file sql yg dketik di cmd
sql_file = sys.argv[1]

# 2. buka database dalam mode baca saja
con = duckdb.connect("data/retail.duckdb", read_only=True)

# 3. baca seluruh isi file sql sebagai teks
with open(sql_file, encoding="utf-8") as f:
    isi = f.read()

# 4. pecah per tanda ; lalu jalankan satu per satu
for q in isi.split(";"):
    if q.strip():#lewati potongan kosong
        print(con.sql(q))#jalankan query, tampilkan sebagai tabel
con.close()