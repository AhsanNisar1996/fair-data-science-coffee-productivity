# Model Card — Logistic Regression Productivity Predictor

## Model Description

This model predicts a binary productivity label using lifestyle and health related features derived from the Global Coffee Health Dataset.

The experiment uses a Logistic Regression classifier implemented with scikit learn. The workflow includes preprocessing, ordinal category encoding, feature engineering, train/test splitting, and evaluation.

The productivity label is artificially engineered using sleep duration, sleep quality, and stress level. The model is intended for educational and reproducibility focused FAIR data science experiments.

---

# Intended Use

The model is intended for:
- educational machine learning demonstrations,
- FAIR data infrastructure experiments,
- metadata standardisation exercises,
- and reproducible data science workflows.

The experiment demonstrates how relational data modelling, semantic metadata, and reproducibility practices can be integrated into a machine learning workflow.

The model should not be interpreted as a scientifically validated productivity prediction system.

---

# Out-of-Scope Uses

The model must not be used:
- for medical decision-making,
- for workplace productivity evaluation,
- for behavioural profiling,
- or for any real world assessment of human performance.

The productivity label is synthetic and does not represent a clinically or scientifically validated measure.

The dataset itself is partially synthetic and should only be used for demonstration and educational purposes.

---

# Training Data

The model was trained using the Global Coffee Health Dataset obtained from Kaggle.

Dataset source:
https://www.kaggle.com/datasets/uom190346a/global-coffee-health-dataset

Features used include:
- coffee intake,
- caffeine consumption,
- sleep duration,
- sleep quality,
- BMI,
- heart rate,
- stress level,
- smoking,
- alcohol consumption,
- physical activity.

The dataset was transformed into a normalized relational structure following Third Normal Form (3NF) principles before feature engineering and machine learning preprocessing.

---

# Evaluation Results

## Metrics

| Metric | Value |
|---|---|
| Accuracy | 0.9710 |
| Precision (Class 1) | 0.94 |
| Recall (Class 1) | 0.99 |
| F1-Score (Class 1) | 0.96 |

The model achieved strong predictive performance on the engineered productivity label.

Evaluation was performed using a train/test split with stratification and a Logistic Regression pipeline including feature scaling.

The generated outputs include predictions and a confusion matrix visualization.

---

# Limitations

The experiment contains several important limitations.

The productivity label is artificially engineered and therefore reflects assumptions made during feature engineering rather than real world validated productivity measurements.

Additionally, the dataset does not establish causal relationships between coffee consumption and productivity related behaviour. Observed correlations may be spurious.

---

# Ethical Considerations

The model should not be interpreted as evidence that coffee consumption directly improves productivity.

The experiment demonstrates the importance of careful interpretation of machine learning outputs and highlights risks associated with misleading correlations in behavioural or health related data.

The project is intended to support FAIR, reproducible, and transparent machine learning practices rather than operational decision making.