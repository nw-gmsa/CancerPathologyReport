Logical:        PathologyReport
Id:             PathologyReport
Title:          "Pathology Report"
Description:    """
**Proof of concept - not an authoritative source.**

The structured content of a cancer pathology report, based only on the
[COSD Pathology](https://nhsd-proxy.openprescribing.net/ndrs/data/data-sets/cosd/cosd-pathology-user-guide-v5.0/core---pathology)
(v5) **Core - Pathology** section - the items applicable to most tumour sites.
Tumour site specific COSD Pathology sections are not included.

Defined nationally by the National Disease Registration Service for reports
sent to the cancer registry. Used here as the pathology report semantics a
genomics laboratory needs alongside a reflex order - see [Pathology to Genomics
Reflex](https://nw-gmsa.github.io/use-cases/PathologyToGenomicsReflex.html).
Each element's COSD data item is shown on the **Mappings** tab.
"""
Characteristics: #can-be-target

// General report information

* ^experimental = true
* reportIdentifier 0..1 Identifier "Service Report Identifier" "Unique identifier of the pathology report (pCR0950)"
* observationReportIdentifier 0..1 Identifier "Pathology Observation Report Identifier" "Local identifier of the observation report (pCR6220)"
* reportStatus 1..1 CodeableConcept "Service Report Status" "1 Final, 2 Preliminary, 3 Test not available, 4 Unspecified, 5 Supplementary/second opinion, 6 Deleted (pCR0960)"
* investigationResultDate 0..1 date "Investigation Result Date" "Date the investigation was concluded, i.e. report authorised (pCR0780)"
* reportText 0..1 string "Pathology Report Text" "Full text of the pathology report (pCR1020)"

// Who requested and who reported

* requestedBy 0..1 BackboneElement "Pathology test requested by" "Consultant and site requesting the test"
  * consultant 0..1 Identifier "Consultant professional registration" "Issuer (pCR7100) and entry identifier (pCR7120), e.g. GMC number"
  * organisationSite 0..1 Identifier "Organisation Site Identifier (Test Requested By)" "ODS site code (pCR0980)"
* reportedBy 1..1 BackboneElement "Reported by" "Pathologist and laboratory reporting the test"
  * pathologist 0..1 Identifier "Pathologist professional registration" "Issuer (pCR7130) and entry identifier (pCR7140)"
  * organisation 1..1 Identifier "Organisation Identifier (Reporting Pathologist)" "ODS code of the reporting laboratory (pCR0800)"

// Sample and specimen

* specimen 1..1 BackboneElement "Specimen" "The sample reported on"
  * collectionDate 0..1 date "Sample Collection Date" "When the sample was taken (pCR1010)"
  * receiptDate 0..1 date "Sample Receipt Date" "When the laboratory received the sample (pCR0770)"
  * specimenNature 1..1 CodeableConcept "Specimen Nature" "1 Primary tumour, 2 Further excision of primary tumour, 4 Regional lymph nodes, 5 Metastatic site other than regional lymph nodes, 9 Not known (pCR0970)"
  * investigationType 1..1 CodeableConcept "Pathology Investigation Type" "e.g. CY Cytology, BU Biopsy NOS, EX Excision, RE Radical excision, PB Punch biopsy (pCR0760)"

// Diagnosis

* diagnosis 1..1 BackboneElement "Diagnosis" "Coded diagnosis. At least one topography or morphology code is required"
  * snomedVersion 1..1 CodeableConcept "SNOMED Version (Pathology)" "01 SNOMED II, 02 SNOMED 3, 03 SNOMED 3.5, 04 SNOMED RT, 05 SNOMED CT, 99 Not known. Only SNOMED CT is licensed for use since April 2017 (pCR6990)"
  * topography 0..* CodeableConcept "Topography (SNOMED)" "Where the tumour is - SNOMED T code (pCR6410)"
  * morphology 0..* CodeableConcept "Morphology (SNOMED)" "Tumour type - SNOMED M code (pCR6420)"
  * icdDiagnosis 0..* CodeableConcept "Diagnosis (ICD Pathological)" "ICD-10 code (pCR0810)"

// Tumour

