# Predicting Productivity Levels Based on Coffee Consumption

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.20465131.svg)](https://doi.org/10.5281/zenodo.20465131)

## Abstract

This project investigates whether coffee consumption and lifestyle-related variables can predict productivity levels using machine learning techniques. The experiment uses the Global Coffee Health Dataset and demonstrates how correlations may appear meaningful without implying causation. A synthetic productivity label is engineered using sleep duration, sleep quality, and stress level to support educational machine learning experiments.

The project focuses on FAIR data principles, reproducibility, semantic metadata, relational data modelling, and open science workflows.

---

## Project Structure

```text
data/
├── raw/                        # Original input dataset
├── processed/                  # Normalised relational CSV exports

docs/
├── diagrams/                   # ER diagrams
├── model-card.md               # Model Card (T3.5)
├── reproducibility.md          # Reproducibility guide
├── semantic_mapping.md         # Ontology attribute mapping (T2.2)
├── unit_mapping.md             # Unit of measurement mapping (T2.3)
├── standards_overlap_analysis.md  # Metadata standards analysis (T3.11)
├── environment.md              # Environment details
├── dbrepo_plan.md              # DBRepo integration plan

models/
├── logistic_regression_pipeline.pkl

notebooks/
├── data_loading.ipynb          # Main experiment notebook

outputs/
├── confusion_matrix.png
├── predictions.csv
├── evaluation_metrics.csv
├── feature_distribution.png
├── model_comparison.csv
├── model_comparison.png

sql/
├── schema.sql                  # 3NF schema + SQL VIEW definitions (T2.1, T2.4)

codemeta.json                   # CodeMeta 2.0 software metadata (T3.2)
croissant.json                  # Croissant dataset metadata (T3.4)
fair4ml-logistic-regression.json  # FAIR4ML model metadata (T3.3)
ro-crate-metadata.json          # RO-Crate research object metadata (T3.1)
CITATION.cff                    # Citation metadata (T3.8)
requirements.txt                # Python dependencies with version pins
LICENSE                         # MIT Licence (code)
```

---

## File Organisation

### Naming Convention

This repository follows a consistent naming convention across all artefact categories:

**Input datasets** — lowercase with underscores, stored in `data/raw/` or `data/processed/`:
```
synthetic_coffee_health_10000.csv
participants.csv, coffee_consumption.csv, sleep_metrics.csv, ...
```

**Output files** (figures, model artefacts, result tables) — lowercase with underscores, stored in `outputs/` or `models/`:
```
confusion_matrix.png
evaluation_metrics.csv
logistic_regression_pipeline.pkl
```

**Scripts and notebooks** — lowercase with underscores, stored in `notebooks/` or `src/`:
```
data_loading.ipynb
```

**Configuration and metadata files** — follow the respective standard's naming convention at the repository root:
```
codemeta.json, croissant.json, ro-crate-metadata.json, CITATION.cff, requirements.txt
```

**Documentation files** — lowercase with underscores, stored in `docs/`:
```
model-card.md, semantic_mapping.md, unit_mapping.md, standards_overlap_analysis.md
```

---

## Dataset

**Global Coffee Health Dataset**
Source: https://www.kaggle.com/datasets/uom190346a/global-coffee-health-dataset
Licence: CC BY 4.0
File: `data/raw/synthetic_coffee_health_10000.csv`

---

## Technologies Used

- Python 3.13
- JupyterLab 4.5.7
- Pandas 3.0.3
- NumPy 2.4.6
- Scikit-learn 1.8.0
- Matplotlib 3.10.9

---

## Requirements and Installation

Install all Python dependencies:

```bash
pip install -r requirements.txt
```

---

## Reproduction Instructions

Follow these steps to reproduce the experiment from scratch:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/AhsanNisar1996/fair-data-science-coffee-productivity.git
   cd fair-data-science-coffee-productivity
   ```

2. **Install dependencies:**
   ```bash
   pip install -r requirements.txt
   ```

3. **Verify the input dataset is present:**
   ```
   data/raw/synthetic_coffee_health_10000.csv
   ```

4. **Launch JupyterLab:**
   ```bash
   jupyter lab
   ```

5. **Open and run the main notebook:**
   ```
   notebooks/data_loading.ipynb
   ```
   Run all cells sequentially from top to bottom.

6. **Verify outputs were generated:**
   The notebook automatically produces the following artefacts:
   - `data/processed/` — normalised relational CSV tables
   - `models/logistic_regression_pipeline.pkl` — trained model
   - `outputs/confusion_matrix.png` — evaluation figure
   - `outputs/evaluation_metrics.csv` — metrics table
   - `outputs/feature_distribution.png` — feature visualisation
   - `outputs/predictions.csv` — model predictions

The experiment uses a fixed random seed (`random_state=42`) to support reproducibility across runs.

---

## Database Schema (3NF)

The dataset was transformed from a single denormalized CSV file into a relational schema following Third Normal Form (3NF). The schema separates lookup entities (countries, genders, occupations) from measurement tables.

**Tables:** `countries`, `genders`, `occupations`, `participants`, `coffee_consumption`, `sleep_metrics`, `health_metrics`, `lifestyle_metrics`

Schema definition: `sql/schema.sql`
ER diagram: `docs/diagrams/er_diagram.mmd`

---

## SQL Views (T2.4)

Two SQL views are defined in `sql/schema.sql`:

### `vw_productivity_features`
**Purpose:** Full de-normalised feature table for the ML pipeline. Joins all 8 tables and computes the engineered binary `productivity_label` (1 = productive, 0 = non-productive) based on sleep duration, sleep quality, and stress level. This is the primary view consumed by the machine learning notebook.

### `vw_coffee_health_aggregates`
**Purpose:** Exploratory data analysis aggregation view. Groups participants by coffee intake category (None / Low / Moderate / High) and stress level, exposing average health indicators (age, caffeine intake, sleep hours, BMI, heart rate, physical activity) per group. Useful for validating the relational joins and exploring lifestyle patterns before model training.

---

## DBRepo Integration

The DBRepo REST API is used to load input data and retrieve it during the ML pipeline (T2.5, T2.6). See `notebooks/dbrepo_upload.ipynb` for the DBRepo integration notebook.

**DBRepo entry:** https://test.dbrepo.tuwien.ac.at/database/a6229b2e-5a3d-4a46-93aa-e9474f492ec1

**Base URL:** `https://test.dbrepo.tuwien.ac.at`

**Database ID:** `a6229b2e-5a3d-4a46-93aa-e9474f492ec1`

The tables and VIEW endpoints (`vw_productivity_features`, `vw_coffee_health_aggregates`) are defined in `sql/schema.sql`. Full endpoint paths and authentication details will be added once the DBRepo API integration is finalised (T2.6).

---

## Metadata Standards

This repository includes the following metadata standards and FAIR artefacts:

| File | Standard | Task |
|---|---|---|
| `ro-crate-metadata.json` | RO-Crate 1.1 | T3.1 |
| `codemeta.json` | CodeMeta 2.0 | T3.2 |
| `fair4ml-logistic-regression.json` | FAIR4ML | T3.3 |
| `croissant.json` | Croissant (ML Commons) | T3.4 |
| `docs/model-card.md` | Model Card | T3.5 |
| `CITATION.cff` | Citation File Format | T3.8 |

See `docs/standards_overlap_analysis.md` for a full analysis of overlap and complementarity between these standards.

---

## Licences

This project involves three categories of artefact, each with a distinct licence:

### Input Data
The Global Coffee Health Dataset is published under the **Creative Commons Attribution 4.0 International (CC BY 4.0)** licence by its original authors on Kaggle. Reuse requires attribution to the original creators. CC BY 4.0 permits reuse, redistribution, and adaptation, including for commercial purposes, provided attribution is given. There are no ShareAlike clauses, so derived outputs are not required to use the same licence.
Licence URL: https://creativecommons.org/licenses/by/4.0/

### Software / Code
All code, scripts, and notebooks in this repository are released under the **MIT Licence** (see `LICENSE`). MIT was chosen because it is maximally permissive, compatible with CC BY 4.0 input data (no licence obligations are imposed on the code by CC BY), and widely used in open science and machine learning projects.

### Produced / Output Data
All generated outputs (trained model `models/logistic_regression_pipeline.pkl`, prediction results, evaluation metrics, and figures in `outputs/`) are released under **Creative Commons Attribution 4.0 International (CC BY 4.0)**. This is consistent with the input data licence and allows other researchers to build on the generated outputs freely, provided attribution is given.
Licence URL: https://creativecommons.org/licenses/by/4.0/

---

## Contributors

| Role | Name | Student ID | ORCID |
|---|---|---|---|
| A | Nisar Ahsan | 12331410 | [0009-0002-0185-7981](https://orcid.org/0009-0002-0185-7981) |
| B | Bangash Muhammad Imran Haider | 12428582 | [0009-0003-0882-0011](https://orcid.org/0009-0003-0882-0011) |
| C | Güneş Aykut Tayfun | 12450336 | [0009-0004-1597-039X](https://orcid.org/0009-0004-1597-039X) |
| D | YILDIRIM Gökay | 12450335 | [0009-0005-3902-8742](https://orcid.org/0009-0005-3902-8742) |

---

## Generated Artefacts

| File | Type | Licence |
|---|---|---|
| `models/logistic_regression_pipeline.pkl` | Trained ML model | CC BY 4.0 |
| `outputs/predictions.csv` | Prediction results | CC BY 4.0 |
| `outputs/evaluation_metrics.csv` | Evaluation metrics | CC BY 4.0 |
| `outputs/confusion_matrix.png` | Figure | CC BY 4.0 |
| `outputs/feature_distribution.png` | Figure | CC BY 4.0 |
| `outputs/model_comparison.csv` | Model comparison | CC BY 4.0 |
| `outputs/model_comparison.png` | Figure | CC BY 4.0 |
