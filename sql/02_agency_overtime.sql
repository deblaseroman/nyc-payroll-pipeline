SELECT AGENCY_NAME,
       COUNT(*)                                                     AS employee_count,
       ROUND(SUM(regular_gross_paid), 2)                            AS total_regular_pay,
       ROUND(SUM(total_ot_paid), 2)                                 AS total_ot_pay,
       ROUND(SUM(total_ot_paid) / SUM(regular_gross_paid) * 100, 2) AS ot_pct_of_regular
FROM   PAYROLL.RAW.PAYROLL_RAW
GROUP  BY AGENCY_NAME
HAVING COUNT(*) >= 500
ORDER  BY ot_pct_of_regular DESC;

