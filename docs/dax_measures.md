# Power BI model and measures (DAX)

## Model

Power BI connects straight to PostgreSQL (Get data > PostgreSQL database, Import mode) and loads three tables:

| From | To | Cardinality |
| --- | --- | --- |
| employees[education_id] | education_levels[education_id] | Many to one |
| employees[satisfaction_id] | satisfaction_levels[satisfaction_id] | Many to one |

Sort by column: `age_band` by `age_sort`, `tenure_band` by `tenure_sort`, `income_band` by `income_sort`, `education_level` by `education_id`, `satisfaction_level` by `satisfaction_id`.

## Measures (stored in the employees table)

```dax
Headcount = COUNTROWS(employees)
Leavers = SUM(employees[left_flag])
Attrition Rate = DIVIDE([Leavers], [Headcount])
Avg Monthly Income = AVERAGE(employees[monthly_income])
Avg Tenure = AVERAGE(employees[years_at_company])
```

## Card labels

These show numbers in full on the cards (for example 1,470 rather than 1K).

```dax
Headcount Label = FORMAT([Headcount], "#,0")
Leavers Label = FORMAT([Leavers], "#,0")
Avg Income Label = FORMAT([Avg Monthly Income], "#,0")
```

## Why left_flag

Storing leaving as 1 or 0 means one column does two jobs: its sum is the number of leavers, and its average is the attrition rate.
