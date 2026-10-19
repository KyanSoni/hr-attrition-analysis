# Data dictionary

The model is a star schema: one main table, `employees`, linked to two lookup tables. In Power BI each link is many-to-one, with `employees` on the many side.

## employees (built in 03_build_employees.sql)

| Column | Type | Meaning |
| --- | --- | --- |
| employee_number | integer | Unique ID for each person |
| age | integer | Age in years |
| gender | text | Male or Female |
| marital_status | text | Single, Married or Divorced |
| department | text | Research & Development, Sales or Human Resources |
| job_role | text | One of nine job roles |
| job_level | integer | 1 (junior) to 5 (senior) |
| education_id | integer | Education code; links to education_levels |
| education_field | text | Subject studied |
| business_travel | text | Non-Travel, Travel_Rarely or Travel_Frequently |
| overtime | text | Yes or No |
| distance_from_home | integer | Distance from home |
| monthly_income | integer | Pay per month (no currency given) |
| percent_salary_hike | integer | Last pay rise, % |
| total_working_years | integer | Years worked in total |
| years_at_company | integer | Tenure in whole years |
| years_in_current_role | integer | Years in the current role |
| years_since_last_promotion | integer | Years since last promotion |
| satisfaction_id | integer | Job satisfaction code; links to satisfaction_levels |
| environment_satisfaction | integer | Survey score, 1 to 4 |
| work_life_balance | integer | Survey score, 1 to 4 |
| attrition | text | Yes if the person has left |
| left_flag | integer | 1 if the person has left, 0 if not |
| age_band | text | Under 25, 25-34, 35-44, 45-54, 55+ |
| age_sort | integer | Puts age_band in order |
| tenure_band | text | Under 2 years, 2-4 years, 5-9 years, 10+ years |
| tenure_sort | integer | Puts tenure_band in order |
| income_band | text | Under 3,000, 3,000-5,999, 6,000-9,999, 10,000+ |
| income_sort | integer | Puts income_band in order |

## education_levels

| education_id | education_level |
| --- | --- |
| 1 | Below College |
| 2 | College |
| 3 | Bachelor |
| 4 | Master |
| 5 | Doctor |

## satisfaction_levels

| satisfaction_id | satisfaction_level |
| --- | --- |
| 1 | Low |
| 2 | Medium |
| 3 | High |
| 4 | Very High |
