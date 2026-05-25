# Unit Mapping

This document maps numeric attributes used in the experiment to standardized units of measurement and ontology concepts.

## Unit Mapping Table

| Attribute | Unit | Description | Ontology |
|---|---|---|---|
| Age | years | Participant age | QUDT:YR |
| Coffee_Intake | cups/day | Daily coffee intake | Custom unit |
| Caffeine_mg | milligrams/day | Daily caffeine intake | QUDT:MilliGM |
| Sleep_Hours | hours | Daily sleep duration | QUDT:HR |
| BMI | kg/m² | Body Mass Index | QUDT:KiloGM-PER-M2 |
| Heart_Rate | beats/minute | Heart rate | QUDT:BPM |
| Physical_Activity_Hours | hours | Physical activity duration | QUDT:HR |

## Ontology Selection

The project primarily uses concepts inspired by QUDT (Quantities, Units, Dimensions and Data Types) and SI-related unit standards.

These ontologies were selected because:
- they are widely used in semantic data modelling,
- they support machine-readable unit interoperability,
- and they align with FAIR data principles.

For units without precise standardized equivalents (e.g. cups/day), descriptive mappings are documented explicitly.