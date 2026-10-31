// COSD Pathology (v5) Core - Pathology national codes.
// Codes and descriptions from the COSD Pathology User Guide v5 (National Disease Registration Service).

RuleSet: COSDCodeSystem(item)
* ^status = #draft
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* ^copyright = "Codes from the Cancer Outcomes and Services Data Set (COSD) Pathology, National Disease Registration Service, NHS England. COSD data item {item}."

RuleSet: COSDValueSet
* ^status = #draft
* ^experimental = false

// Service Report Status (pCR0960)

CodeSystem:     COSDServiceReportStatusCS
Id:             cosd-service-report-status
Title:          "COSD Service Report Status"
Description:    "Status of the pathology report. COSD Pathology Service Report Status (pCR0960)."
* insert COSDCodeSystem(pCR0960)
* #1 "Final (complete)"
* #2 "Preliminary (interim)"
* #3 "Test not available"
* #4 "Unspecified"
* #5 "Supplementary report or second opinion"
* #6 "Deleted"

ValueSet:       COSDServiceReportStatus
Id:             cosd-service-report-status
Title:          "COSD Service Report Status"
Description:    "COSD Pathology Service Report Status (pCR0960)."
* insert COSDValueSet
* include codes from system COSDServiceReportStatusCS

// Specimen Nature (pCR0970)

CodeSystem:     COSDSpecimenNatureCS
Id:             cosd-specimen-nature
Title:          "COSD Specimen Nature"
Description:    "The nature of the specimen reported on. COSD Pathology Specimen Nature (pCR0970)."
* insert COSDCodeSystem(pCR0970)
* #1 "Primary tumour"
* #2 "Further excision of primary tumour"
* #4 "Regional lymph nodes"
* #5 "Metastatic site other than regional lymph nodes"
* #9 "Not known"

ValueSet:       COSDSpecimenNature
Id:             cosd-specimen-nature
Title:          "COSD Specimen Nature"
Description:    "COSD Pathology Specimen Nature (pCR0970)."
* insert COSDValueSet
* include codes from system COSDSpecimenNatureCS

// Pathology Investigation Type (pCR0760)

CodeSystem:     COSDPathologyInvestigationTypeCS
Id:             cosd-pathology-investigation-type
Title:          "COSD Pathology Investigation Type"
Description:    "How the specimen was obtained. COSD Pathology Investigation Type (pCR0760)."
* insert COSDCodeSystem(pCR0760)
* #CY "Cytology"
* #BU "Biopsy (not otherwise specified)"
* #EX "Excision"
* #PE "Partial excision"
* #RE "Radical excision"
* #FE "Further excision"
* #CU "Curettage"
* #SB "Shave biopsy"
* #PB "Punch biopsy"
* #IB "Incisional biopsy"
* #99 "Uncertain or other"

ValueSet:       COSDPathologyInvestigationType
Id:             cosd-pathology-investigation-type
Title:          "COSD Pathology Investigation Type"
Description:    "COSD Pathology Investigation Type (pCR0760)."
* insert COSDValueSet
* include codes from system COSDPathologyInvestigationTypeCS

// SNOMED Version (pCR6990)

CodeSystem:     COSDSnomedVersionCS
Id:             cosd-snomed-version
Title:          "COSD SNOMED Version"
Description:    "The version of SNOMED used for topography and morphology. Only SNOMED CT is licensed for use since April 2017. COSD Pathology SNOMED Version (pCR6990)."
* insert COSDCodeSystem(pCR6990)
* #01 "SNOMED II"
* #02 "SNOMED 3"
* #03 "SNOMED 3.5"
* #04 "SNOMED RT"
* #05 "SNOMED CT"
* #99 "Not known"

ValueSet:       COSDSnomedVersion
Id:             cosd-snomed-version
Title:          "COSD SNOMED Version"
Description:    "COSD Pathology SNOMED Version (pCR6990)."
* insert COSDValueSet
* include codes from system COSDSnomedVersionCS

// Tumour Laterality (pCR0820)

CodeSystem:     COSDTumourLateralityCS
Id:             cosd-tumour-laterality
Title:          "COSD Tumour Laterality"
Description:    "Which side of the body the tumour is on. COSD Pathology Tumour Laterality (Pathological) (pCR0820)."
* insert COSDCodeSystem(pCR0820)
* #L "Left"
* #R "Right"
* #M "Midline"
* #B "Bilateral"
* #8 "Not applicable"
* #9 "Not known"

ValueSet:       COSDTumourLaterality
Id:             cosd-tumour-laterality
Title:          "COSD Tumour Laterality"
Description:    "COSD Pathology Tumour Laterality (Pathological) (pCR0820)."
* insert COSDValueSet
* include codes from system COSDTumourLateralityCS

