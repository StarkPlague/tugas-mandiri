# 🧾 Customer Transaction Analysis

Proyek ini bertujuan untuk **menggabungkan data pelanggan, produk, dan transaksi** menjadi satu dataset analitik (`master_data`), melakukan **data cleaning**, **feature engineering**, serta menampilkan **tren pendapatan bulanan**.

---

## 🚀 Cara Menggunakan

### 1. **Persiapkan File CSV**
Pastikan tiga file berikut tersedia dalam direktori yang sama:
- `customers.csv`  
- `products.csv`  
- `transactions.csv`

### 2. **Run main.ipynb**
```bash
python analysis.py
```
Atau jalankan cell di notebook yang berisi script:
```python
import pandas as pd
import matplotlib.pyplot as plt
```

Script akan melakukan langkah berikut:
1. Membaca seluruh file CSV dan melakukan **merge** menjadi `master_data`.  
2. Mengecek **missing values** dan melakukan **imputasi** atau penghapusan sesuai threshold.  
3. Membuat fitur turunan:
   - `total_price = quantity * price`
   - `month_year = timestamp.to_period('M')`
4. Menghitung metrik bulanan seperti:
   - total pendapatan (`total_revenue`)
   - jumlah transaksi
   - jumlah pelanggan unik
   - nilai rata-rata order (`avg_order_value`)
5. Menampilkan **visualisasi tren pendapatan bulanan**.

---

### 3. **Output**
- Grafik tren `Total Revenue per Month` (menggunakan Matplotlib).  
- File `master_data` dapat diekspor ke PostgreSQL dengan SQLAlchemy:
  ```python
  from sqlalchemy import create_engine
  engine = create_engine('postgresql://postgres:password@localhost:5432/task_db')
  master_data.to_sql('master_data', engine, index=False, if_exists='replace')
  ```

---

### 📊 **Insight Utama**
- Revenue menunjukkan pola **fluktuatif** antar bulan.
- **Puncak tertinggi** terjadi di **Desember 2023**, kemungkinan karena promo besar (HARBOLNAS, Natal, bonus tahunan).
- **Juni–Oktober 2024** relatif stabil, menandakan periode performa bisnis yang baik.

---

### 🧠 Tech Stack
- Python 3  
- Pandas  
- Matplotlib  
- SQLAlchemy (opsional untuk export ke PostgreSQL)
