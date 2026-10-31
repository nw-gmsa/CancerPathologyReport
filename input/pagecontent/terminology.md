COSD Pathology does not publish FHIR terminology. This guide defines it from
the [COSD Pathology User Guide v5](https://nhsd-proxy.openprescribing.net/ndrs/data/data-sets/cosd/cosd-pathology-user-guide-v5.0/core---pathology).

### COSD national codes

Each COSD coded data item has a CodeSystem holding its national codes, and a
ValueSet of all those codes. The [logical model](StructureDefinition-PathologyReport.html)
binds to them as **required**; the profiles bind to them as **extensible** or
**preferred**, so SNOMED CT or other codes can also be used.

| COSD item | ValueSet |
|---|---|
| pCR0960 Service Report Status | [COSD Service Report Status](ValueSet-cosd-service-report-status.html) |
| pCR0970 Specimen Nature | [COSD Specimen Nature](ValueSet-cosd-specimen-nature.html) |
| pCR0760 Pathology Investigation Type | [COSD Pathology Investigation Type](ValueSet-cosd-pathology-investigation-type.html) |
| pCR6990 SNOMED Version | [COSD SNOMED Version](ValueSet-cosd-snomed-version.html) |
| pCR0820 Tumour Laterality | [COSD Tumour Laterality](ValueSet-cosd-tumour-laterality.html) |
| pCR0860 Grade of Differentiation | [COSD Grade of Differentiation](ValueSet-cosd-grade-of-differentiation.html) |
| pCR0870 Cancer Vascular or Lymphatic Invasion | [COSD Cancer Vascular or Lymphatic Invasion](ValueSet-cosd-vascular-or-lymphatic-invasion.html) |
| pCR1100 Perineural Invasion | [COSD Perineural Invasion](ValueSet-cosd-perineural-invasion.html) |
| pCR0880 Excision Margin | [COSD Excision Margin](ValueSet-cosd-excision-margin.html) |
| pCR1150 Excision Margin (Circumferential) | [COSD Excision Margin (Circumferential)](ValueSet-cosd-circumferential-margin.html) |
| pCR0840 Synchronous Tumour Indicator | [COSD Synchronous Tumour Indicator](ValueSet-cosd-synchronous-tumour-indicator.html) |
| pCR6980 TNM Coding Edition | [COSD TNM Coding Edition](ValueSet-cosd-tnm-coding-edition.html) |
| pCR1000 Neoadjuvant Therapy Indicator | [COSD Neoadjuvant Therapy Indicator](ValueSet-cosd-neoadjuvant-therapy-indicator.html) |
| pCR7000 Ki-67 Indicator | [COSD Ki-67 Indicator](ValueSet-cosd-ki67-indicator.html) |
| pCR7020-pCR7050 MLH1, PMS2, MSH2, MSH6 Nuclear Expression Intact | [COSD Nuclear Expression Intact](ValueSet-cosd-nuclear-expression-intact.html) |
{:.grid}

### SNOMED CT and ICD-10

COSD allows any SNOMED code for topography and morphology, with the edition
given in pCR6990. These value sets cover **SNOMED CT** only (pCR6990 = 05); legacy
SNOMED II/3/RT T and M codes are not included.

| COSD item | ValueSet | Definition |
|---|---|---|
| pCR6410 Topography (SNOMED) | [Cancer Topography](ValueSet-cancer-topography.html) | SNOMED CT is-a 442083009 Anatomical or acquired body structure (as FHIR core body-site) |
| pCR6420 Morphology (SNOMED) | [Cancer Morphology](ValueSet-cancer-morphology.html) | SNOMED CT is-a 400177003 Neoplasm and/or hamartoma (morphologic abnormality) |
| pCR0810 Diagnosis (ICD Pathological) | [Cancer Diagnosis](ValueSet-cancer-diagnosis.html) | ICD-10, plus SNOMED CT is-a 55342001 Neoplastic disease |
{:.grid}

### LOINC

| Use | ValueSet |
|---|---|
| Tumour marker tests - Ki-67 and MMR IHC | [Cancer Pathology Tumor Marker Test](ValueSet-CancerPathologyTumorMarkerTest.html) |
{:.grid}

The other LOINC codes are fixed in their profiles - see [Profiles](profiles.html).
