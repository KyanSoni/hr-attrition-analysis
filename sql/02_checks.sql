-- HR Attrition Analysis
-- 02. Data checks
--
-- Each check fills a row of docs/cleaning_log.md.

-- Check A. Repeated employees. Expected: 0
SELECT COUNT(*) - COUNT(DISTINCT employee_number) AS duplicate_employees
FROM hr_raw;

-- Check B. Rows with any blank value. Expected: 0
SELECT COUNT(*) AS rows_with_a_blank
FROM hr_raw
WHERE NOT (hr_raw IS NOT NULL);

-- Check C. Columns that hold only one value. Expected: 1, 1 and 1
SELECT COUNT(DISTINCT employee_count) AS employee_count_values,
       COUNT(DISTINCT over18)         AS over18_values,
       COUNT(DISTINCT standard_hours) AS standard_hours_values
FROM hr_raw;

-- Check D. Values that cannot be true. Expected: 0
SELECT COUNT(*) AS impossible_rows
FROM hr_raw
WHERE age < 18
   OR years_at_company > total_working_years
   OR monthly_income <= 0;

-- Check E. Leavers and stayers. Expected: No 1,233 and Yes 237
SELECT attrition, COUNT(*) AS people
FROM hr_raw
GROUP BY attrition;
