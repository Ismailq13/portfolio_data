# Retail Customer Analytics

Analisis retensi pelanggan, segmentasi, dan prediksi pembelian ulang pada data transaksi toko online barang hadiah asal Inggris (Des 2009 – Des 2011).

Data: Online Retail II, UCI Machine Learning Repository (CC BY 4.0).
https://archive.ics.uci.edu/dataset/502/online+retail+ii

## Status

- [x] Fase 0 — Setup & sanity check data
- [ ] Fase 1 — Data wrangling & SQL

## Cara menjalankan

1. `pip install -r requirements.txt`
2. Download `online_retail_II.xlsx` dari link di atas ke `data/raw/`
3. `python src/load_data.py`
4. `python src/run_sql.py sql/00_sanity_check.sql`

## Catatan data

| Pemeriksaan                                         | Hasil                     | Keputusan                                                                     |
| --------------------------------------------------- | ------------------------- | ----------------------------------------------------------------------------- |
| Jumlah baris & periode                              | ... baris, ... s.d. ...   | Data 2 tahun penuh                                                            |
| Baris tanpa customer_id                             | ... (...%)                | Dibuang untuk analisis pelanggan                                              |
| Baris pembatalan (invoice C...)                     | ... baris, ... invoice    | Dipisah ke tabel sendiri                                                      |
| Quantity atau harga <= 0                            | ... dan ...               | Dibuang dari penjualan                                                        |
| Baris dobel persis                                  | ...                       | Dibuang                                                                       |
| Kode non-produk (POST, M, D, BANK CHARGES, B, dll.) | ... jenis kode            | Dibuang; bukan penjualan barang, dan biaya bank/piutang berkaitan dengan riba |
| Pelanggan & negara                                  | ... pelanggan, ... negara | —                                                                             |
