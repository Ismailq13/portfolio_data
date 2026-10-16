# Retail Customer Analytics

Analisis retensi pelanggan pada 1 juta transaksi toko online barang hadiah asal Inggris (Des 2009 – Des 2011): siapa pelanggan paling bernilai, siapa yang berhenti belanja, dan siapa yang kemungkinan kembali.

Data: Online Retail II, UCI Machine Learning Repository (CC BY 4.0).
https://archive.ics.uci.edu/dataset/502/online+retail+ii

## Status

- [x] Fase 0 — Setup & kenalan dengan data
- [x] Fase 1 — Membersihkan data
- [ ] Fase 2 — EDA & visualisasi

## Cara menjalankan

1. `pip install -r requirements.txt`
2. Download `online_retail_II.xlsx` dari link di atas ke `data/raw/`
3. Buka `notebooks/00_kenalan_data.ipynb`, jalankan **Run All**
4. Jalankan notebooks/01_bersihkan_data.ipynb (Run All)

## Temuan awal tentang data

| Temuan                                             | Angka                                          | Keputusan                             |
| -------------------------------------------------- | ---------------------------------------------- | ------------------------------------- |
| Ukuran data                                        | 1067371 baris, 8 kolom                         | 1 baris = 1 jenis barang dalam 1 nota |
| customer_id kosong                                 | 243007 (22.8%)                                 | Dibuang untuk analisis pelanggan      |
| Baris dobel                                        | 34335                                          | Dibuang                               |
| Pembatalan (invoice C...)                          | 19494 baris                                    | Dipisah                               |
| Koreksi stok, harga 0, penyesuaian piutang         | 6202 baris                                     | Dibuang                               |
| Kode non-produk (ongkir, diskon, biaya bank, dll.) | 6093 baris                                     | Dibuang                               |
| Pola musim                                         | puncak sekitar November 2011 - 9 Desember 2011 | Dianalisis di Fase 2                  |

## Langkah pembersihan

| Langkah                         | Baris dibuang/dipisah | Alasan                                                |
| ------------------------------- | --------------------- | ----------------------------------------------------- |
| Baris dobel                     | 34335                 | Tercatat dua kali                                     |
| Pembatalan (invoice C...)       | 19104                 | Dipisah ke cancel_lines                               |
| Quantity <= 0                   | 3393                  | Koreksi stok                                          |
| Harga <= 0                      | 2626                  | Barang rusak, koreksi, penyesuaian piutang            |
| Kode non-produk                 | 4699                  | Ongkir, diskon, manual, biaya marketplace, biaya bank |
| Pembelian yang dibatalkan penuh | 9228 (GBP 731340)     | Tidak jadi terjual                                    |

Biaya bank dan penyesuaian piutang berkaitan dengan riba, sehingga tidak dipakai sama sekali.
Baris tanpa customer_id (...% baris, ...% nilai) tetap ada di clean_lines untuk analisis penjualan, tetapi tidak dipakai untuk analisis pelanggan.

**Keterbatasan:** pencocokan pembatalan memakai pelanggan + barang + jumlah yang sama; pembatalan sebagian tidak ikut dibuang.

## Tabel hasil

| File         | 1 baris =                   | Jumlah baris |
| ------------ | --------------------------- | ------------ |
| clean_lines  | 1 jenis barang dalam 1 nota | 993,986      |
| cancel_lines | 1 baris pembatalan          | 17,914       |
| invoices     | 1 nota                      | 36,267       |
| customers    | 1 pelanggan                 | 5,838        |

Validasi: total revenue sama di tingkat baris, nota, dan pelanggan (tidak ada fan-out). ...% pelanggan belanja lebih dari sekali.