* tumour 1..1 BackboneElement "Tumour" "Tumour characteristics"
  * laterality 1..1 CodeableConcept "Tumour Laterality (Pathological)" "L Left, R Right, M Midline, B Bilateral, 8 Not applicable, 9 Not known (pCR0820)"
  * lesionSize 0..1 Quantity "Lesion Size (Pathological)" "Diameter in millimetres (pCR0830)"
  * grade 1..1 CodeableConcept "Grade of Differentiation (Pathological)" "GX Cannot assess, G1 Well, G2 Moderately, G3 Poorly differentiated, G4 Undifferentiated/anaplastic (pCR0860)"
  * vascularOrLymphaticInvasion 1..1 CodeableConcept "Cancer Vascular or Lymphatic Invasion" "e.g. NU No invasion, YU Yes, YV Vascular only, YL Lymphatic only, YB Both (pCR0870)"
  * perineuralInvasion 1..1 CodeableConcept "Perineural Invasion" "1 Present, 2 Not identified, 3 Uncertain, X Cannot assess, 8 Not applicable, 9 Not known (pCR1100)"
  * excisionMargin 1..1 CodeableConcept "Excision Margin" "Clear or involved, with distance band (pCR0880)"
  * circumferentialMargin 1..1 CodeableConcept "Excision Margin (Circumferential)" "0 Not involved, 1 Involved (<=1mm), 8 Not applicable, 9 Not known (pCR1150)"
  * synchronousTumour 1..1 CodeableConcept "Synchronous Tumour Indicator" "Y Present, N Not present, 9 Not known (pCR0840)"

// Lymph nodes

* lymphNodes 0..1 BackboneElement "Lymph nodes" "Lymph node assessment"
  * examined 0..1 integer "Number of Nodes Examined" "pCR0890"
  * positive 0..1 integer "Number of Nodes Positive" "pCR0900"
  * sentinelExamined 0..1 integer "Sentinel Lymph Nodes Examined Number" "pCR1110"
  * sentinelPositive 0..1 integer "Sentinel Lymph Nodes Positive Number" "pCR1120"
  * completionExamined 0..1 integer "Post SLNB Completion Lymphadenectomy - Nodes Examined" "pCR1130"
  * completionPositive 0..1 integer "Post SLNB Completion Lymphadenectomy - Nodes Positive" "pCR1140"

// Pathological TNM stage

* stage 0..1 BackboneElement "Pathological TNM stage" "Pathological TNM stage"
  * codingEdition 1..1 CodeableConcept "TNM Coding Edition" "1 UICC, 2 AJCC, 3 ENETS (pCR6980)"
  * version 0..1 string "TNM Version Number (Pathological)" "pCR6820"
  * t 0..1 CodeableConcept "T Category (Pathological)" "Primary tumour (pCR0910)"
  * n 0..1 CodeableConcept "N Category (Pathological)" "Regional lymph nodes (pCR0920)"
  * m 0..1 CodeableConcept "M Category (Pathological)" "Distant metastases (pCR0930)"
  * stageGrouping 0..1 CodeableConcept "TNM Stage Grouping (Pathological)" "pCR0940"
  * neoadjuvantTherapy 1..1 CodeableConcept "Neoadjuvant Therapy Indicator" "Y Yes, N No, 9 Not known - whether the stage is after treatment given before surgery (pCR1000)"

// Biomarkers

* ki67 0..1 BackboneElement "Ki-67" "Measure of how fast tumour cells are dividing"
  * indicator 1..1 CodeableConcept "Ki-67 Indicator" "1 Done and available, 2 Done but not available, 3 Not done, 9 Not known (pCR7000)"
  * result 0..1 Quantity "Ki-67 Result" "Percentage of positive tumour cells, 0-100 (pCR7010)"
* mmrImmunohistochemistry 0..1 BackboneElement "Mismatch repair (MMR) IHC" """
Mismatch repair protein expression by immunohistochemistry. Loss of expression
is the trigger for the Lynch syndrome reflex order. Each result is Y Yes, N No,
E Equivocal, F Test failed, X Not performed.
"""
  * mlh1 1..1 CodeableConcept "MLH1 Nuclear Expression Intact" "pCR7020"
  * pms2 1..1 CodeableConcept "PMS2 Nuclear Expression Intact" "pCR7030"
  * msh2 1..1 CodeableConcept "MSH2 Nuclear Expression Intact" "pCR7040"
  * msh6 1..1 CodeableConcept "MSH6 Nuclear Expression Intact" "pCR7050"

// Terminology bindings

