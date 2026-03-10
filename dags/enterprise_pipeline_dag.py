from datetime import datetime
from airflow import DAG
from airflow.operators.python import PythonOperator

from pipeline.run_pipeline import run_pipeline

default_args = {
    "owner": "trissaan",
    "retries": 1
}

with DAG(
    dag_id="enterprise_operations_pipeline",
    default_args=default_args,
    description="Enterprise Operations ETL Pipeline",
    start_date=datetime(2026, 3, 1),
    schedule="@daily",
    catchup=False,
    tags=["etl","portfolio","postgres"]
) as dag:

    run_pipeline_task = PythonOperator(
        task_id="run_etl_pipeline",
        python_callable=run_pipeline
    )