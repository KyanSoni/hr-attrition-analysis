-- HR Attrition Analysis
-- 01. Create the raw table and check the import
--
-- Columns are in the same order as the CSV, with simpler names.
-- After running this, import hr_attrition.csv into hr_raw
-- (pgAdmin > Import/Export Data, Format csv, Header on).

CREATE TABLE hr_raw (
  age INTEGER,
  attrition TEXT,
  business_travel TEXT,
  daily_rate INTEGER,
  department TEXT,
  distance_from_home INTEGER,
  education INTEGER,
  education_field TEXT,
  employee_count INTEGER,
  employee_number INTEGER,
  environment_satisfaction INTEGER,
  gender TEXT,
  hourly_rate INTEGER,
  job_involvement INTEGER,
  job_level INTEGER,
  job_role TEXT,
  job_satisfaction INTEGER,
  marital_status TEXT,
  monthly_income INTEGER,
  monthly_rate INTEGER,
  num_companies_worked INTEGER,
  over18 TEXT,
  overtime TEXT,
  percent_salary_hike INTEGER,
  performance_rating INTEGER,
  relationship_satisfaction INTEGER,
  standard_hours INTEGER,
  stock_option_level INTEGER,
  total_working_years INTEGER,
  training_times_last_year INTEGER,
  work_life_balance INTEGER,
  years_at_company INTEGER,
  years_in_current_role INTEGER,
  years_since_last_promotion INTEGER,
  years_with_curr_manager INTEGER
);

-- Check the import. Expected: 1,470
SELECT COUNT(*) AS total_rows FROM hr_raw;
