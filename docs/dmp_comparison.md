# DMP Comparison – Initial vs Final (T4.5)

**Initial DMP** (Part 2, individual submission by Nisar Ahsan):
https://handle.test.datacite.org/10.70124/x2ksk-zsy49

**Final DMP** (Part 3, group submission):
https://handle.test.datacite.org/10.70124/rpq9f-44115

---

## Question 1: What did the initial DMP promise that turned out to be unrealistic, and why?

*Focus: claims that were never achievable, not changes that were asked of us.*

**The wrong dataset was planned from the start.** The initial DMP described reusing the European Health Interview Survey (EHIS) accessed via the European Data Portal as the primary input dataset. This dataset was never used at any point during the actual project. The group selected the Global Coffee Health Dataset from Kaggle instead — a completely different source with different variables, provenance, and licence. The initial DMP's entire data description section, including its provenance documentation and reuse justification, therefore described a dataset that the project never touched. This was not a change that was asked of us; the EHIS plan appears to have been a placeholder that was never validated against what the group would actually work with.

**Minimal sharing was planned, but comprehensive open publication was always going to be required.** The initial DMP explicitly stated that "only the DMP is uploaded — no dataset or code" to the TU Wien repository, and that data access was limited to the project author only. In reality, the course structure for Part 3 always required full open publication across multiple repositories (GitHub, Zenodo, TUWRD), with DOIs for model artefacts, generated outputs, and the DMP itself. The promise of restricting uploads to just the DMP was not a deliberate choice that was later reversed — it was based on a misunderstanding of what Part 3 would require, and it would never have been sufficient for the assignment regardless of any instruction changes.

**Individual data management was assumed throughout.** The initial DMP was written as a solo project: "The responsibility for data management lies entirely with the student." It described a single-author workflow with personal computer storage, personal backups, and no mention of distributed team coordination, role assignments, or multi-contributor metadata. The group project structure — with four contributors, assigned roles, ORCID identifiers, and coordinated deposits — was a structural reality from the moment Part 3 began, not something added later. Planning for individual data management was inherently unrealistic for a group deliverable.

---

## Question 2: What did the final DMP require that the initial one glossed over?

*Focus: the effort, decisions, and knowledge that went into the real thing.*

**Identifying three separate licence categories required active research and decision-making.** The initial DMP mentioned reuse of a dataset with "no major restrictions" and vaguely noted that "reuse is allowed with citation," but it did not distinguish between the licence of the input data, the software, and the generated outputs. The final DMP required us to: identify the actual licence of the Kaggle dataset (CC BY 4.0), choose an open-source software licence compatible with it (MIT), and then separately decide on a licence for the trained model and generated outputs (CC BY 4.0). Each of these three decisions required looking up the original dataset's licence terms, understanding what compatibility means, and verifying that CC BY 4.0 imposes no ShareAlike obligations that would restrict the code licence. None of this was present in the initial DMP.

**Semantic and ontological metadata required domain knowledge that was not anticipated.** The initial DMP described metadata as "feature descriptions, processing steps, and model details" with no reference to any formal standard. The final DMP required mapping every attribute to a specific concept URI in a domain ontology (NCIT for health/lifestyle variables, CHEBI for caffeine as a chemical compound, QUDT for units of measurement), choosing those ontologies over Wikipedia-level alternatives, and justifying the choice in writing. This work required understanding what makes an ontology "domain-specific" versus "top-level," comparing multiple candidate ontologies, and tracing dereferenceable URIs to confirm the concepts were real and correctly applied. The initial DMP gave no indication this level of detail would be needed.

**Five overlapping metadata standards had to be understood, applied, and kept consistent.** The initial DMP mentioned no formal metadata standard at all — it described metadata as Jupyter notebooks and code comments. The final DMP required producing five separate standards-compliant files (RO-Crate, CodeMeta, FAIR4ML, Croissant, Model Card) that each describe the same experiment from a different angle, with overlapping fields that must be kept numerically and semantically consistent. For example, evaluation metrics appear in both FAIR4ML and Model Card and must agree; scikit-learn version appears in both CodeMeta and FAIR4ML and must match. Understanding which standard covers what, and what each requires, took considerably more effort than writing a single DMP document.

**Persistent identifiers at every layer were required, not optional.** The initial DMP mentioned "a DOI assigned after upload" as a single identifier for the whole project. The final DMP required ORCIDs for all four contributors (requiring registration), a ROR identifier for the institution, a DOI from Zenodo linked via GitHub integration (not manually deposited), two separate TUWRD DOIs (one for the model, one for the output data), and cross-references linking all of these together in the maDMP JSON. Each identifier is a decision point: which platform, what metadata to provide, how to link back to GitHub and to each other. The initial DMP's single mention of "a DOI" did not reflect this web of interlinking identifiers.

**A machine-actionable DMP (maDMP) in structured JSON was required alongside the human-readable document.** The initial DMP was a PDF created from a template. The final submission requires both a human-readable PDF and a machine-actionable JSON document following the RDA DMP Common Standard schema, with all contributors, datasets, licences, and hosts described in a formal structure that can be validated against a schema. This is a technically separate deliverable that the initial DMP made no reference to, and producing it required understanding the RDA maDMP specification, mapping the DMP content onto that schema, and adding information (like host availability percentages and byte sizes) that does not appear anywhere in the human-readable DMP.
