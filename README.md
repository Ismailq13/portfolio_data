# Olist Customer Experience Analytics

Analisis dampak keterlambatan pengiriman terhadap rating, pelanggan yang kembali, dan revenue pada data e-commerce Olist (Brasil, 2016–2018).

## Status

- [x] Fase 0 — Setup & sanity check data
- [ ] Fase 1 — Data wrangling & SQL

## Cara menjalankan

1. `pip install -r requirements.txt`
2. Download data: `kaggle datasets download -d olistbr/brazilian-ecommerce -p data/raw --unzip`
3. `python src/load_data.py`
4. `python src/run_sql.py sql/00_sanity_check.sql`

## Catatan data

| Pemeriksaan                          | Hasil                         | Keputusan                                          |
| ------------------------------------ | ----------------------------- | -------------------------------------------------- |
| Jumlah order                         | ... (order_id unik: ya/tidak) | order_id dipakai sebagai kunci                     |
| Order berstatus delivered            | ... dari ... order (...%)     | Analisis keterlambatan hanya pakai order delivered |
| Order tanpa item                     | ...                           | Dikeluarkan dari analisis revenue                  |
| customer_id vs customer_unique_id    | ... vs ...                    | Repeat purchase dihitung dengan customer_unique_id |
| Delivered tapi tanggal sampai kosong | ...                           | Dibuang di Fase 1                                  |
