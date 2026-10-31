Alias: $loinc = http://loinc.org
Alias: $EuPatient = http://hl7.eu/fhir/base/StructureDefinition/patient-eu-core

RuleSet: CancerPathologyObservation
* status MS
* subject 1..1 MS
* subject only Reference($EuPatient)
* specimen MS
* specimen only Reference(CancerPathologySpecimen)
* effective[x] MS
* performer MS

// Report and specimen

Profile:        CancerPathologyDiagnosticReport
Parent:         http://hl7.eu/fhir/laboratory/StructureDefinition/DiagnosticReport-eu-lab
Id:             CancerPathologyDiagnosticReport
Title:          "Cancer Pathology Diagnostic Report"
Description:    """
A cancer pathology report, carrying the COSD Pathology core content as coded
results. Based on HL7 Europe Laboratory `DiagnosticReport-eu-lab`. Plays the same
role as the US Pathology Diagnostic Report in the HL7 US Cancer Pathology Data
Sharing IG; mCODE has no equivalent profile.
"""
* identifier MS
* identifier ^short = "Service Report Identifier (pCR0950)"
* status MS
* status ^short = "Service Report Status (pCR0960)"
* subject 1..1 MS
* subject only Reference($EuPatient)
* issued MS
* issued ^short = "Investigation Result Date (pCR0780)"
* performer MS
* performer ^short = "Reporting pathologist (pCR7130/pCR7140) and laboratory (pCR0800)"
* specimen MS
* specimen only Reference(CancerPathologySpecimen)
* result MS
* result only Reference(HistologicBehaviorAndType or HistologicGrade or TumorSize or TNMPrimaryTumorCategory or TNMRegionalNodesCategory or TNMDistantMetastasesCategory or TNMStageGroup or TumorMarkerTest or http://hl7.eu/fhir/laboratory/StructureDefinition/Observation-resultslab-eu-lab)
* result ^short = "Coded results. COSD items without an mCODE profile (invasion, margins, lymph nodes, synchronous tumour) use Observation-resultslab-eu-lab"
* presentedForm MS
* presentedForm ^short = "Pathology Report Text (pCR1020)"

Profile:        CancerPathologySpecimen
Parent:         http://hl7.eu/fhir/laboratory/StructureDefinition/Specimen-eu-lab
Id:             CancerPathologySpecimen
Title:          "Cancer Pathology Specimen"
Description:    """
The specimen a cancer pathology report is about. Based on HL7 Europe Laboratory
`Specimen-eu-lab`, aligned with the mCODE [Human Specimen](https://hl7.org/fhir/us/mcode/StructureDefinition-mcode-human-specimen.html) profile.
"""
* identifier MS
* type MS
* type ^short = "Specimen Nature (pCR0970) - primary tumour, lymph node, metastatic site"
* subject 1..1 MS
* subject only Reference($EuPatient)
* receivedTime MS
* receivedTime ^short = "Sample Receipt Date (pCR0770)"
* collection MS
* collection.collected[x] MS
* collection.collected[x] ^short = "Sample Collection Date (pCR1010)"
* collection.method MS
* collection.method ^short = "Pathology Investigation Type (pCR0760) - biopsy, excision, cytology"
* collection.bodySite MS
* collection.bodySite ^short = "Topography (SNOMED) (pCR6410)"

// Diagnosis

Profile:        PrimaryCancerCondition
Parent:         http://hl7.eu/fhir/base/StructureDefinition/condition-eu-core
Id:             PrimaryCancerCondition
Title:          "Primary Cancer Condition"
Description:    """
The cancer diagnosis recorded by the pathology report. Based on HL7 Europe Base
`condition-eu-core`, aligned with the mCODE [Primary Cancer Condition](https://hl7.org/fhir/us/mcode/StructureDefinition-mcode-primary-cancer-condition.html)
profile and the HL7 Europe Common Cancer Model `CancerConditionAtDiagnosis`.
"""
* code MS
* code ^short = "Diagnosis (ICD Pathological) (pCR0810), or SNOMED CT"
* bodySite MS
* bodySite ^short = "Topography (SNOMED) (pCR6410), with Tumour Laterality (pCR0820)"
* subject MS
* subject only Reference($EuPatient)
* stage MS
* stage.assessment only Reference(TNMStageGroup)
* evidence MS
* evidence.detail ^short = "Supporting findings, e.g. Histologic Behavior and Type, Histologic Grade"

Profile:        HistologicBehaviorAndType
Parent:         http://hl7.eu/fhir/laboratory/StructureDefinition/Observation-resultslab-eu-lab
Id:             HistologicBehaviorAndType
Title:          "Histologic Behavior and Type"
Description:    """
Tumour morphology - histological type and behaviour. Aligned with the mCODE
[Histologic Behavior and Type](https://hl7.org/fhir/us/mcode/StructureDefinition-mcode-histologic-behavior-and-type.html) profile.
COSD Morphology (SNOMED) (pCR6420).
"""
* insert CancerPathologyObservation
* code = $loinc#31206-6 "Behavior ICD-O-3 Cancer"
* value[x] 1..1 MS
* value[x] only CodeableConcept
* value[x] ^short = "Morphology (SNOMED CT morphologic abnormality) (pCR6420)"

Profile:        HistologicGrade
Parent:         http://hl7.eu/fhir/laboratory/StructureDefinition/Observation-resultslab-eu-lab
Id:             HistologicGrade
Title:          "Histologic Grade"
Description:    """
Histological grade of the tumour. Aligned with the mCODE
[Histologic Grade](https://hl7.org/fhir/us/mcode/StructureDefinition-mcode-histologic-grade.html) profile.
mCODE codes this with NCI Thesaurus C18000; LOINC is used here. COSD Grade of
Differentiation (Pathological) (pCR0860).
"""
* insert CancerPathologyObservation
* code = $loinc#33732-9 "Histology grade [Identifier] in Cancer specimen"
* value[x] 1..1 MS
* value[x] only CodeableConcept
* value[x] ^short = "GX, G1, G2, G3, G4 (pCR0860)"
* method MS
* method ^short = "Grading system, where site specific"

Profile:        TumorSize
Parent:         http://hl7.eu/fhir/laboratory/StructureDefinition/Observation-resultslab-eu-lab
Id:             TumorSize
Title:          "Tumor Size"
Description:    """
Size of the tumour. Aligned with the mCODE
[Tumor Size](https://hl7.org/fhir/us/mcode/StructureDefinition-mcode-tumor-size.html) profile.
COSD Lesion Size (Pathological) (pCR0830).
"""
* insert CancerPathologyObservation
* code = $loinc#21889-1 "Size Tumor"
* value[x] 1..1 MS
* value[x] only Quantity
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #mm
* value[x] ^short = "Lesion diameter in millimetres (pCR0830)"

// Pathological TNM stage

RuleSet: TNMObservation
* insert CancerPathologyObservation
* method 1..1 MS
* method ^short = "TNM Coding Edition (pCR6980) - UICC, AJCC or ENETS - and TNM Version Number (pCR6820)"
* value[x] 1..1 MS
* value[x] only CodeableConcept

Profile:        TNMPrimaryTumorCategory
Parent:         http://hl7.eu/fhir/laboratory/StructureDefinition/Observation-resultslab-eu-lab
Id:             TNMPrimaryTumorCategory
Title:          "TNM Primary Tumor Category"
Description:    """
Pathological T category. Aligned with the mCODE
[TNM Primary Tumor Category](https://hl7.org/fhir/us/mcode/StructureDefinition-mcode-tnm-primary-tumor-category.html) profile,
restricted to the pathological code. COSD T Category (Pathological) (pCR0910).
"""
* insert TNMObservation
* code = $loinc#21899-0 "Primary tumor.pathology Cancer"

Profile:        TNMRegionalNodesCategory
Parent:         http://hl7.eu/fhir/laboratory/StructureDefinition/Observation-resultslab-eu-lab
Id:             TNMRegionalNodesCategory
Title:          "TNM Regional Nodes Category"
Description:    """
Pathological N category. Aligned with the mCODE
[TNM Regional Nodes Category](https://hl7.org/fhir/us/mcode/StructureDefinition-mcode-tnm-regional-nodes-category.html) profile,
restricted to the pathological code. COSD N Category (Pathological) (pCR0920).
"""
* insert TNMObservation
* code = $loinc#21900-6 "Regional lymph nodes.pathology [Class] Cancer"

Profile:        TNMDistantMetastasesCategory
Parent:         http://hl7.eu/fhir/laboratory/StructureDefinition/Observation-resultslab-eu-lab
Id:             TNMDistantMetastasesCategory
Title:          "TNM Distant Metastases Category"
Description:    """
Pathological M category. Aligned with the mCODE
[TNM Distant Metastases Category](https://hl7.org/fhir/us/mcode/StructureDefinition-mcode-tnm-distant-metastases-category.html) profile,
restricted to the pathological code. COSD M Category (Pathological) (pCR0930).
"""
* insert TNMObservation
* code = $loinc#21901-4 "Distant metastases.pathology [Class] Cancer"

Profile:        TNMStageGroup
Parent:         http://hl7.eu/fhir/laboratory/StructureDefinition/Observation-resultslab-eu-lab
Id:             TNMStageGroup
Title:          "TNM Stage Group"
Description:    """
Pathological TNM stage group. Aligned with the mCODE
[TNM Stage Group](https://hl7.org/fhir/us/mcode/StructureDefinition-mcode-tnm-stage-group.html) profile,
restricted to the pathological code. COSD TNM Stage Grouping (Pathological) (pCR0940).
"""
* insert TNMObservation
* code = $loinc#21902-2 "Stage group.pathology Cancer"
* hasMember MS
* hasMember only Reference(TNMPrimaryTumorCategory or TNMRegionalNodesCategory or TNMDistantMetastasesCategory)
* extension contains NeoadjuvantTherapyIndicator named neoadjuvantTherapy 0..1 MS

Extension:      NeoadjuvantTherapyIndicator
Id:             NeoadjuvantTherapyIndicator
Title:          "Neoadjuvant Therapy Indicator"
Description:    "Whether the stage was recorded after treatment given before surgery. COSD Neoadjuvant Therapy Indicator (pCR1000). No mCODE equivalent."
Context:        Observation
* value[x] only CodeableConcept

// Biomarkers

Profile:        TumorMarkerTest
Parent:         http://hl7.eu/fhir/laboratory/StructureDefinition/Observation-resultslab-eu-lab
Id:             TumorMarkerTest
Title:          "Tumor Marker Test"
Description:    """
Result of a tumour marker test by immunohistochemistry (IHC). Aligned with the
mCODE [Tumor Marker Test](https://hl7.org/fhir/us/mcode/StructureDefinition-mcode-tumor-marker-test.html) profile.
Covers the COSD Pathology core biomarkers: Ki-67 (pCR7000/pCR7010) and mismatch
repair (MMR) protein expression (pCR7020-pCR7050). Loss of MMR expression is the
trigger for the Lynch syndrome reflex order to genomics.
"""
* insert CancerPathologyObservation
* code from CancerPathologyTumorMarkerTest (extensible)
* value[x] 1..1 MS
* value[x] only CodeableConcept or Quantity
* value[x] ^short = "MMR: nuclear expression intact Y/N/E (equivocal)/F (failed); Ki-67: % of positive tumour cells"
* dataAbsentReason ^short = "Ki-67 done but not available, or not done (pCR7000); MMR test not performed"

ValueSet:       CancerPathologyTumorMarkerTest
Id:             CancerPathologyTumorMarkerTest
Title:          "Cancer Pathology Tumor Marker Test"
Description:    "Tumour marker tests in COSD Pathology core."
* $loinc#29593-1 "Cells.Ki-67 nuclear Ag/cells in Tissue by Immune stain"
* $loinc#81691-8 "MLH-1 Ag [Presence] in Cancer specimen by Immune stain"
* $loinc#81694-2 "PMS2 Ag [Presence] in Cancer specimen by Immune stain"
* $loinc#81692-6 "MSH-2 Ag [Presence] in Cancer specimen by Immune stain"
* $loinc#81693-4 "MSH-6 Ag [Presence] in Cancer specimen by Immune stain"