// Grade of Differentiation (pCR0860)

CodeSystem:     COSDGradeOfDifferentiationCS
Id:             cosd-grade-of-differentiation
Title:          "COSD Grade of Differentiation"
Description:    "Histological grade of the tumour. Site specific grades map to these general categories. COSD Pathology Grade of Differentiation (Pathological) (pCR0860)."
* insert COSDCodeSystem(pCR0860)
* #GX "Grade of differentiation is not appropriate or cannot be assessed"
* #G1 "Well differentiated"
* #G2 "Moderately differentiated"
* #G3 "Poorly differentiated"
* #G4 "Undifferentiated or anaplastic"

ValueSet:       COSDGradeOfDifferentiation
Id:             cosd-grade-of-differentiation
Title:          "COSD Grade of Differentiation"
Description:    "COSD Pathology Grade of Differentiation (Pathological) (pCR0860)."
* insert COSDValueSet
* include codes from system COSDGradeOfDifferentiationCS

// Cancer Vascular or Lymphatic Invasion (pCR0870)

CodeSystem:     COSDVascularOrLymphaticInvasionCS
Id:             cosd-vascular-or-lymphatic-invasion
Title:          "COSD Cancer Vascular or Lymphatic Invasion"
Description:    "Whether the cancer has invaded blood or lymph vessels. COSD Pathology Cancer Vascular or Lymphatic Invasion (pCR0870)."
* insert COSDCodeSystem(pCR0870)
* #NU "No - vascular or lymphatic invasion not present"
* #YU "Yes - vascular or lymphatic invasion present"
* #YV "Yes - vascular invasion only present"
* #YL "Yes - lymphatic invasion only present"
* #YB "Yes - both vascular and lymphatic invasion present"
* #UU "Uncertain whether vascular or lymphatic invasion is present"
* #XX "Cannot be assessed"
* #99 "Not known"

ValueSet:       COSDVascularOrLymphaticInvasion
Id:             cosd-vascular-or-lymphatic-invasion
Title:          "COSD Cancer Vascular or Lymphatic Invasion"
Description:    "COSD Pathology Cancer Vascular or Lymphatic Invasion (pCR0870)."
* insert COSDValueSet
* include codes from system COSDVascularOrLymphaticInvasionCS

// Perineural Invasion (pCR1100)

CodeSystem:     COSDPerineuralInvasionCS
Id:             cosd-perineural-invasion
Title:          "COSD Perineural Invasion"
Description:    "Whether the cancer has invaded the tissue around nerves. COSD Pathology Perineural Invasion (pCR1100)."
* insert COSDCodeSystem(pCR1100)
* #1 "Present"
* #2 "Not identified"
* #3 "Uncertain"
* #X "Cannot be assessed"
* #8 "Not applicable"
* #9 "Not known"

ValueSet:       COSDPerineuralInvasion
Id:             cosd-perineural-invasion
Title:          "COSD Perineural Invasion"
Description:    "COSD Pathology Perineural Invasion (pCR1100)."
* insert COSDValueSet
* include codes from system COSDPerineuralInvasionCS

// Excision Margin (pCR0880)

CodeSystem:     COSDExcisionMarginCS
Id:             cosd-excision-margin
Title:          "COSD Excision Margin"
Description:    "Whether the excision margin is clear of or involved by tumour. COSD Pathology Excision Margin (pCR0880)."
* insert COSDCodeSystem(pCR0880)
* #01 "Excision margin is clear (distance from margin not stated)"
* #02 "Excision margin is clear (tumour more than 5mm from margin)"
* #03 "Excision margin is clear (tumour more than 1mm and up to 5mm from margin)"
* #04 "Excision margin is clear (tumour less than 1mm from margin but does not reach it)"
* #05 "Excision margin is involved (tumour reaches the margin)"
* #06 "Uncertain"
* #07 "Excision margin is not involved (tumour 1mm or more from margin)"
* #08 "Excision margin is not involved (tumour less than 1mm from margin)"
* #09 "Excision margin is not involved (tumour 1mm to 5mm from margin)"
* #98 "Not applicable"
* #99 "Not known"

ValueSet:       COSDExcisionMargin
Id:             cosd-excision-margin
Title:          "COSD Excision Margin"
Description:    "COSD Pathology Excision Margin (pCR0880)."
* insert COSDValueSet
* include codes from system COSDExcisionMarginCS

// Excision Margin (Circumferential) (pCR1150)

CodeSystem:     COSDCircumferentialMarginCS
Id:             cosd-circumferential-margin
Title:          "COSD Excision Margin (Circumferential)"
Description:    "Whether the circumferential margin is involved. Involved means tumour 1mm or less from the margin. COSD Pathology Excision Margin (Circumferential) (pCR1150)."
* insert COSDCodeSystem(pCR1150)
* #0 "Not involved"
* #1 "Involved"
* #8 "Not applicable"
* #9 "Not known"

