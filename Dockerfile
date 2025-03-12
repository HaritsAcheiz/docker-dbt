FROM apache/airflow:2.10.5
WORKDIR /opt/airflow
USER root
RUN apt update
COPY requirements.txt /opt/airflow/requirements.txt
USER airflow
RUN pip install --upgrade pip \
	&& pip install --no-cache-dir -r /opt/airflow/requirements.txt
RUN python -m venv dbt_venv \
	&& source dbt_venv/bin/activate \
	&& PIP_USER=false pip install --no-cache-dir dbt-trino