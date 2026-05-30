# Semantic Mapping

## Ontology Selection

This project uses two primary domain-specific ontologies:

**NCIT — NCI Thesaurus** (https://ncithesaurus.nci.nih.gov/, namespace `http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#`): NCIT is a large, openly available biomedical and clinical ontology maintained by the US National Cancer Institute. It is widely used in clinical research, public health data, and FAIR data science workflows. It covers health indicators, lifestyle factors, demographic attributes, and clinical measurements directly relevant to this dataset.

**CHEBI — Chemical Entities of Biological Interest** (https://www.ebi.ac.uk/chebi/, namespace `http://purl.obolibrary.org/obo/`): CHEBI is a curated ontology of molecular entities with a focus on biological relevance, maintained by EMBL-EBI. It is the standard reference for chemical substances in life science data, making it the appropriate choice for caffeine as a bioactive compound.

**schema.org** (https://schema.org/) is retained only for three generic attributes (identifier, country, occupation) where no more specific health/lifestyle ontology provides a meaningful concept. The assignment permits schema.org for such cases where no domain-specific alternative exists.

WikiData was not used in accordance with the assignment instructions.

---

## Attribute Mapping Table

| Attribute | Meaning | Ontology | Concept URI |
|---|---|---|---|
| ID | Participant identifier | schema.org | https://schema.org/identifier |
| Age | Age of participant in years | NCIT | http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C25150 |
| Gender | Biological or social gender of participant | NCIT | http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C17357 |
| Country | Country of residence of participant | schema.org | https://schema.org/addressCountry |
| Coffee_Intake | Daily number of cups of coffee consumed | NCIT | http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C37671 |
| Caffeine_mg | Daily caffeine intake in milligrams | CHEBI | http://purl.obolibrary.org/obo/CHEBI_27732 |
| Sleep_Hours | Average daily sleep duration in hours | NCIT | http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C62558 |
| Sleep_Quality | Self-reported quality of sleep | NCIT | http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C62557 |
| BMI | Body Mass Index (weight/height²) | NCIT | http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C16358 |
| Heart_Rate | Resting heart rate in beats per minute | NCIT | http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C49677 |
| Stress_Level | Self-reported stress level category | NCIT | http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C25576 |
| Physical_Activity_Hours | Daily hours of physical activity | NCIT | http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C61409 |
| Health_Issues | Reported existing health conditions | NCIT | http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C2991 |
| Occupation | Participant's employment category | schema.org | https://schema.org/hasOccupation |
| Smoking | Smoking behaviour status | NCIT | http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C17998 |
| Alcohol_Consumption | Alcohol use behaviour status | NCIT | http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C81231 |
| Productivity_Label | Engineered binary productivity target variable | N/A — derived experimental label with no standard ontological equivalent |

---

## Notes

- `Productivity_Label` is an artificially engineered target variable created for this experiment. It does not correspond to any validated clinical or scientific concept and therefore cannot be meaningfully mapped to a standardised ontological term.
- All NCIT concept URIs are dereferenceable via the NCI BioPortal at https://bioportal.bioontology.org/.
- The CHEBI URI for caffeine (CHEBI:27732) is dereferenceable at https://www.ebi.ac.uk/chebi/searchId.do?chebiId=CHEBI:27732.