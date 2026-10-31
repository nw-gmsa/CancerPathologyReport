Profiles are built on HL7 Europe Base and HL7 Europe Laboratory. Where
[mCODE](https://hl7.org/fhir/us/mcode/) (STU4) has a profile for the same
content, the profile here takes the mCODE name and structure, so the two can be
mapped easily. mCODE itself is not a dependency, because it is built on US Core.

| Profile | Parent | mCODE equivalent | COSD Pathology items |
|---|---|---|---|
| [Cancer Pathology Diagnostic Report](StructureDefinition-CancerPathologyDiagnosticReport.html) | `DiagnosticReport-eu-lab` | None - see US Pathology Diagnostic Report in [Cancer Pathology Data Sharing](https://hl7.org/fhir/us/cancer-reporting/index.html) | pCR0950, pCR0960, pCR0780, pCR1020, pCR0800, pCR7130/7140 |
| [Cancer Pathology Specimen](StructureDefinition-CancerPathologySpecimen.html) | `Specimen-eu-lab` | Human Specimen | pCR0970, pCR0760, pCR1010, pCR0770 |
| [Primary Cancer Condition](StructureDefinition-PrimaryCancerCondition.html) | `condition-eu-core` | Primary Cancer Condition | pCR0810, pCR6410, pCR0820 |
| [Histologic Behavior and Type](StructureDefinition-HistologicBehaviorAndType.html) | `Observation-resultslab-eu-lab` | Histologic Behavior and Type | pCR6420 |
| [Histologic Grade](StructureDefinition-HistologicGrade.html) | `Observation-resultslab-eu-lab` | Histologic Grade | pCR0860 |
| [Tumor Size](StructureDefinition-TumorSize.html) | `Observation-resultslab-eu-lab` | Tumor Size | pCR0830 |
| [TNM Primary Tumor Category](StructureDefinition-TNMPrimaryTumorCategory.html) | `Observation-resultslab-eu-lab` | TNM Primary Tumor Category | pCR0910, pCR6980, pCR6820 |
| [TNM Regional Nodes Category](StructureDefinition-TNMRegionalNodesCategory.html) | `Observation-resultslab-eu-lab` | TNM Regional Nodes Category | pCR0920 |
| [TNM Distant Metastases Category](StructureDefinition-TNMDistantMetastasesCategory.html) | `Observation-resultslab-eu-lab` | TNM Distant Metastases Category | pCR0930 |
| [TNM Stage Group](StructureDefinition-TNMStageGroup.html) | `Observation-resultslab-eu-lab` | TNM Stage Group | pCR0940, pCR1000 |
| [Tumor Marker Test](StructureDefinition-TumorMarkerTest.html) | `Observation-resultslab-eu-lab` | Tumor Marker Test | pCR7000/7010 (Ki-67), pCR7020-7050 (MMR IHC) |
{:.grid}

**Differences from mCODE**

- Only the **pathological** TNM codes are used (mCODE also allows clinical staging).
- Histologic Grade is coded with LOINC `33732-9`; mCODE uses NCI Thesaurus `C18000`.
- [Neoadjuvant Therapy Indicator](StructureDefinition-NeoadjuvantTherapyIndicator.html)
  is a new extension on TNM Stage Group, for COSD `pCR1000`.

**COSD items with no mCODE profile** - vascular or lymphatic invasion, perineural
invasion, excision margins, synchronous tumour and lymph node counts - are
results on the report using the base `Observation-resultslab-eu-lab`. Profiles
for them can be added later.

Value sets for the COSD national codes (specimen nature, grade, margins, MMR
results and so on) and for SNOMED CT topography and morphology are not defined yet.
