<div class="alert alert-danger" role="alert">
<b>Proof of concept.</b> This implementation guide is a demonstration only. It is
<b>not</b> an authoritative source, is not endorsed by NHS England, the National
Disease Registration Service or HL7, and must not be used for implementation or
clinical purposes. The authoritative source for COSD Pathology is the
<a href="https://nhsd-proxy.openprescribing.net/ndrs/data/data-sets/cosd/cosd-pathology-user-guide-v5.0/core---pathology">COSD Pathology User Guide</a>.
</div>


**Order Results Management [LAB-3]** (IHE LTW) - the pathology laboratory (Order
Filler) sending the [Cancer Pathology Report](PathologyReport.html) to the Order
Placer. HL7 v2 `ORU_R01` or FHIR
[Cancer Pathology Diagnostic Report](StructureDefinition-CancerPathologyDiagnosticReport.html).

<div class="alert alert-warning" role="alert">
<b>TODO</b> - the LTW transaction itself (actors, interaction diagram, FHIR
exchange) has not been written yet. This page currently only covers published
HL7 v2 guidance.
</div>

### HL7 v2 guidance: NAACCR Volume V

No HL7 v2 guidance for cancer pathology content has been published in England.
COSD Pathology is only submitted to NDRS as monthly XML, and the HSCIC ITK HL7 v2
pathology messages carry general laboratory results.

