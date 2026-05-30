# Metadata Standards Overlap Analysis (T3.11)

This document analyses the overlap and complementarity between the five metadata standards used in this project: **RO-Crate**, **CodeMeta**, **FAIR4ML**, **Croissant**, and **Model Card**.

---

## Overview of Standards

| Standard | Primary Focus | Format |
|---|---|---|
| RO-Crate | Research object packaging — describes the entire experiment as a citable, linked package | JSON-LD |
| CodeMeta | Software metadata — describes the code/software component | JSON-LD |
| FAIR4ML | ML model metadata — describes training, evaluation, and reuse of ML models | JSON |
| Croissant | Dataset metadata — describes input datasets at the field level for ML use | JSON-LD |
| Model Card | Human-readable model documentation — intended use, limitations, evaluation | Markdown |

---

## Pairwise Overlap Analysis

### RO-Crate ↔ CodeMeta

**Fields appearing in both:**

| Field | RO-Crate | CodeMeta |
|---|---|---|
| Authors / creators | `author` with `@id`, `name`, ORCID | `author` with `@id`, ORCID |
| Licence | `license` (URL reference) | `license` (SPDX URL) |
| Code repository URL | `url` on Dataset entity | `codeRepository` |
| Programming language | on notebook `File` entity | `programmingLanguage` |
| Affiliation | `affiliation` on Person | `affiliation` on Person |

**Fields unique to RO-Crate:**
- Complete inventory of all files (`hasPart`) with their types, formats, and relationships
- Inter-entity relationships (e.g. model card `about` the model file)
- Cross-links to other deposits (Zenodo, TUWRD) via `relatedLink`
- `conformsTo` declarations pointing to versioned specs
- Dataset source URL and per-file licence assignments

**Fields unique to CodeMeta:**
- `version` of the software
- `softwareRequirements` (dependency list with versions)
- `runtimePlatform` and `operatingSystem`
- `applicationCategory`
- `keywords`
- `developmentStatus`

**Conflicts / inconsistencies:**
The `license` in RO-Crate applies to the overall crate (MIT for the code) while individual file entities carry their own licences (CC BY 4.0 for outputs). CodeMeta only has a single `license` field covering the software. This creates a structural inconsistency: a user reading only CodeMeta would not see that the outputs have a different licence.

---

### RO-Crate ↔ FAIR4ML

**Fields appearing in both:**

| Field | RO-Crate | FAIR4ML |
|---|---|---|
| Model artefact reference | `@id` for `.pkl` file | `model_artifact` path |
| Training dataset reference | `about` on data file | `training_dataset.source` |
| Intended use | (via Model Card reference) | `intended_use` |
| Limitations | (via Model Card reference) | `limitations` |

**Fields unique to RO-Crate:**
- Full structural packaging of all related files
- Formal `about` relationships linking the FAIR4ML file to the model
- Licence metadata

**Fields unique to FAIR4ML:**
- `algorithm` name and library version
- `hyperparameters` (max_iter, random_state, scaling)
- `evaluation` metrics with exact values (accuracy, precision, recall, F1)
- `features` list
- `target` variable definition
- `related_files` cross-references (metrics CSV, confusion matrix, predictions)

**Conflicts / inconsistencies:**
None structural, but the `training_dataset.source` in FAIR4ML is a Kaggle URL rather than a DOI. Once the dataset has a proper DOI (from a TUWRD deposit or Zenodo), this should be updated for true FAIR compliance. The RO-Crate can carry the DOI link while FAIR4ML currently cannot without a schema extension.

---

### RO-Crate ↔ Croissant

**Fields appearing in both:**

| Field | RO-Crate | Croissant |
|---|---|---|
| Dataset name | `name` on Dataset entity | `name` |
| Licence | `license` on file entity | `license` |
| Dataset URL / source | `url` on Dataset file | `url` |
| Description | `description` | `description` |
| Creators / publishers | `author` | `creator` / `publisher` |

**Fields unique to RO-Crate:**
- Packaging of all experiment files (code, models, outputs) together with the dataset
- Formal licence objects with typed `@id` references
- Cross-links to TUWRD and Zenodo deposits

**Fields unique to Croissant:**
- Field-level schema (`cr:RecordSet`, `cr:Field`) with data types per column
- Unit codes at the field level (`unitCode` with QUDT URIs)
- `distribution` with file hash for integrity verification
- Source column extraction mapping

**Conflicts / inconsistencies:**
The `creator` in Croissant refers to the original Kaggle dataset authors, while the `author` in RO-Crate refers to the experiment team. This is semantically correct but could confuse readers who interpret both as referring to the same people. The distinction between *original data creator* and *experiment author* should be clearly stated in the README.

