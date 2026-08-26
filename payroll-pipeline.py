import csv

INPUT = "k397-673e (2).csv"

OUTPUT = "payroll_trimmed.csv"

KEEP_COLUMNS = [
    "fiscal_year",
    "agency_name",
    "title_description",
    "base_salary",
    "pay_basis",
    "regular_hours",
    "regular_gross_paid",
    "ot_hours",
    "total_ot_paid",
    "total_other_pay",
]

with open(INPUT, "r", encoding="utf-8") as infile, \
     open(OUTPUT, "w", newline="", encoding="utf-8") as outfile:

    reader = csv.DictReader(infile)
    writer = csv.DictWriter(outfile, fieldnames=KEEP_COLUMNS)
    writer.writeheader()

    for row in reader:
         writer.writerow({col: row[col] for col in KEEP_COLUMNS})



print("done")
