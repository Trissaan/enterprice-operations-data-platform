def validate_data(data):

    print("Running data validation checks...")

    for table_name, df in data.items():

        if df.empty:
            raise ValueError(f"{table_name} table is empty")

        if df.isnull().sum().sum() > 0:
            print(f"Warning: {table_name} contains NULL values")

        print(f"{table_name} validation passed ({len(df)} rows)")

    print("All validation checks completed")

    return data