ValueSet:       COSDCircumferentialMargin
Id:             cosd-circumferential-margin
Title:          "COSD Excision Margin (Circumferential)"
Description:    "COSD Pathology Excision Margin (Circumferential) (pCR1150)."
* insert COSDValueSet
* include codes from system COSDCircumferentialMarginCS

// Synchronous Tumour Indicator (pCR0840) and Neoadjuvant Therapy Indicator (pCR1000) share Y/N/9

CodeSystem:     COSDYesNoNotKnownCS
Id:             cosd-yes-no-not-known
Title:          "COSD Yes No Not Known"
Description:    "Yes, no or not known. Used by COSD Pathology Synchronous Tumour Indicator (pCR0840) and Neoadjuvant Therapy Indicator (pCR1000)."
* insert COSDCodeSystem(pCR0840 and pCR1000)
* #Y "Yes"
* #N "No"
* #9 "Not known"

ValueSet:       COSDSynchronousTumourIndicator
Id:             cosd-synchronous-tumour-indicator
Title:          "COSD Synchronous Tumour Indicator"
Description:    "Whether there are other tumours present at the same time (Y present, N not present). COSD Pathology Synchronous Tumour Indicator (pCR0840)."
* insert COSDValueSet
* include codes from system COSDYesNoNotKnownCS

ValueSet:       COSDNeoadjuvantTherapyIndicator
Id:             cosd-neoadjuvant-therapy-indicator
Title:          "COSD Neoadjuvant Therapy Indicator"
Description:    "Whether treatment was given before surgery. COSD Pathology Neoadjuvant Therapy Indicator (pCR1000)."
* insert COSDValueSet
* include codes from system COSDYesNoNotKnownCS

// TNM Coding Edition (pCR6980)

CodeSystem:     COSDTNMCodingEditionCS
Id:             cosd-tnm-coding-edition
Title:          "COSD TNM Coding Edition"
Description:    "The TNM staging system used. COSD Pathology TNM Coding Edition (pCR6980)."
* insert COSDCodeSystem(pCR6980)
* #1 "UICC (Union for International Cancer Control)"
* #2 "AJCC (American Joint Committee on Cancer)"
* #3 "ENETS (European Neuroendocrine Tumour Society)"

ValueSet:       COSDTNMCodingEdition
Id:             cosd-tnm-coding-edition
Title:          "COSD TNM Coding Edition"
Description:    "COSD Pathology TNM Coding Edition (pCR6980)."
* insert COSDValueSet
* include codes from system COSDTNMCodingEditionCS

// Ki-67 Indicator (pCR7000)

CodeSystem:     COSDKi67IndicatorCS
Id:             cosd-ki67-indicator
Title:          "COSD Ki-67 Indicator"
Description:    "Whether Ki-67 staining was done and the result is available. COSD Pathology Ki-67 Indicator (pCR7000)."
* insert COSDCodeSystem(pCR7000)
* #1 "Done and result available"
* #2 "Done but result not available"
* #3 "Not done"
* #9 "Not known"

ValueSet:       COSDKi67Indicator
Id:             cosd-ki67-indicator
Title:          "COSD Ki-67 Indicator"
Description:    "COSD Pathology Ki-67 Indicator (pCR7000)."
* insert COSDValueSet
* include codes from system COSDKi67IndicatorCS

// MLH1, PMS2, MSH2, MSH6 Nuclear Expression Intact (pCR7020-pCR7050)

CodeSystem:     COSDNuclearExpressionIntactCS
Id:             cosd-nuclear-expression-intact
Title:          "COSD Nuclear Expression Intact"
Description:    "Whether mismatch repair (MMR) protein nuclear expression is intact by immunohistochemistry. N (expression lost) suggests MMR deficiency. COSD Pathology MLH1, PMS2, MSH2 and MSH6 Nuclear Expression Intact (pCR7020-pCR7050)."
* insert COSDCodeSystem(pCR7020 to pCR7050)
* #Y "Yes - nuclear expression intact"
* #N "No - nuclear expression lost"
* #E "Equivocal"
* #F "Test failed"
* #X "Not performed"

ValueSet:       COSDNuclearExpressionIntact
Id:             cosd-nuclear-expression-intact
Title:          "COSD Nuclear Expression Intact"
Description:    "COSD Pathology MLH1, PMS2, MSH2 and MSH6 Nuclear Expression Intact (pCR7020-pCR7050)."
* insert COSDValueSet
* include codes from system COSDNuclearExpressionIntactCS
