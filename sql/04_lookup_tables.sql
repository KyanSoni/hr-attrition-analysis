-- HR Attrition Analysis
-- 04. Lookup tables for the coded columns, and a test join
--
-- Each lookup table holds a code once with its label (a star schema:
-- one main table, employees, with small tables around it).
-- Labels are from the dataset's Kaggle description.

CREATE TABLE education_levels (
  education_id INTEGER PRIMARY KEY,
  education_level TEXT
);

INSERT INTO education_levels VALUES
  (1, 'Below College'), (2, 'College'), (3, 'Bachelor'), (4, 'Master'), (5, 'Doctor');

CREATE TABLE satisfaction_levels (
  satisfaction_id INTEGER PRIMARY KEY,
  satisfaction_level TEXT
);

INSERT INTO satisfaction_levels VALUES
  (1, 'Low'), (2, 'Medium'), (3, 'High'), (4, 'Very High');

-- Test the join. First row: employee 1, education id 2, College
SELECT e.employee_number, e.education_id, l.education_level
FROM employees e
JOIN education_levels l ON e.education_id = l.education_id
ORDER BY e.employee_number
LIMIT 5;
