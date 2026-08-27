# NYC Payroll Overtime Analysis

An end-to-end ELT pipeline analyzing overtime spending across
New York City government agencies.

## Architecture

Python → Azure Blob Storage → Azure Data Factory → Snowflake → SQL

- **Python** extracts from the NYC Open Data API, filters to FY2024,
  and trims 17 columns to 10
- **Azure Blob Storage** holds the raw file
- **Azure Data Factory** copies it into Snowflake via a staged COPY INTO
- **Snowflake** stores the raw layer and runs the analytics SQL

**Note** I am aware that for this project, Azure is not needed and I could have jumped from Python to Snowflake. I Included Azure for exposure, and to show I have experience with the software.

200,000 records across 73 agencies.

## The question

City finance departments struggle to answer basic questions about
overtime spending. Overtime concentrated in a few individuals is a
scheduling problem; overtime spread across a job title is a staffing
problem. They require different fixes.

## Findings

### Agency-level overtime

Ranked 25 agencies with 500+ employees by overtime as a share of
regular payroll.

Top three:
1. Department of Correction — 41.81%
2. Board of Election — 24.08%
3. Department of Transportation — 19.54%

Correction and Transportation fit the pattern of 24/7 operations where
work can't be deferred. Board of Election is different because it's a seasonal
surge around elections rather than structural understaffing. Same
number, opposite cause, opposite fix.

### Job titles
_TBD_

### Individual concentration
_TBD_

## Data quality notes

`base_salary` is not comparable across records — `pay_basis` varies
between per Annum, per Hour, per Day, and Prorated Annual. The analysis
uses actual dollars paid instead.

## Repo structure

- `extract_payroll.py` — API extract and column trim
- `sql/01_setup.sql` — Snowflake schema
- `sql/02_agency_overtime.sql` — agency-level analysis
- `docs/` — pipeline screenshots