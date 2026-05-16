# End-to-End Banking Data Engineering & Analytics Pipeline

## Project Overview

This project demonstrates an end-to-end banking data engineering and analytics workflow integrating Python, PostgreSQL and Power BI to transform raw banking data into actionable business insights.

The project simulates a real-world banking environment by building ETL pipelines, designing a warehouse schema, performing SQL analytics, and developing interactive dashboards for customer, transaction, and loan analysis.

## Tech Stack

* Python (Pandas, NumPy, SQLAlchemy)
* PostgreSQL
* Power BI
* Jupyter Notebook
* pgAdmin

## Project Workflow

Raw Banking Data → Python Data Cleaning & Transformation → PostgreSQL Data Warehouse → SQL Analytics → Power BI Dashboards

## Key Features

* Built ETL pipelines to clean and transform raw banking datasets
* Loaded cleaned datasets into PostgreSQL using SQLAlchemy
* Designed fact and dimension tables for analytical reporting
* Performed SQL-based customer, transaction, and loan analysis
* Developed interactive Power BI dashboards for business insights
* Implemented customer segmentation and risk analysis techniques

## Key Business Insights

* High number of dormant accounts indicating potential customer churn
* Failed transactions highlighting operational and system reliability concerns
* ATM transactions dominate customer activity
* Presence of late and defaulted loans indicating credit risk exposure
* Majority of customers fall under the low-value customer segment

## Repository Structure

```bash
banking-data-engineering-project/
│
├── data/
├── notebooks/
├── sql/
├── dashboards/
├── powerbi/
├── README.md
└── requirements.txt
```

## Future Improvements

* Automate ETL workflows using Apache Airflow
* Deploy machine learning models for churn prediction
* Implement real-time streaming pipelines
* Add cloud-based data warehousing solutions
* Develop fraud detection analytics models

## Author

Lynn Njeri

