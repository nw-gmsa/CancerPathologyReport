// SNOMED CT value sets for COSD Pathology coded items.
// COSD publishes no SNOMED value sets; these use SNOMED CT hierarchies (intensional value sets).

Alias: $sct = http://snomed.info/sct

ValueSet:       CancerTopography
Id:             cancer-topography
Title:          "Cancer Topography (SNOMED CT)"
Description:    """
Where the tumour is. All SNOMED CT anatomical or acquired body structures - the
same hierarchy as the FHIR core [SNOMED CT Body Structures](http://hl7.org/fhir/R4/valueset-body-site.html)
value set. COSD Pathology Topography (SNOMED) (pCR6410), for data recorded with
SNOMED CT (pCR6990 = 05). Legacy SNOMED II/3/RT T codes are not included.
"""
* ^status = #draft
* ^experimental = false
* include codes from system $sct where concept is-a #442083009 "Anatomical or acquired body structure"

ValueSet:       CancerMorphology
Id:             cancer-morphology
Title:          "Cancer Morphology (SNOMED CT)"
Description:    """
The tumour type (histology and behaviour). All SNOMED CT neoplasm morphologic
abnormalities. COSD Pathology Morphology (SNOMED) (pCR6420), for data recorded with
SNOMED CT (pCR6990 = 05). Legacy SNOMED II/3/RT M codes are not included.
"""
* ^status = #draft
* ^experimental = false
* include codes from system $sct where concept is-a #400177003 "Neoplasm and/or hamartoma"

ValueSet:       CancerDiagnosis
Id:             cancer-diagnosis
Title:          "Cancer Diagnosis"
Description:    """
The pathological diagnosis. COSD Pathology Diagnosis (ICD Pathological) (pCR0810)
is ICD-10; SNOMED CT neoplastic disease concepts can be sent alongside.
"""
* ^status = #draft
* ^experimental = false
* include codes from system http://hl7.org/fhir/sid/icd-10
* include codes from system $sct where concept is-a #55342001 "Neoplastic disease"
