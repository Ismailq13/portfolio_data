# Retail SQL + Excel

Analisis transaksi toko online Inggris (Des 2009 - Des 2011) dengan PostgreSQL dan Excel.

## Sumber data

Chen, D. (2012). Online Retail II [Dataset]. UCI Machine Learning Repository.
https://doi.org/10.24432/C5CG6D (lisensi CC BY 4.0). Data tidak disertakan di repo ini;
download dari tautan di atas ke `data/raw/`.

## Cara menyiapkan data

1. Taruh `online_retail_II.xlsx` di `data/raw/`.
2. Jalankan `python scripts/konversi_xlsx_ke_csv.py`.
