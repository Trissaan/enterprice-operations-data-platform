import pandas as pd
from sqlalchemy import create_engine
from urllib.parse import quote_plus
import os
from dotenv import load_dotenv

load_dotenv()

DB_CONFIG = {
    "host": os.getenv("DB_HOST"),
    "port": os.getenv("DB_PORT"),
    "database": os.getenv("DB_NAME"),
    "user": os.getenv("DB_USER"),
    "password": os.getenv("DB_PASSWORD")
}

def get_engine():
    password = quote_plus(DB_CONFIG["password"])

    connection_string = (
        f"postgresql+psycopg2://{DB_CONFIG['user']}:{password}"
        f"@{DB_CONFIG['host']}:{DB_CONFIG['port']}/{DB_CONFIG['database']}"
    )

    return create_engine(
        connection_string,
        connect_args={"options": "-csearch_path=public"}
    )

def extract_tables():
    engine = get_engine()

    tables = {
    "customers": "SELECT * FROM customers",
    "suppliers": "SELECT * FROM suppliers",
    "products": "SELECT * FROM products",
    "warehouses": "SELECT * FROM warehouses",
    "inventory": "SELECT * FROM inventory",
    "orders": "SELECT * FROM orders",
    "order_items": "SELECT * FROM order_items",
    "payments": "SELECT * FROM payments",
    "shipments": "SELECT * FROM shipments",
    "returns": "SELECT * FROM returns"
}

    data = {}
    for table_name, query in tables.items():
        data[table_name] = pd.read_sql(query, engine)
        print(f"Extracted {table_name}: {len(data[table_name])} rows")

    return data