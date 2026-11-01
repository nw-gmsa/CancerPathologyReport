# Research Notes

Working notes for the Cancer Pathology Report IG. **Not published** - this folder
is outside `input/`. Findings that belong in the guide go on the IG pages; this
file keeps supporting evidence, local service detail and open questions.

Dates are when the source was checked.

## Open Questions

| # | Question | Who could answer | Status |
|---|---|---|---|
| 1 | Reflex use case URL `https://nw-gmsa.github.io/use-cases/PathologyToGenomicsReflex.html` returns 404. Still used in `index.md`, `ILW.md`, `PathologyReport.md`, `StructureDefinition-PathologyReport-intro.md`, `PathologyReport.fsh`, `README.md`. Source exists at `nw-gmsa/nw-gmsa-use-cases/PathologyToGenomicsReflex.md`. Is the published path changing? | NW GMSA use cases repo owner | Open |
| 2 | Is MFT Adult Histopathology (MRI) still the regional MMR IHC referral centre? If so, MMR IHC from other GM trusts is a pathology-to-pathology ILW sub-order, not an internal test | MFT Adult Histopathology IHC lab | Open |
| 3 | Is the GM Cellular Pathology Genomics Centre a step in the order workflow (specimen receipt/dispatch tracking, derived specimens) or only a physical step? | GM CPGC | Open |
| 4 | Which LIMS does MFT histopathology use? NW GMSA [Haemato-Oncology Diagnostic Pathway](https://github.com/nw-gmsa/nw-gmsa-use-cases/blob/main/HaematoOncologyPathway.md) names **Shire LIMS** as MFT's cellular pathology LIMS (there in its cytogenetics role). Public MFT pages name Hive only for viewing reports. Confirm Shire produces the histopathology (solid tumour) reports too | MFT Laboratory Medicine | Partly answered |
| 5 | Can Magentus Evolution vLab send the synoptic (coded) content as HL7 v2 `OBX` or FHIR `Observation`s, not only text/PDF? Does it produce RCPath synoptic reports and COSD extracts? | Magentus; C&M or L&SC programme teams | Open |
| 6 | Has cellular pathology gone live on vLab in Lancashire & South Cumbria or Cheshire & Merseyside? | Network programme teams | Open |
| 7 | `appended` vs addendum report (`35265-8`) for supplementary IHC/genomic results; v2 mapping of `appended` to `OBR-25` `C` is indicative | - | Open |
| 8 | Block/slide specimen hierarchy (`Specimen.parent`) not modelled in `CancerPathologySpecimen` | - | Open |
| 9 | Does NPEx carry cellular pathology referrals (e.g. MMR IHC to MFT) and/or the pathology → NW GLH reflex order today? If so, NPEx is the Intermediary for LAB-35/LAB-36 in this guide. Does it carry the pathology report as supporting information? | Labgnostic; an NPEx-connected laboratory | Open |
| 10 | NPEx HL7 interface specification - message types, whether the original clinical order number (`ORC-4`/`ORC-8`) is carried | Labgnostic / NHS England | Open (also in NW GMSA use cases) |
| 11 | For solid tumours, does HODS (or an equivalent) produce a combined pathology + genomic report, or only for haemato-oncology? HODS is an existing example of the orchestrated-order pattern on the Genomics page | MFT HODS | Open |

## Existing Implementations (checked 2026-11-01)

Some of the workflow in this guide already runs in the North West. Reported by
the project lead and checked against the NW GMSA use cases repo
(`nw-gmsa/nw-gmsa-use-cases`).

### HODS (Haemato-Oncology Diagnostic Service) - MFT

HODS is both the MFT service and the name of its computer system (order comms
and reporting). Source: NW GMSA
[Haemato-Oncology Diagnostic Pathway](https://github.com/nw-gmsa/nw-gmsa-use-cases/blob/main/HaematoOncologyPathway.md).

- HODS is the **Order Filler** for the clinician's referral (LAB-1) and the
  **Requestor** that orchestrates two ILW sub-orders: cytogenetics to the pathology
  laboratory (**Shire LIMS**) and molecular genomics to the genomics laboratory.
- HODS produces a single **combined report** to the referring clinician (LAB-3) -
  the "orchestrated order" pattern on the Genomics page.
- Only the Shire → HODS Cytogenetic Genomic Report (LAB-36, HL7 v2 `ORU_R01`, all
  narrative `OBX`) is confirmed electronic. The LAB-35 to Shire is believed not
  electronic; the LAB-3 to the clinician is believed to be a secure email alert
  with a report link.
- Haemato-oncology, not solid tumour - but the closest working example of a
  pathology + genomics integrated report in the region.

### NPEx (National Pathology Exchange) - Labgnostic

Source: NW GMSA
[Order Hierarchy - ServiceRequest and Task](https://github.com/nw-gmsa/nw-gmsa-use-cases/blob/main/OrderHierarchyServiceRequestAndTask.md#national-pathology-exchange-npex).

- National hub for **laboratory-to-laboratory referrals** - orders and results.
  Developed by X-Lab (now marketed as Labgnostic), started in the Greater
  Manchester Pathology Network in 2009, connects about half of UK NHS laboratories.
- Acts as the **Intermediary** between Requestor and Subcontractor for ILW
  LAB-35/LAB-36. Referring lab sample number + NAC is the referral order number;
  results carry both labs' numbers; tests mapped to SNOMED CT / NLMC.
- Message types believed to be HL7 v2 `OML^O21`/`ORM^O01` and `ORU^R01`, but no
  published interface specification.
- Believed, not confirmed, to be involved in NW pathology → genomics reflex
  pathways. Not connected to GOMS.

### Implications for this guide

- `ILW.md` shows NPEx as the Intermediary for LAB-35/LAB-36 (added 2026-11-01).
- `Genomics.md` "Orchestrated orders" links to HODS on `ILW.md` (added 2026-11-01).
- Pathology-to-pathology IHC referrals (Open Question 2) would likely go via NPEx.

## IHC Result Definitions (checked 2026-11-01)

- **LOINC 2.83** (tx.fhir.org): per-antibody "[Presence] by Immune stain" codes
  exist (MMR `81691-8`, `81694-2`, `81692-6`, `81693-4`; generic tissue
  `50322-7`, `50323-5`, `50324-3`; BRAF V600E `85299-6`; breast ER/PR/HER2/Ki-67
  `85337-4`, `85339-0`, `85319-2`, `85330-9`, % cells `85329-1`, `85325-9`,
  `85328-3`; PD-L1 per clone 22C3/28-8/SP142). **No LOINC panel** for MMR or breast
  biomarkers; `98279-3` is an MMR narrative summary only. LOINC defines the
  question, not answer lists.
- **CAP Biomarker Templates** - most complete item definitions (e.g.
  [Colon and Rectum Biomarker](https://documents.cap.org/protocols/ColoRectal.Bmk_1.3.0.0.REL_CAPCP.pdf));
  CAP-licensed, not used in England.
- **COSD Pathology** - core: MMR pCR7020-7050, Ki-67 pCR7000/7010. Site-specific:
  [Breast](https://nhsd-proxy.openprescribing.net/ndrs/data/data-sets/cosd/cosd-pathology-user-guide-v5.0/pathology---breast)
  ER status pBR4220, ER Allred pBR4230, HER2 IHC score pBR4280, HER2 ISH pBR4310.
- **ICCR** colorectal dataset - MMR IHC as an ancillary element with value lists.
- **mCODE** Tumor Marker Test value set - broad LOINC set, no answer bindings.
- No UK, NHS England or HL7 Europe FHIR profile for IHC results found.

## Who Performs IHC: MFT (checked 2026-11-01)

Source: [UKAS schedule 8648](https://www.ukas.com/download-schedule/8648/Medical/),
Issue 010, 13 August 2026, ISO 15189:2022.

| Code | Site | Relevant IHC |
|---|---|---|
| A | Cellular Pathology (adult), Manchester Royal Infirmary | MMR (MLH1, MSH2, MSH6, PMS2) - only at A; ER, PR, Ki-67; PD-L1 SP263 (NSCLC); ALK D5F3 (NSCLC) |
| D | Paediatric Histopathology, Oxford Road | Paediatric repertoire |
| E | Histopathology, Wythenshawe | HER2 IHC and HER2 DDISH (breast); ER, PR, Ki-67; PD-L1 SP142 (TNBC) |

- Instruments: Roche Ventana BenchMark Ultra (A, D), BenchMark Ultra Plus (E).
- No in-house molecular tests (BRAF, MLH1 methylation, MSI) on the schedule.
- [MFT Diagnostic MMR IHC Testing](https://mft.nhs.uk/the-trust/other-departments/laboratory-medicine/histopathology/immunohistochemistry-and-research/ihc-and-ish-repertoire/diagnostic-mismatch-repair-ihc-testing/)
  - proposed regional referral centre; page last reviewed January 2018.
  [2017 Manchester Cancer MMR guideline](https://mft.nhs.uk/app/uploads/2018/09/mmr-guidelines-v2-inc-flow-chart-and-form.pdf):
  results added to the histopathology report as an addendum.
- [GM Cellular Pathology Genomics Centre](https://mft.nhs.uk/the-trust/other-departments/laboratory-medicine/histopathology/cellular-pathology-genomics-centre-external/)
  - molecular sample preparation for solid tumours, <48 h to NW GLH. Added to
  `Genomics.md`.
- Other GM: Salford Royal ([UKAS 9902](https://www.ukas.com/download-schedule/9902/Medical))
  accredited for IHC; Royal Oldham (9880) and Stockport (9593) IHC lists not seen.
  Four GM trusts (Tameside and Glossop, Stockport, Bolton, NCA) moving to Clinisys
  WinPath Enterprise.

## LIMS in the North West outside Greater Manchester (checked 2026-11-01)

| Network | Supplier | Notes |
|---|---|---|
| Lancashire & South Cumbria | Magentus Evolution vLab | [2022 contract](https://www.digitalhealth.net/2022/05/lancashire-and-south-cumbria-pathology-service-implements-new-lims/), all NHS pathology services, replaces four systems on eight sites, phased. No cellular pathology go-live found |
| Cheshire & Merseyside | Magentus Evolution vLab | [£11.5m single LIMS](https://cheshireandmerseyside.nhs.uk/posts/nhs-announces-it-supplier-for-single-digital-pathology-system-across-cheshire-and-merseyside-pathology-network/), hosted by Mersey and West Lancashire; Countess of Chester, Wirral, Warrington & Halton, MWL, Liverpool Clinical Laboratories. Disciplines not stated; [case study](https://www.magentus.com/newsroom/case-studies/transforming-diagnostics-in-cheshire-and-merseyside/) says in progress |

- vLab has a cellular pathology module. Confirmed histopathology go-lives found
  only in NHS Scotland (Shetland, Orkney, Fife).
- Magentus = Citadel Health + Wellbeing Software + Genie Solutions.
- North Cumbria (North East and Cumbria network) not checked.

## NDRS Data Timeliness (checked 2026-11-01)

Added to `index.md` ("Why not use registry data?").

| Stage | Timing | Source |
|---|---|---|
| COSD submission | Monthly, ~1 month behind diagnosis; clinical sign-off not mandated | [NATCAN data sources](https://www.natcan.org.uk/?p=1858), [RCP](https://rcpwebuat.rcp.ac.uk/news-and-media/news-and-opinion/why-does-it-take-so-long-to-publish-data/) |
| Rapid Cancer Registration Data (RCRD) | ~4-5 months post diagnosis; lower quality, won't match official statistics | [NATCAN data sources and timeliness](https://www.natcan.org.uk/?p=1906) |
| Full registration (NCRD) | ~18-24 months post diagnosis cohort | as above |
| Official statistics | ~2 years; 2023 incidence from a 5-6 August 2025 snapshot | [Cancer Registration Statistics, England 2023](https://nhsd-proxy.openprescribing.net/data-and-information/publications/statistical/cancer-registration-statistics/england-2023) |

- Lesion size and TNM items often only partly populated in registry data (NATCAN).
- NDRS runs a daily COSD submission monitoring dashboard and monthly feedback
  reports to provider cancer teams - NHS users only.
- Cancer Waiting Times (NHS England) is a separate, faster monthly collection.
- No published COSD submission deadline (e.g. working days after month end) found.

## FDP Canonical Data Model (checked 2026-11-01)

Source: NW GMSA [FDP Canonical Data Model](https://github.com/nw-gmsa/nw-gmsa-use-cases/blob/main/FDPCanonicalDataModel.md).
Added to `CancerPathway.md` ("Operational Tracking (FDP Cancer 360)").

- Overlap is **pathway tracking and identifiers**: `Cancer Pathway`, `Patient Pathway`
  (~`EpisodeOfCare`), `Cancer Tracking Comment`, `Cancer Pathway Note`, `Mdt Meeting`,
  `Mdt Note`, `Patient Diagnosis` (SNOMED CT / ICD-10), `Cancer Treatment`.
- Diagnostics are thin: `Histology`, `Endoscopy`, `Radiology Exam` (one object per
  discipline); `Test Result` is one flat row per result, "SNOMED or ICD10" in one
  field, no LOINC, no order object, no placer/filler numbers. Only lab identifier
  is `Test Result.Laboratory Number` (specimen accession number).
- No equivalent of the COSD synoptic content. CDM is "standards aligned, not
  standards bound"; no published FHIR mapping.
- FDP product: **Cancer 360** - single tracking list of patients on a cancer
  diagnosis pathway ([Digital Health, Feb 2025](https://www.digitalhealth.net/2025/02/cancer-diagnostic-pathway-tool-to-launch-on-fdp/)).
- What tracking needs from this report: milestone (`DiagnosticReport.issued`,
  pCR0780), diagnosis, identifiers (accession number, order numbers, PPID).
- **Open:** `Histology` object properties not found. CDM operational model
  reportedly on GitHub ([Computer Weekly](https://www.computerweekly.com/opinion/Inside-FDP-part-4-The-NHS-data-model)) - not located.

## RCPath Minimum LIMS Requirements

[Computerised cancer histopathology reporting, data recording and downloading to cancer registries](https://rcpath.org/asset/60CB744E%2D30CF%2D40A9%2D88327F33C0206493)
(RCPath Working Group on Cancer Services, September 2015). 15 requirements;
12 mapped in `LTW.md` (Order Filler (LIMS) Requirements). Not mapped: 1 system
compatibility, 2 secure access, 13 workload/MDT list queries, 14 dataset updates.
