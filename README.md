# Predicting Productivity Levels Based on Coffee Consumption
[![DOI](https://zenodo.org/badge/1232220288.svg)](https://doi.org/10.5281/zenodo.20465131)
## Abstract

This project investigates whether coffee consumption and lifestyle-related variables can predict productivity levels using machine learning techniques.

The experiment uses the Global Coffee Health Dataset and demonstrates how correlations may appear meaningful without implying causation. A synthetic productivity label is engineered using sleep duration, sleep quality, and stress level to support educational machine learning experiments.

The project focuses on:
- FAIR data principles
- reproducibility
- semantic metadata
- relational data modelling
- open science workflows

---

# Project Structure

```text
data/
├── raw/                  # Original dataset
├── processed/            # Normalized relational CSV exports

docs/
├── diagrams/             # ER diagrams and architecture figures

models/
├── logistic_regression_pipeline.pkl

notebooks/
├── data_loading.ipynb

outputs/
├── confusion_matrix.png
├── predictions.csv

sql/
├── schema.sql

src/
config/
```

---

# Technologies Used

- Python
- JupyterLab
- Pandas
- NumPy
- Scikit-learn
- Matplotlib

---

# Dataset

Dataset used:

Global Coffee Health Dataset  
Source:
https://www.kaggle.com/datasets/uom190346a/global-coffee-health-dataset

Main dataset file:

```text
synthetic_coffee_health_10000.csv
```

---

# File Organisation

## Input datasets

```text
data/raw/synthetic_coffee_health_10000.csv
```

---

## Processed datasets

```text
data/processed/
├── participants.csv
├── countries.csv
├── genders.csv
├── occupations.csv
├── coffee_consumption.csv
├── sleep_metrics.csv
├── health_metrics.csv
├── lifestyle_metrics.csv
```

---

## Jupyter notebooks

```text
notebooks/data_loading.ipynb
```

---

## Figures and outputs

```text
outputs/confusion_matrix.png
outputs/predictions.csv
outputs/feature_distribution.png
outputs/evaluation_metrics.csv
outputs/evaluation_metrics.csv
outputs/feature_distribution.png
outputs/model_comparison.csv
outputs/model_comparison.png
```

---

## Model files

```text
models/logistic_regression_pipeline.pkl
```

---

## SQL schema

```text
sql/schema.sql
```

---

# Machine Learning Pipeline

The experiment workflow includes:

1. Dataset loading
2. Relational normalization
3. Feature engineering
4. Ordinal category encoding
5. Train/test split
6. Logistic Regression training
7. Evaluation and artefact generation

The productivity label is engineered using:
- sleep duration
- sleep quality
- stress level

The label is intended for demonstration purposes only and does not represent a scientifically validated productivity metric.

---

# Database Schema (3NF)

The dataset was transformed from a single denormalized CSV file into a relational database schema following Third Normal Form (3NF) principles.

The schema separates reusable categorical entities such as:
- countries
- genders
- occupations

into lookup tables to improve semantic clarity and reduce redundancy.

Main entity tables include:
- participants
- coffee_consumption
- sleep_metrics
- health_metrics
- lifestyle_metrics

Relationships between entities are implemented using foreign keys.

This normalization improves:
- data consistency
- maintainability
- FAIR interoperability
- semantic reuse
- database scalability

---

# SQL Views

The project defines a machine learning oriented SQL view:

## vw_productivity_features

This view combines:
- participant demographics
- coffee consumption
- sleep metrics
- health indicators
- lifestyle factors

into a query ready feature table for machine learning experiments.

The view also contains the engineered binary target variable:

- `1` = productive
- `0` = non-productive

---

# Reproducibility

To reproduce the experiment:

1. Install Python dependencies
2. Launch JupyterLab
3. Open:

```text
notebooks/data_loading.ipynb
```

4. Run all notebook cells sequentially

The notebook performs:
- preprocessing
- relational normalization
- feature engineering
- model training
- evaluation
- artefact generation

---

# Contributors

| Role | Name | Student ID |
|---|---|---|
| A | Nisar Ahsan | 12331410 |
| B | Bangash Muhammad Imran Haider | 12428582 |
| C | Güneş Aykut Tayfun | 12450336 |
| D | YILDIRIM Gökay | 12450335 |

---

# License

This repository currently uses the MIT License for software and code.

Further licensing details for:
- datasets
- generated outputs
- trained models

will be added in later work packages.

# Installation

Install dependencies using:

```bash
pip install -r requirements.txt
```

---

# Metadata Standards

This repository currently includes the following metadata standards and FAIR related artefacts:

- CodeMeta (`codemeta.json`)
- Croissant metadata (`croissant.json`)
- Model Card (`docs/model-card.md`)
- RO Crate metadata (`ro-crate-metadata.json`)
- SQL schema and relational view definitions
- Unit mapping documentation (`docs/unit_mapping.md`)

These artefacts support:
- reproducibility
- interoperability
- semantic annotation
- FAIR machine learning workflows

---

# Generated Artefacts

The experiment generates:
- trained machine learning models
- evaluation metrics
- prediction outputs
- confusion matrices
- feature distribution figures

Generated artefacts are stored in:

```text
models/
outputs/
data/processed/
```