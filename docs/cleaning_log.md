# Cleaning log

Every check comes from [sql/02_checks.sql](../sql/02_checks.sql). The data was already clean; the work was shaping it.

| What I checked | Query | Result | What I did | Why |
| --- | --- | --- | --- | --- |
| Total rows | 01_create_table.sql | 1,470 | Kept all | One row per employee |
| Repeated employee numbers | Check A | 0 | Nothing needed | Each person appears once |
| Rows with a blank | Check B | 0 | Nothing needed | No missing values |
| Columns with one value | Check C | 3 columns (employee_count, over18, standard_hours) | Dropped | A column that never changes explains nothing |
| Impossible values | Check D | 0 | Nothing needed | Ages, tenure and pay are all plausible |
| Leavers and stayers | Check E | 237 and 1,233 | Added `left_flag` (1 or 0) | A number is easier to count and average than Yes/No |
| Daily, hourly and monthly rate columns | By eye | 3 columns | Dropped | They do not match monthly income and have no clear meaning |
| Coded columns (education, job satisfaction) | By eye | 2 columns | Built lookup tables | Labels stored once and joined, not typed twice |

A clean result is still a finding: checking for duplicates and blanks and finding none is part of the work.

## Checks against Excel and Power BI

| Measure | Excel | PostgreSQL | Power BI |
| --- | --- | --- | --- |
| Employees | 1,470 | 1,470 | 1,470 |
| Leavers | 237 | 237 | 237 |
| Attrition rate | 16.1% | 16.1% | 16.1% |
| Average monthly income | 6,502.93 | 6,503 | 6,503 |
| Attrition on overtime | 30.5% | 30.5% | 30.5% |
