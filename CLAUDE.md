# CLAUDE.md

Proof-of-concept FHIR Implementation Guide for a structured cancer pathology
report, based on COSD Pathology v5 Core - Pathology. Published at
https://kevinmayfield.github.io/CancerPathologyReport/. Supports the NW GMSA Pathology to
Genomics Reflex use case.

## Scope

- **Proof of concept only.** Every page starts with the red "Proof of concept"
  alert box (copy it from an existing page). Never present content as
  authoritative or endorsed.
- **COSD Pathology v5 is the primary source of requirements.** The recipient is
  the Order Placer (EPR) and genomics, not the cancer registry - registry
  submission (monthly COSD XML) is out of scope.
- Items genomics needs but COSD core does not cover (e.g. neoplastic cell
  content, non-MMR IHC) are out of scope of the model; note them as gaps.

## Layout

- FSH: `input/fsh/PathologyReport.fsh` (logical model),
  `input/fsh/Profiles/CancerPathologyReport.fsh`, `input/fsh/Terminology/`
- Pages: `input/pagecontent/`, organised as IHE volumes - Volume 1 Analysis and
  Design (LTW, ILW, Imaging, Genomics), Volume 2 Interactions (LAB-1, LAB-3,
  LAB-35, LAB-36), Volume 3 Data Models.
- A new page must be added to both `pages:` and `menu:` in `sushi-config.yaml`.
- Research notes and open questions that should not be published:
  `notes/research.md` (outside `input/`, so the IG Publisher ignores it).

## Conventions

- Markdown pages; diagrams as Mermaid (`sequenceDiagram`, `erDiagram`,
  `flowchart`); tables end with `{:.grid}`.
- Label COSD items with their `pCR` codes; HL7 v2 mappings are "indicative".
- Check LOINC codes on tx.fhir.org (`ValueSet/$expand` on `http://loinc.org/vs`,
  or `CodeSystem/$lookup`) before using them.
- Cite sources with links. Mark anything unverified or undecided as **Open** or
  **To confirm** rather than guessing.
- Do not use CAP eCP codes (licensed, not used in England); RCPath datasets have
  no published codes.

## Build and publish

- `sushi build .` after any FSH or `sushi-config.yaml` change; expect 0 errors
  (the SUSHI version warning is known).
- Full build: `./_genonce.sh` (HL7 IG Publisher). Mermaid diagrams are only
  rendered by the full build.
- Any push runs `.github/workflows/igPublish.yml`; pushes to `main` update the
  published site. Commit or push only when asked.
