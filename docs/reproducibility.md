# Reproducibility Information

## Environment

The experiment was developed and tested using:

- Python 3.13
- JupyterLab 4.5.7
- macOS

Main dependencies are listed in:

```text
requirements.txt
```

---

# Reproduction Steps

1. Clone the repository

2. Install dependencies:

```bash
pip install -r requirements.txt
```

3. Launch JupyterLab:

```bash
jupyter lab
```

4. Open:

```text
notebooks/data_loading.ipynb
```

5. Run all notebook cells sequentially

---

# Generated Artefacts

The notebook automatically generates:

- normalized relational datasets
- trained machine learning model
- evaluation metrics
- confusion matrix figure
- feature distribution figure
- prediction outputs

Generated artefacts are stored in:

```text
data/processed/
models/
outputs/
```

---

# Determinism and Randomness

The experiment uses fixed random seeds where applicable:

```python
random_state=42
```

This improves reproducibility across executions.

---

# Limitations

Exact numerical reproducibility may vary slightly across:
- operating systems,
- CPU architectures,
- dependency versions,
- and floating point implementations.

However, the workflow and generated outputs should remain functionally reproducible.