---

### CodeMeta ↔ FAIR4ML

**Fields appearing in both:**

| Field | CodeMeta | FAIR4ML |
|---|---|---|
| Software library used | `softwareRequirements` (scikit-learn) | `software.library` and `software.version` |
| Authors | `author` | (none — FAIR4ML does not capture experiment authors) |

**Fields unique to CodeMeta:**
- Full dependency list with version pins
- Runtime and OS requirements
- Repository URL and version

**Fields unique to FAIR4ML:**
- All ML-specific content: hyperparameters, evaluation metrics, features, target variable, limitations

**Conflicts / inconsistencies:**
scikit-learn version appears in both (`"scikit-learn==1.8.0"` in CodeMeta's `softwareRequirements` and `"version": "1.8.0"` in FAIR4ML's `software`). These must be kept in sync when the library is updated.

---

### FAIR4ML ↔ Model Card

**Fields appearing in both:**

| Field | FAIR4ML | Model Card |
|---|---|---|
| Training dataset | `training_dataset` | "Training Data" section |
| Evaluation metrics | `evaluation` (structured) | "Evaluation Results" table (Markdown) |
| Intended use | `intended_use` | "Intended Use" section |
| Limitations | `limitations` (list) | "Limitations" section |
| Algorithm | `algorithm` | "Model Description" section |

**Fields unique to FAIR4ML:**
- Machine-readable structured format (JSON)
- Hyperparameters as key-value pairs
- Stratified split details, test size
- Direct file cross-references (metrics CSV, confusion matrix)

**Fields unique to Model Card:**
- "Out-of-Scope Uses" section (important for responsible AI documentation)
- "Ethical Considerations" section
- Human prose context in each section
- "Licence" section

**Conflicts / inconsistencies:**
The evaluation metrics in FAIR4ML and Model Card must remain numerically consistent. Currently both state accuracy=0.971, precision=0.94, recall=0.99, F1=0.96. If the experiment is re-run, both files need updating together. There is no automated link between them.

---

### Croissant ↔ Model Card

**Fields appearing in both:**

| Field | Croissant | Model Card |
|---|---|---|
| Dataset description | `description` | "Training Data" section |
| Licence | `license` | "Licence" section |

**Fields unique to Croissant:** Field-level schema, data types, unit codes, distribution hashes.

**Fields unique to Model Card:** Model evaluation, intended use, ethical considerations, limitations.

**Conflicts / inconsistencies:** None significant. These two standards are largely complementary with minimal overlap.

---

## Summary Table

| Pair | Shared fields | Unique to first | Unique to second | Conflicts |
|---|---|---|---|---|
| RO-Crate ↔ CodeMeta | author, licence, repo URL, language | file inventory, inter-file links | version, dependencies, OS | Single vs. per-file licence scope |
| RO-Crate ↔ FAIR4ML | model ref, dataset ref, use/limits (indirect) | full file packaging, licences | hyperparameters, metrics, features | Dataset reference uses URL not DOI in FAIR4ML |
| RO-Crate ↔ Croissant | name, licence, URL, description, creators | all file packaging | field-level schema, unit codes | Creator vs. author distinction |
| CodeMeta ↔ FAIR4ML | scikit-learn version | full dependency list, repo | all ML metadata | Version must be kept in sync |
| FAIR4ML ↔ Model Card | training data, metrics, use, limits, algorithm | structured JSON, hyperparams | out-of-scope uses, ethics, prose | Metrics must be kept in sync |
| Croissant ↔ Model Card | dataset description, licence | field schema, unit codes | model eval, ethics, use | None significant |

---

## Discussion

The five standards are largely **complementary rather than conflicting**, each serving a distinct audience and purpose. RO-Crate acts as the structural backbone, packaging everything into a citable, linked unit. CodeMeta serves software registries and citation systems. FAIR4ML and Model Card both document the ML model, with FAIR4ML targeting machine-readable interoperability and Model Card targeting human reviewers. Croissant targets ML benchmark platforms and dataset discovery.

The main practical risks are **synchronisation failures**: metrics, versions, and licence information appear in multiple files and must all be updated together whenever the experiment changes. The project should treat `fair4ml-logistic-regression.json` and `docs/model-card.md` as documents that must always be updated together, and similarly `codemeta.json` and `ro-crate-metadata.json` for software version and author information.

One genuine gap across all five standards is the **absence of a DOI for the input dataset** from Kaggle. The Kaggle source URL is not a persistent identifier. All five standards would be strengthened if the dataset were deposited with a DOI (e.g. via Zenodo or TUWRD) so that the reference is stable and citable.
