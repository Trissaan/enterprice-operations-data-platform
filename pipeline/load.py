from sqlalchemy import create_engine
from urllib.parse import quote_plus

DB_CONFIG = {
    "host": "localhost",
    "port": "5432",
    "database": "enterprise_ops_db",
    "user": "postgres",
    "password": "Trissaan@2001"
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

def load_tables(transformed_data):
    engine = get_engine()

    for table_name, df in transformed_data.items():
        target_table = f"analytics_{table_name}"
        df.to_sql(target_table, engine, if_exists="replace", index=False)
        print(f"Loaded {target_table}: {len(df)} rows")