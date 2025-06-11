
# 🛠️ Contoso Sales Data Transformation with dbt

This project transforms raw sales data for Contoso Ltd using `dbt` (Data Build Tool). The transformation layers include Bronze (raw ingestion) and Transformed (cleansed dimensional and fact models), deployed on PostgreSQL.

## 📁 Project Structure

```.
contoso-dbt-transformation/
│
├── elt_trans/
│   ├── models/
│   │   ├── bronze/
│   │   ├── curated/
│   ├── macros/
│   ├── tests/
│   ├── seeds/
│   ├── snapshots/
│   ├── dbt_project.yml
│   └── .dbt/profiles.yml
├── .github/
│   └── workflows/
│       └── deploy.yml
├── .env
└── README.md
```

## 🚀 Objectives

- Dynamically load Contoso raw data into PostgreSQL (Bronze Layer).
- Transform and model into a star schema with fact and dimension tables (Transformed Layer).
- Document all models using dbt Documentation as Code (DaC).
- (Future) Automate deployment to production via GitHub Actions.

## 🔁 Data Transformation Layers

### 🔹 Bronze Models

Raw tables ingested directly from the source system. Each model preserves source structure as-is.

| Model              | Description                            |
|-------------------|----------------------------------------|
| `bronze_channels` | Channels used in the sales process     |
| `bronze_geography`| Geographical information               |
| `bronze_product`  | Product details                        |
| `bronze_promotion`| Promotions and discounts               |
| `bronze_sales`    | Transactional sales records            |
| `bronze_stores`   | Store master data                      |

### 🔷 Transformed Models

Transformed into a star schema with surrogate keys and optimized types:

| Model           | Type  | Description                                      |
|----------------|-------|--------------------------------------------------|
| `sales_fact`   | Fact  | Core transactional table with all sales metrics |
| `products_dim` | Dim   | Product details filtered for sold products       |
| `channels_dim` | Dim   | Sales channel details                            |
| `geography_dim`| Dim   | Region, continent, and country info              |
| `promotions_dim`| Dim  | Promotion periods and discount details           |
| `stores_dim`   | Dim   | Store profile and geography                      |

---

## 📌 Highlights

- ✅ Incremental development with Jinja-templated SQL.
- ✅ Referential integrity maintained between dimensions and fact table.
- ✅ Follows dbt best practices for testing and documentation.

## 🧪 Tests and Documentation

Each model includes:

- Descriptions for model and columns
- Primary key and not null tests on critical fields
- Relationships defined between dimension and fact tables

Generate docs:

```bash
dbt docs generate && dbt docs serve
```

## ⚙️ Setup Instructions

1. Clone the repository:

```bash
git clone https://github.com/MoraQs/contoso-dbt-transformation.git
```

1. Install dependencies:

```bash
cd elt_trans
pip install -r requirements.txt
```

1. Configure `.env` for dev credentials.

2. Run dbt:

```bash
dbt run --target dev
```