The established HL7 v2 guidance is the North American Association of Central
Cancer Registries (NAACCR)
[Standards for Cancer Registries Volume V, Laboratory Electronic Pathology Reporting](https://www.naaccr.org/pathology-laboratory-electronic-reporting/)
(version 5.1), used in the US and Canada. It is the HL7 v2 basis of the HL7 US
[Cancer Pathology Data Sharing](https://hl7.org/fhir/us/cancer-reporting/index.html) FHIR IG.

<div class="alert alert-info" role="alert">
Volume V is written for <b>reporting to a cancer registry</b>, which is out of
scope for this guide. Its message structure is used here <b>by analogy</b> for
reporting to the Order Placer and to genomics. Examples below are quoted from
<a href="https://naaccr.org/wp-content/uploads/2024/07/Appendix-E_Samples-Examples-and-FAQs_revised-20240712.pdf">Volume V Appendix E</a>.
</div>

#### Message

| Item | Volume V | Notes |
|---|---|---|
| Message type | `ORU^R01^ORU_R01`, HL7 v2.5.1 | Same message as LTW LAB-3 |
| Message profile | `MSH-21` = `VOL_V_51_ORU_R01^NAACCR_CP` | Identifies the Volume V profile. A UK profile would need its own identifier |
| Specimens | One `SPM` per specimen, with specimen-level `OBX` after it | Required when a report covers several individually identified specimens |
| Report structure | A parent `OBR` for the whole report, with a further `OBR` per specimen part or per synoptic report | Linked through `OBR-29` (parent) and the filler order number |
{:.grid}

#### Report types (OBR-4)

| LOINC | Display | Use |
|---|---|---|
| `60567-5` | Comprehensive pathology report panel | Parent OBR for the whole report |
| `11529-5` | Surgical pathology study | Narrative report, or a specimen part |
| `60568-3` | Synoptic report | Synoptic (checklist) data |
| `35265-8` | Addendum report | Addenda and supplementary reports without their own LOINC code (`22639-9` is deprecated) |
{:.grid}

#### Narrative sections (OBX-3)

Narrative report sections are separate `OBX` segments (type `TX` or `FT`), each
coded with LOINC. A single block of running text is allowed but discouraged,
because the receiver then has to extract the data from the text.

| LOINC | Section |
|---|---|
| `22636-5` | Clinical history |
| `22633-2` | Site of origin / nature of specimen |
| `22634-0` | Gross description |
| `22635-7` | Microscopic observation |
| `22637-3` | Final diagnosis |
| `22638-1` | Comments |
| `33746-9` | Pathologic findings |
{:.grid}

#### Synoptic data

Volume V describes three ways of carrying synoptic (structured) content:

| Style | How it works |
|---|---|
| **CAP eCP style** | Each College of American Pathologists electronic cancer protocol (CAP eCP) question is an `OBX`, coded with its CAP ID (coding system `CAPECP`). `OBX-4` holds the parent section or question ID, so the checklist nesting is kept. Template metadata comes first: `60573-3` Report template source, `60572-5` Report template ID, `60574-1` Report template version ID |
| **Non-CAP synoptic segmented** | Each item is an `OBX` with its heading and value as text, grouped using the `OBX-4` sub-ID |
| **CAP synoptic summary** | The checklist as a single text block - **retired** |
{:.grid}

CAP eCP style example (Appendix E.2.3):

```
OBR|1||123456789|60568-3^Synoptic Report^LN|||201907261530||||||||TISS|...
OBX|1|ST|60573-3^Report template source^LN||CAP eCP||||||F|||201907261530
OBX|2|CWE|60572-5^Report template ID^LN||131.100004300^AMPULLA OF VATER^CAPECP||||||F|||201907261530
OBX|3|ST|60574-1^Report template version ID^LN||3.001.001.REL||||||F|||201907261530
OBX|4|ST|15897.100004300^SPECIMEN^CAPECP||SECTION||||||F|||201907261530
OBX|5|CWE|15906.100004300^Procedure^CAPECP|+15897.100004300|15907.100004300^Ampullectomy^CAPECP||||||F|||201907261530
```

For local data items, Volume V says the sender and receiver agree the item, codes,
data type and coding system, using **LOINC and/or SNOMED CT** for `OBX-3` and
`OBX-5` wherever possible.

### Applying Volume V to COSD Pathology (proposal)

CAP eCP codes are licensed by the CAP and are not used in England; the UK
equivalent, the Royal College of Pathologists datasets, has no published code
identifiers. A COSD report would therefore follow the **coded** pattern of the
CAP eCP style, without the CAP codes:

- `OBX-3` uses the LOINC code fixed in the matching [profile](profiles.html) where
  there is one, otherwise the COSD data item (`pCR` code) as a local code.
- `OBX-5` (type `CWE`) uses the COSD national codes from the
  [Terminology](terminology.html) page, or SNOMED CT for topography and morphology.
- Specimen items go in `SPM`; the full report text stays in narrative `OBX` segments.

| COSD item | OBX-2 | OBX-3 | OBX-5 |
|---|---|---|---|
| pCR6420 Morphology (SNOMED) | CWE | `31206-6^Behavior ICD-O-3 Cancer^LN` | SNOMED CT ([Cancer Morphology](ValueSet-cancer-morphology.html)) |
| pCR0860 Grade of Differentiation | CWE | `33732-9^Histology grade [Identifier] in Cancer specimen^LN` | [COSD Grade of Differentiation](ValueSet-cosd-grade-of-differentiation.html) |
| pCR0830 Lesion Size | NM | `21889-1^Size Tumor^LN` | Number, `OBX-6` = `mm` |
| pCR0910 T Category (Pathological) | CWE | `21899-0^Primary tumor.pathology Cancer^LN` | TNM category |
| pCR0920 N Category (Pathological) | CWE | `21900-6^Regional lymph nodes.pathology [Class] Cancer^LN` | TNM category |
| pCR0930 M Category (Pathological) | CWE | `21901-4^Distant metastases.pathology [Class] Cancer^LN` | TNM category |
| pCR0940 TNM Stage Grouping | CWE | `21902-2^Stage group.pathology Cancer^LN` | TNM stage group |
| pCR7010 Ki-67 Result | NM | `29593-1^Cells.Ki-67 nuclear Ag/cells in Tissue by Immune stain^LN` | Number, `OBX-6` = `%` |
| pCR7020 MLH1 Nuclear Expression Intact | CWE | `81691-8^MLH-1 Ag [Presence] in Cancer specimen by Immune stain^LN` | [COSD Nuclear Expression Intact](ValueSet-cosd-nuclear-expression-intact.html) |
| pCR7030 PMS2 Nuclear Expression Intact | CWE | `81694-2^PMS2 Ag [Presence] in Cancer specimen by Immune stain^LN` | as above |
| pCR7040 MSH2 Nuclear Expression Intact | CWE | `81692-6^MSH-2 Ag [Presence] in Cancer specimen by Immune stain^LN` | as above |
| pCR7050 MSH6 Nuclear Expression Intact | CWE | `81693-4^MSH-6 Ag [Presence] in Cancer specimen by Immune stain^LN` | as above |
| Other COSD items, e.g. pCR0870 Vascular or Lymphatic Invasion | CWE or NM | `pCR0870^Cancer Vascular or Lymphatic Invasion^99COSD` (local) | COSD national code |
{:.grid}

The local coding system name (`99COSD`) and the use of `pCR` codes in `OBX-3` are
suggestions for this proof of concept, not an agreed standard.

### Sources

- [NAACCR Laboratory Electronic Pathology Reporting](https://www.naaccr.org/pathology-laboratory-electronic-reporting/) - Standards for Cancer Registries Volume V
- [Volume V v5.1 Appendix E - Samples, Examples and FAQs](https://naaccr.org/wp-content/uploads/2024/07/Appendix-E_Samples-Examples-and-FAQs_revised-20240712.pdf) (revised July 2024)
- [HL7 US Cancer Pathology Data Sharing - Background](https://hl7.org/fhir/us/cancer-reporting/background.html)
