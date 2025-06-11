import os
import psycopg2
from dotenv import load_dotenv

load_dotenv()

# CONFIGURATION

PG_HOST = os.getenv("PG_HOST")
PG_PORT = 5432
PG_USER = os.getenv("PG_USER")
PG_PASSWORD = os.getenv("PG_PASSWORD")
PG_DATABASE = os.getenv("PG_DBNAME")
PG_SCHEMA = os.getenv("PG_SCHEMA")

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
BRONZE_DIR = os.path.join(SCRIPT_DIR, "models", "bronze")
SOURCE_NAME = PG_SCHEMA

# Ensure bronze folder 

os.makedirs(BRONZE_DIR, exist_ok=True)

# Connect to Postgres database

conn = psycopg2.connect(
    host=PG_HOST,
    port=PG_PORT,
    user=PG_USER,
    password=PG_PASSWORD,
    dbname=PG_DATABASE
)

cursor = conn.cursor()

# Get all table names in the schema

print(f"🔍 Running for schema: {PG_SCHEMA}")

cursor.execute(f"""
    SELECT table_name
    FROM information_schema.tables
    WHERE table_schema = %s AND table_type = 'BASE TABLE';
""", (PG_SCHEMA,))

tables = cursor.fetchall()

# Generate .sql file for each table

print(f"📋 Found {len(tables)} tables in schema '{PG_SCHEMA}'")

for (table_name,) in tables:
    file_path = os.path.join(BRONZE_DIR, f"bronze_{table_name}.sql")
    with open(file_path, "w") as f:
        f.write(f"-- Auto-generated model for {table_name}\n")
        f.write(f"SELECT * FROM {{{{ source('{SOURCE_NAME}', '{table_name}') }}}}\n")

print(f"✅ Created {len(tables)} model files in {BRONZE_DIR}")

cursor.close()
conn.close()