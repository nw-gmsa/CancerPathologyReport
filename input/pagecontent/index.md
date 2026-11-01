<div class="alert alert-danger" role="alert">
<b>Proof of concept.</b> This implementation guide is a demonstration only. It is
<b>not</b> an authoritative source, is not endorsed by NHS England, the National
Disease Registration Service or HL7, and must not be used for implementation or
clinical purposes. The authoritative source for COSD Pathology is the
<a href="https://nhsd-proxy.openprescribing.net/ndrs/data/data-sets/cosd/cosd-pathology-user-guide-v5.0/core---pathology">COSD Pathology User Guide</a>.
</div>

### Aim

This guide defines how a **structured cancer pathology report** is shared with
FHIR, so that its findings can be used by other systems involved in a patient's
cancer care - for example a genomics laboratory receiving a reflex order, the
clinical team, and the patient's electronic patient record.

Its aim is similar to the HL7 US
[Cancer Pathology Data Sharing](https://hl7.org/fhir/us/cancer-reporting/index.html)
IG, but the **recipient is not the cancer registry**. In England the cancer
registry - the National Disease Registration Service (NDRS) - is instead the
**primary source of the requirements**: its
[COSD Pathology](https://nhsd-proxy.openprescribing.net/ndrs/data/data-sets/cosd/cosd-pathology-user-guide-v5.0/core---pathology)
dataset defines the content that pathology laboratories already collect for every
registrable cancer report. Registry submission itself (monthly COSD XML) is out of
scope.

#### Why not use registry data?

Registry data is built for audit, research and national statistics, not for
use while a patient is on the pathway:

| Stage | When it is available |
|---|---|
| COSD submission by the trust to NDRS | Monthly, around a month after diagnosis |
| [Rapid Cancer Registration Data](https://www.natcan.org.uk/?p=1906) | Around 4 to 5 months after diagnosis, at lower quality - it does not match the eventual official statistics |
| [Full cancer registration](https://www.natcan.org.uk/?p=1906) | Around 18 to 24 months after the diagnosis cohort |
| [Official statistics](https://nhsd-proxy.openprescribing.net/data-and-information/publications/statistical/cancer-registration-statistics/england-2023) | Around two years - for example 2023 diagnoses from an August 2025 data snapshot |
{:.grid}

The delay is deliberate: it lets registration add treatment and other
submissions and check the data. But the clinical team, the MDT and a genomics
laboratory need the report within days of it being authorised. So this guide
uses COSD to define the **content**, and shares it directly from the pathology
laboratory when the report is issued - see the [Cancer Pathway](CancerPathway.html).

### Content

- [Cancer Pathology Report](PathologyReport.html) - the report's domain archetype
  and detailed model, with COSD, HL7 v2 and FHIR mappings
- [Pathology Report](StructureDefinition-PathologyReport.html) - logical model of the
  COSD Pathology (v5) **Core - Pathology** content, with an entity relationship
  diagram and mappings to COSD and to the profiles in this guide
- [Profiles](profiles.html) - FHIR profiles for that content, built on HL7 Europe
  Base and HL7 Europe Laboratory, and aligned with mCODE where mCODE has an
  equivalent profile

### Sources

| Source | Version | Used for |
|---|---|---|
| [COSD Pathology](https://nhsd-proxy.openprescribing.net/ndrs/data/data-sets/cosd/cosd-pathology-user-guide-v5.0/core---pathology) - National Disease Registration Service, NHS England | v5 | **Primary source of requirements** - the data items and their national codes (`pCR` items) |
| [HL7 Europe Base](https://hl7.eu/fhir/base/) | 2.0.1 | Base profiles: `condition-eu-core`, `patient-eu-core` |
| [HL7 Europe Laboratory Report](https://hl7.eu/fhir/laboratory/) | 2.1.0 | Base profiles: `DiagnosticReport-eu-lab`, `Observation-resultslab-eu-lab`, `Specimen-eu-lab` |
| [mCODE (minimal Common Oncology Data Elements)](https://hl7.org/fhir/us/mcode/) | 4.0.0 (STU4) | Profile structure and names where the content matches: Primary Cancer Condition, Histologic Behavior and Type, Histologic Grade, Tumor Size, TNM categories and stage group, Tumor Marker Test, Human Specimen |
| [HL7 US Cancer Pathology Data Sharing](https://hl7.org/fhir/us/cancer-reporting/index.html) | 2.0.0 (STU2) | The overall aim and the pathology Diagnostic Report pattern |
| [HL7 Europe Common Cancer Model](https://build.fhir.org/ig/hl7-eu/cancer-common/) | 1.0.0-ballot | European cancer diagnosis model (`CancerConditionAtDiagnosis`) |
| [Royal College of Pathologists cancer datasets](https://www.rcpath.org/profession/guidelines/cancer-datasets-and-tissue-pathways.html) | - | COSD Pathology v5 is aligned with the RCPath core datasets |
| [NAACCR Volume V - Laboratory Electronic Pathology Reporting](https://www.naaccr.org/pathology-laboratory-electronic-reporting/) | 5.1 | HL7 v2.5.1 `ORU_R01` structure for cancer pathology, applied by analogy - see [LAB-3](LAB-3.html) |
| [LOINC](https://loinc.org/) | 2.83 | Observation codes, checked on tx.fhir.org |
{:.grid}

### Related

- [Pathology to Genomics Reflex](https://nw-gmsa.github.io/use-cases/PathologyToGenomicsReflex.html) -
  the use case that uses this report as the pathology report semantics of a reflex order
- [NHS North West Genomics FHIR IG](https://nw-gmsa.github.io/en/)
