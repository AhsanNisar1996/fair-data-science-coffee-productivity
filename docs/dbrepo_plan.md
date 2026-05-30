# DBRepo Integration Plan

## Objective

Prepare the FAIR Data Science repository for DBRepo integration and relational database publication.

---

# Relational Tables

The following normalized tables will be created in DBRepo:

- countries
- genders
- occupations
- participants
- coffee_consumption
- sleep_metrics
- health_metrics
- lifestyle_metrics

Schema definition is provided in:

```text
sql/schema.sql
```

---

# Source CSV Files

The following processed CSV files will be uploaded to DBRepo:

```text
data/processed/countries.csv
data/processed/genders.csv
data/processed/occupations.csv
data/processed/participants.csv
data/processed/coffee_consumption.csv
data/processed/sleep_metrics.csv
data/processed/health_metrics.csv
data/processed/lifestyle_metrics.csv
```

---

# SQL View

The following machine learning oriented SQL view will be created:

```text
vw_productivity_features
```

The view combines:
- demographic features
- coffee consumption metrics
- sleep metrics
- health metrics
- lifestyle metrics
- engineered productivity label

---

# Metadata to Attach

The DBRepo repository should later reference:

- semantic mappings
- unit mappings
- RO Crate metadata
- CodeMeta metadata
- FAIR4ML metadata
- Model Card
- reproducibility documentation

---

# Remaining DBRepo Tasks

Remaining work includes:

- DBRepo repository creation
- CSV upload automation
- schema import
- SQL view creation
- metadata annotation
- API interaction
- repository publication
- DOI generation if supported