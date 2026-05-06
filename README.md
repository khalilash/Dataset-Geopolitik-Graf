# Analisis Jaringan Geopolitik menggunakan Wikidata & DBpedia 🌍📊

Proyek ini merupakan implementasi **Knowledge Graph** untuk memetakan dan menganalisis hubungan antar entitas geopolitik di seluruh dunia. [cite_start]Dengan mengintegrasikan data dari **Wikidata** dan **DBpedia**, proyek ini mengeksplorasi keterkaitan antara kota, negara, benua, bahasa, dan mata uang menggunakan algoritma graf.

## Anggota
* **Alisha Rafimalia:** 5026231202
* **Khalila Shafarayhani A.:** 5026231167
  
## 📝 Latar Belakang
Dalam analisis data tradisional, hubungan antar wilayah seringkali hanya dilihat sebagai atribut statis. [cite_start]Proyek ini menggunakan pendekatan **Graph Computing** untuk memahami "pengaruh" dan "kedekatan" antar entitas berdasarkan struktur jaringan mereka, bukan hanya sekadar data angka.

## 🛠️ Tech Stack
* [cite_start]**Data Sourcing:** SPARQL (Wikidata & DBpedia).
* [cite_start]**Data Processing:** Python (Pandas).
* [cite_start]**Database:** Neo4j (Graph Database).
* [cite_start]**Graph Library:** Neo4j Graph Data Science (GDS).

## 📂 Struktur Graf (Ontologi)
[cite_start]Graf ini dibangun dengan skema berikut:
* **Nodes:** `City`, `Country`, `Continent`, `Language`, `Currency`.
* **Relationships:**
    * `(:City)-[:BELONGS_TO]->(:Country)`
    * `(:Country)-[:PART_OF]->(:Continent)`
    * `(:Country)-[:SPEAKS]->(:Language)`
    * `(:Country)-[:USES_CURRENCY]->(:Currency)`

## 🚀 Analisis Algoritma
[cite_start]Proyek ini menerapkan tiga algoritma utama pada proyeksi graf `geoGraph`:

1.  [cite_start]**PageRank Centrality:** Mengukur tingkat pengaruh bahasa di dunia berdasarkan konektivitas negara dan populasi kota yang terhubung dengannya.
2.  [cite_start]**Jaccard Similarity:** Menghitung rasio kemiripan antara dua negara berdasarkan atribut bahasa, benua, dan mata uang yang digunakan bersama.
3.  [cite_start]**Louvain Community Detection:** Mengelompokkan entitas secara otomatis ke dalam blok-blok geopolitik (seperti Blok Hispanik, Blok Commonwealth, dll.) berdasarkan kepadatan relasi.

## 💻 Cuplikan Kode

### 1. Integrasi Data (Python)
```python
import pandas as pd

df1 = pd.read_csv('query_wikidata.csv')
df2 = pd.read_csv('query_dbpedia.csv')

# Menggabungkan data berdasarkan nama kota
merged = pd.merge(df1, df2, on='cityName', how='inner')
merged.to_csv('Geopolitik_Dataset_Graf.csv', index=False)