* reportStatus from COSDServiceReportStatus (required)
* specimen.specimenNature from COSDSpecimenNature (required)
* specimen.investigationType from COSDPathologyInvestigationType (required)
* diagnosis.snomedVersion from COSDSnomedVersion (required)
* diagnosis.topography from CancerTopography (extensible)
* diagnosis.morphology from CancerMorphology (extensible)
* diagnosis.icdDiagnosis from CancerDiagnosis (extensible)
* tumour.laterality from COSDTumourLaterality (required)
* tumour.grade from COSDGradeOfDifferentiation (required)
* tumour.vascularOrLymphaticInvasion from COSDVascularOrLymphaticInvasion (required)
* tumour.perineuralInvasion from COSDPerineuralInvasion (required)
* tumour.excisionMargin from COSDExcisionMargin (required)
* tumour.circumferentialMargin from COSDCircumferentialMargin (required)
* tumour.synchronousTumour from COSDSynchronousTumourIndicator (required)
* stage.codingEdition from COSDTNMCodingEdition (required)
* stage.neoadjuvantTherapy from COSDNeoadjuvantTherapyIndicator (required)
* ki67.indicator from COSDKi67Indicator (required)
* mmrImmunohistochemistry.mlh1 from COSDNuclearExpressionIntact (required)
* mmrImmunohistochemistry.pms2 from COSDNuclearExpressionIntact (required)
* mmrImmunohistochemistry.msh2 from COSDNuclearExpressionIntact (required)
* mmrImmunohistochemistry.msh6 from COSDNuclearExpressionIntact (required)

Mapping:        PathologyReport-COSD
Source:         PathologyReport
Target:         "https://www.ndrs.nhs.uk/cosd-pathology"
Id:             cosd-pathology
Title:          "COSD Pathology v5"
* reportIdentifier -> "pCR0950 Service Report Identifier"
* observationReportIdentifier -> "pCR6220 Pathology Observation Report Identifier"
* reportStatus -> "pCR0960 Service Report Status"
* investigationResultDate -> "pCR0780 Investigation Result Date"
* reportText -> "pCR1020 Pathology Report Text"
* requestedBy.consultant -> "pCR7100 / pCR7120 Professional Registration (Pathology Test Requested By)"
* requestedBy.organisationSite -> "pCR0980 Organisation Site Identifier (Pathology Test Requested By)"
* reportedBy.pathologist -> "pCR7130 / pCR7140 Professional Registration (Pathologist)"
* reportedBy.organisation -> "pCR0800 Organisation Identifier (Reporting Pathologist)"
* specimen.collectionDate -> "pCR1010 Sample Collection Date"
* specimen.receiptDate -> "pCR0770 Sample Receipt Date"
* specimen.specimenNature -> "pCR0970 Specimen Nature"
* specimen.investigationType -> "pCR0760 Pathology Investigation Type"
* diagnosis.snomedVersion -> "pCR6990 SNOMED Version (Pathology)"
* diagnosis.topography -> "pCR6410 Topography (SNOMED) Pathology"
* diagnosis.morphology -> "pCR6420 Morphology (SNOMED) Pathology"
* diagnosis.icdDiagnosis -> "pCR0810 Diagnosis (ICD Pathological)"
* tumour.laterality -> "pCR0820 Tumour Laterality (Pathological)"
* tumour.lesionSize -> "pCR0830 Lesion Size (Pathological)"
* tumour.grade -> "pCR0860 Grade of Differentiation (Pathological)"
* tumour.vascularOrLymphaticInvasion -> "pCR0870 Cancer Vascular or Lymphatic Invasion"
* tumour.perineuralInvasion -> "pCR1100 Perineural Invasion"
* tumour.excisionMargin -> "pCR0880 Excision Margin"
* tumour.circumferentialMargin -> "pCR1150 Excision Margin (Circumferential)"
* tumour.synchronousTumour -> "pCR0840 Synchronous Tumour Indicator"
* lymphNodes.examined -> "pCR0890 Number of Nodes Examined"
* lymphNodes.positive -> "pCR0900 Number of Nodes Positive"
* lymphNodes.sentinelExamined -> "pCR1110 Sentinel Lymph Nodes Examined Number"
* lymphNodes.sentinelPositive -> "pCR1120 Sentinel Lymph Nodes Positive Number"
* lymphNodes.completionExamined -> "pCR1130 Post SLNB Completion Lymphadenectomy - Nodes Examined Number"
* lymphNodes.completionPositive -> "pCR1140 Post SLNB Completion Lymphadenectomy - Nodes Positive Number"
* stage.codingEdition -> "pCR6980 TNM Coding Edition"
* stage.version -> "pCR6820 TNM Version Number (Pathological)"
* stage.t -> "pCR0910 T Category (Pathological)"
* stage.n -> "pCR0920 N Category (Pathological)"
* stage.m -> "pCR0930 M Category (Pathological)"
* stage.stageGrouping -> "pCR0940 TNM Stage Grouping (Pathological)"
* stage.neoadjuvantTherapy -> "pCR1000 Neoadjuvant Therapy Indicator"
* ki67.indicator -> "pCR7000 Ki-67 Indicator"
* ki67.result -> "pCR7010 Ki-67 Result"
* mmrImmunohistochemistry.mlh1 -> "pCR7020 MLH1 Nuclear Expression Intact"
* mmrImmunohistochemistry.pms2 -> "pCR7030 PMS2 Nuclear Expression Intact"
* mmrImmunohistochemistry.msh2 -> "pCR7040 MSH2 Nuclear Expression Intact"
* mmrImmunohistochemistry.msh6 -> "pCR7050 MSH6 Nuclear Expression Intact"

