# Unit Mapping

This document maps every numeric attribute in the experiment dataset to a standardised unit of measurement and a corresponding ontological concept URI.

---

## Ontology Selection

The primary recommended ontology for this project is the **SI Digital Framework** (https://si-digital-framework.org/), maintained by the Bureau International des Poids et Mesures (BIPM). The SI Digital Framework provides machine-readable URIs for SI base quantities and units.

However, the SI Digital Framework covers only the 7 SI base units and their direct multiples. Several attributes in this dataset use derived or non-SI units (hours, beats per minute, kg/m², cups per day) that are not defined there. For these cases, the fallback ontology used is **QUDT** (Quantities, Units, Dimensions and Data Types, https://qudt.org/), which is a widely adopted, well-curated ontology for scientific measurement units and is referenced as a fallback in the assignment specification.

QUDT was chosen because:
- It is a W3C-aligned, openly available ontology used extensively in scientific and engineering data publishing.
- It covers a comprehensive range of derived and domain-specific units not present in the SI base.
- Its URIs are stable, dereferenceable, and widely recognised in semantic data modelling.

For `Coffee_Intake` (cups per day), no suitable concept exists in either SI Digital Framework or QUDT. This unit is documented descriptively as a custom non-standardised unit.

---

## Unit Mapping Table

| Attribute | Unit Label | Unit Description | Ontology | Concept URI |
|---|---|---|---|---|
| Age | year | Time elapsed since birth | QUDT | http://qudt.org/vocab/unit/YR |
| Coffee_Intake | cup per day | Daily coffee intake volume | Custom | No standard ontological URI — documented as cups/day |
| Caffeine_mg | milligram | Mass of caffeine consumed daily | QUDT | http://qudt.org/vocab/unit/MilliGM |
| Sleep_Hours | hour | Daily sleep duration | QUDT | http://qudt.org/vocab/unit/HR |
| BMI | kilogram per square metre | Body Mass Index | QUDT | http://qudt.org/vocab/unit/KiloGM-PER-M2 |
| Heart_Rate | beat per minute | Cardiac cycle frequency | QUDT | http://qudt.org/vocab/unit/BEAT-PER-MIN |
| Physical_Activity_Hours | hour | Daily physical activity duration | QUDT | http://qudt.org/vocab/unit/HR |

---

## SI Digital Framework Reference

The SI Digital Framework specification is available at:
- Documentation: https://github.com/TheBIPM/SI_Digital_Framework/blob/main/SI_Reference_Point/docs/README.md
- Specification: https://si-digital-framework.org/
- SI quantities: https://si-digital-framework.org/SI
- Serialisation (TTL): https://github.com/TheBIPM/SI_Digital_Framework/blob/main/SI_Reference_Point/TTL/si.ttl

The base SI unit for time is the second (https://si-digital-framework.org/SI/units/second) and for mass is the kilogram (https://si-digital-framework.org/SI/units/kilogram). The dataset uses hours and milligrams which are accepted multiples; QUDT provides the dereferenceable URIs for these derived units.