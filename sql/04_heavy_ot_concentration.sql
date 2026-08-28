-- How many employees earn more than half their regular pay again in overtime
SELECT COUNT(*) AS heavy_ot_employees
FROM   PAYROLL.RAW.PAYROLL_RAW
WHERE  total_ot_paid / regular_gross_paid > 0.5
  AND  regular_gross_paid > 0;


-- Where those employees sit, by agency and job title
SELECT agency_name,
       title_description,
       COUNT(*) AS heavy_ot_employees
FROM   PAYROLL.RAW.PAYROLL_RAW
WHERE  total_ot_paid / regular_gross_paid > 0.5
  AND  regular_gross_paid > 0
GROUP  BY agency_name, title_description
ORDER  BY heavy_ot_employees DESC
LIMIT  10;