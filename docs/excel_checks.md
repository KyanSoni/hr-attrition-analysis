# Excel checks

Before loading the data into PostgreSQL, I explored a copy of the CSV in Excel (`explore.xlsx`, sheet `Data`) and recorded these numbers to check everything else against.

| Cell | Formula | What it tells you | Result |
| --- | --- | --- | --- |
| B1 | `=COUNTA(Data!A:A)-1` | Number of employees | 1,470 |
| B2 | `=COUNTIF(Data!B:B,"Yes")` | People who left | 237 |
| B3 | `=B2/B1` | Attrition rate | 16.1% |
| B4 | `=COUNTBLANK(Data!A1:AI1471)` | Empty cells | 0 |
| B5 | `=SUMPRODUCT(--(COUNTIF(Data!J2:J1471,Data!J2:J1471)>1))` | Repeated employee numbers | 0 |
| B6 | `=MIN(Data!A:A)` | Youngest age | 18 |
| B7 | `=MAX(Data!A:A)` | Oldest age | 60 |
| B8 | `=AVERAGE(Data!S:S)` | Average monthly income | 6,502.93 |
| B9 | `=MAX(Data!I:I)-MIN(Data!I:I)` | Spread of EmployeeCount | 0 |
| B10 | `=MAX(Data!AA:AA)-MIN(Data!AA:AA)` | Spread of StandardHours | 0 |
| B11 | `=COUNTIFS(Data!W:W,"Yes",Data!B:B,"Yes")/COUNTIF(Data!W:W,"Yes")` | Attrition among people on overtime | 30.5% |

A spread of 0 in B9 and B10 means every row holds the same value, so those columns were dropped in SQL.

I also built a pivot table of attrition by department, which pointed to Sales before any SQL was written.
