# Retail Customer Analytics

Analisis retensi pelanggan pada 1 juta transaksi toko online barang hadiah asal Inggris (Des 2009 – Des 2011): siapa pelanggan paling bernilai, siapa yang berhenti belanja, dan siapa yang kemungkinan kembali.

Data: Online Retail II, UCI Machine Learning Repository (CC BY 4.0).
https://archive.ics.uci.edu/dataset/502/online+retail+ii

## Status

- [x] Fase 0 — Setup & kenalan dengan data
- [ ] Fase 1 — Membersihkan data

## Cara menjalankan

1. `pip install -r requirements.txt`
2. Download `online_retail_II.xlsx` dari link di atas ke `data/raw/`
3. Buka `notebooks/00_kenalan_data.ipynb`, jalankan **Run All**

## Temuan awal tentang data

| Temuan                                             | Angka                            | Keputusan                             |
| -------------------------------------------------- | -------------------------------- | ------------------------------------- |
| Ukuran data                                        | ... baris, 8 kolom, ... s.d. ... | 1 baris = 1 jenis barang dalam 1 nota |
| customer_id kosong                                 | ... (...%)                       | Dibuang untuk analisis pelanggan      |
| Baris dobel                                        | ...                              | Dibuang                               |
| Pembatalan (invoice C...)                          | ... baris                        | Dipisah                               |
| Koreksi stok, harga 0, penyesuaian piutang         | ... baris                        | Dibuang                               |
| Kode non-produk (ongkir, diskon, biaya bank, dll.) | ... baris                        | Dibuang                               |
| Pola musim                                         | puncak sekitar ...               | Dianalisis di Fase 2                  |
