-- HR Attrition Analysis
-- 03. Build the tidy employees table
--
-- Keeps 22 useful columns. Drops the three that never change
-- (employee_count, over18, standard_hours) and the daily, hourly and
-- monthly rate columns, which do not match monthly income.
-- Adds left_flag (1 = left) plus age, tenure and income bands,
-- each with a sort number so charts show them in order.

CREATE TABLE employees AS
SELECT
  employee_number, age, gender, marital_status, department, job_role, job_level,
  education AS education_id, education_field, business_travel, overtime,
  distance_from_home, monthly_income, percent_salary_hike, total_working_years,
  years_at_company, years_in_current_role, years_since_last_promotion,
  job_satisfaction AS satisfaction_id, environment_satisfaction, work_life_balance,
  attrition,
  CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END AS left_flag,
  CASE WHEN age < 25 THEN 'Under 25' WHEN age < 35 THEN '25-34'
       WHEN age < 45 THEN '35-44' WHEN age < 55 THEN '45-54' ELSE '55+' END AS age_band,
  CASE WHEN age < 25 THEN 1 WHEN age < 35 THEN 2
       WHEN age < 45 THEN 3 WHEN age < 55 THEN 4 ELSE 5 END AS age_sort,
  CASE WHEN years_at_company < 2 THEN 'Under 2 years' WHEN years_at_company < 5 THEN '2-4 years'
       WHEN years_at_company < 10 THEN '5-9 years' ELSE '10+ years' END AS tenure_band,
  CASE WHEN years_at_company < 2 THEN 1 WHEN years_at_company < 5 THEN 2
       WHEN years_at_company < 10 THEN 3 ELSE 4 END AS tenure_sort,
  CASE WHEN monthly_income < 3000 THEN 'Under 3,000' WHEN monthly_income < 6000 THEN '3,000-5,999'
       WHEN monthly_income < 10000 THEN '6,000-9,999' ELSE '10,000+' END AS income_band,
  CASE WHEN monthly_income < 3000 THEN 1 WHEN monthly_income < 6000 THEN 2
       WHEN monthly_income < 10000 THEN 3 ELSE 4 END AS income_sort
FROM hr_raw;

-- Check. Expected: 1,470 employees and 237 leavers
SELECT COUNT(*) AS employees, SUM(left_flag) AS leavers FROM employees;
