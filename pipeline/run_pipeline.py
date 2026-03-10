from pipeline.extract import extract_tables
from pipeline.transform import transform_data
from pipeline.load import load_data


def run_pipeline():

    data = extract_tables()

    transformed_data = transform_data(data)

    load_data(transformed_data)

    print("Pipeline completed successfully")