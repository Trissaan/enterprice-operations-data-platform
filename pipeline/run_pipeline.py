from pipeline.extract import extract_tables
from pipeline.validate import validate_data
from pipeline.transform import transform_data
from pipeline.load import load_data


def run_pipeline():

    print("Starting pipeline")

    data = extract_tables()

    validated_data = validate_data(data)

    transformed_data = transform_data(validated_data)

    load_data(transformed_data)

    print("Pipeline completed successfully")