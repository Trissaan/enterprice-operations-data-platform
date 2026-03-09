from extract import extract_tables
from transform import run_transformations
from load import load_tables

def main():
    print("Starting pipeline...")

    raw_data = extract_tables()
    transformed_data = run_transformations(raw_data)
    load_tables(transformed_data)

    print("Pipeline completed successfully.")

if __name__ == "__main__":
    main()