Mapping:        PathologyReport-FHIR
Source:         PathologyReport
Target:         "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport"
Id:             fhir
Title:          "FHIR (this IG)"
* -> "CancerPathologyDiagnosticReport"
* reportIdentifier -> "CancerPathologyDiagnosticReport.identifier"
* reportStatus -> "CancerPathologyDiagnosticReport.status"
* investigationResultDate -> "CancerPathologyDiagnosticReport.issued"
* reportText -> "CancerPathologyDiagnosticReport.presentedForm"
* requestedBy -> "ServiceRequest.requester (PractitionerRole)"
* reportedBy -> "CancerPathologyDiagnosticReport.performer (PractitionerRole, Organization)"
* specimen -> "CancerPathologySpecimen"
* specimen.collectionDate -> "CancerPathologySpecimen.collection.collectedDateTime"
* specimen.receiptDate -> "CancerPathologySpecimen.receivedTime"
* specimen.specimenNature -> "CancerPathologySpecimen.type"
* specimen.investigationType -> "CancerPathologySpecimen.collection.method"
* diagnosis -> "PrimaryCancerCondition"
* diagnosis.topography -> "PrimaryCancerCondition.bodySite"
* diagnosis.morphology -> "HistologicBehaviorAndType.valueCodeableConcept"
* diagnosis.icdDiagnosis -> "PrimaryCancerCondition.code"
* tumour.laterality -> "PrimaryCancerCondition.bodySite (laterality qualifier)"
* tumour.lesionSize -> "TumorSize"
* tumour.grade -> "HistologicGrade"
* tumour.vascularOrLymphaticInvasion -> "Observation-resultslab-eu-lab (no mCODE profile)"
* tumour.perineuralInvasion -> "Observation-resultslab-eu-lab (no mCODE profile)"
* tumour.excisionMargin -> "Observation-resultslab-eu-lab (no mCODE profile)"
* tumour.circumferentialMargin -> "Observation-resultslab-eu-lab (no mCODE profile)"
* tumour.synchronousTumour -> "Observation-resultslab-eu-lab (no mCODE profile)"
* lymphNodes -> "Observation-resultslab-eu-lab (no mCODE profile)"
* stage.codingEdition -> "TNM profiles .method"
* stage.version -> "TNM profiles .method"
* stage.t -> "TNMPrimaryTumorCategory"
* stage.n -> "TNMRegionalNodesCategory"
* stage.m -> "TNMDistantMetastasesCategory"
* stage.stageGrouping -> "TNMStageGroup"
* stage.neoadjuvantTherapy -> "TNMStageGroup.extension[neoadjuvantTherapy]"
* ki67 -> "TumorMarkerTest (LOINC 29593-1)"
* mmrImmunohistochemistry.mlh1 -> "TumorMarkerTest (LOINC 81691-8)"
* mmrImmunohistochemistry.pms2 -> "TumorMarkerTest (LOINC 81694-2)"
* mmrImmunohistochemistry.msh2 -> "TumorMarkerTest (LOINC 81692-6)"
* mmrImmunohistochemistry.msh6 -> "TumorMarkerTest (LOINC 81693-4)"
