-- HR Attrition Analysis
-- 05. The eleven business questions
--
-- Pattern: group the employees, count them, count the leavers, divide.
-- Always read headcount next to the rate: a high rate in a small group
-- is fewer people than a medium rate in a big one.

-- Q1. Headcount, leavers and attrition rate
SELECT COUNT(*) AS headcount,
       SUM(left_flag) AS leavers,
       ROUND(100.0 * SUM(left_flag) / COUNT(*), 1) AS attrition_pct
FROM employees;

-- Q2. Attrition by department
SELECT department,
       COUNT(*) AS headcount,
       SUM(left_flag) AS leavers,
       ROUND(100.0 * SUM(left_flag) / COUNT(*), 1) AS attrition_pct
FROM employees
GROUP BY department
ORDER BY attrition_pct DESC;

-- Q3. Attrition by job role
SELECT job_role,
       COUNT(*) AS headcount,
       SUM(left_flag) AS leavers,
       ROUND(100.0 * SUM(left_flag) / COUNT(*), 1) AS attrition_pct
FROM employees
GROUP BY job_role
ORDER BY attrition_pct DESC;

-- Q4. Attrition by age band
SELECT age_band,
       COUNT(*) AS headcount,
       SUM(left_flag) AS leavers,
       ROUND(100.0 * SUM(left_flag) / COUNT(*), 1) AS attrition_pct
FROM employees
GROUP BY age_band, age_sort
ORDER BY age_sort;

-- Q5. Attrition by years at the company
SELECT tenure_band,
       COUNT(*) AS headcount,
       SUM(left_flag) AS leavers,
       ROUND(100.0 * SUM(left_flag) / COUNT(*), 1) AS attrition_pct
FROM employees
GROUP BY tenure_band, tenure_sort
ORDER BY tenure_sort;

-- Q6. Attrition by job satisfaction (join to the lookup table for labels)
SELECT s.satisfaction_level,
       COUNT(*) AS headcount,
       SUM(e.left_flag) AS leavers,
       ROUND(100.0 * SUM(e.left_flag) / COUNT(*), 1) AS attrition_pct
FROM employees e
JOIN satisfaction_levels s ON e.satisfaction_id = s.satisfaction_id
GROUP BY s.satisfaction_id, s.satisfaction_level
ORDER BY s.satisfaction_id;

-- Q7. Attrition by education level
SELECT l.education_level,
       COUNT(*) AS headcount,
       SUM(e.left_flag) AS leavers,
       ROUND(100.0 * SUM(e.left_flag) / COUNT(*), 1) AS attrition_pct
FROM employees e
JOIN education_levels l ON e.education_id = l.education_id
GROUP BY l.education_id, l.education_level
ORDER BY l.education_id;

-- Q8. Attrition by overtime
SELECT overtime,
       COUNT(*) AS headcount,
       SUM(left_flag) AS leavers,
       ROUND(100.0 * SUM(left_flag) / COUNT(*), 1) AS attrition_pct
FROM employees
GROUP BY overtime
ORDER BY attrition_pct DESC;

-- Q9. Attrition by income band
SELECT income_band,
       COUNT(*) AS headcount,
       SUM(left_flag) AS leavers,
       ROUND(100.0 * SUM(left_flag) / COUNT(*), 1) AS attrition_pct
FROM employees
GROUP BY income_band, income_sort
ORDER BY income_sort;

-- Q10. Leavers against stayers: pay, tenure and age
SELECT attrition,
       COUNT(*) AS people,
       ROUND(AVG(monthly_income)) AS avg_monthly_income,
       ROUND(AVG(years_at_company), 1) AS avg_years_at_company,
       ROUND(AVG(age), 1) AS avg_age
FROM employees
GROUP BY attrition;

-- Q11. The three retention programmes compared
-- For each programme: the people it reaches, their attrition rate, the rate
-- for everyone else, and how many fewer leavers there would be if the
-- group's rate fell to match everyone else (a best case).
WITH groups AS (
  SELECT 'Cut overtime' AS programme, overtime = 'Yes' AS in_group, left_flag FROM employees
  UNION ALL
  SELECT 'Raise lowest pay', monthly_income < 3000, left_flag FROM employees
  UNION ALL
  SELECT 'Improve first two years', years_at_company < 2, left_flag FROM employees
),
summary AS (
  SELECT programme,
         SUM(CASE WHEN in_group THEN 1 ELSE 0 END) AS people,
         SUM(CASE WHEN in_group THEN left_flag ELSE 0 END) AS leavers,
         SUM(CASE WHEN NOT in_group THEN 1 ELSE 0 END) AS other_people,
         SUM(CASE WHEN NOT in_group THEN left_flag ELSE 0 END) AS other_leavers
  FROM groups
  GROUP BY programme
)
SELECT programme, people, leavers,
       ROUND(100.0 * leavers / people, 1) AS group_pct,
       ROUND(100.0 * other_leavers / other_people, 1) AS everyone_else_pct,
       ROUND(leavers - people * 1.0 * other_leavers / other_people) AS leavers_avoided
FROM summary
ORDER BY leavers_avoided DESC;

-- Q11b. People who are both on overtime and paid under 3,000
SELECT COUNT(*) AS people,
       SUM(left_flag) AS leavers,
       ROUND(100.0 * SUM(left_flag) / COUNT(*), 1) AS attrition_pct
FROM employees
WHERE overtime = 'Yes' AND monthly_income < 3000;
