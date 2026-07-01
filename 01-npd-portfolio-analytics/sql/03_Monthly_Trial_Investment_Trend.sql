/*
===========================================================
Query 03 - Monthly Trial Investment Trend
Author : Angelica Jose
Project: 2025 NPD SQL Portfolio
===========================================================

Business Question:
How has R&D trial investment changed over time,
and which months incurred the highest development
costs?

Objective:
Analyze monthly trial investment trends to
identify spending patterns, monitor R&D activity,
and support budget planning throughout the year.

SQL Skills:
• CREATE VIEW
• GROUP BY
• SUM()
• YEAR()
• MONTH()
• DATENAME()
===========================================================
*/


SELECT
    YEAR(TrialDate) AS TrialYear,
    MONTH(TrialDate) AS TrialMonth,
    DATENAME(MONTH, TrialDate) AS MonthName,
    COUNT(TrialNo) AS TotalTrials,
    SUM(TrialCost) AS TotalInvestment
FROM Trial
GROUP BY
    YEAR(TrialDate),
    MONTH(TrialDate),
    DATENAME(MONTH, TrialDate);
GO

/*
===========================================================
Example Usage
===========================================================

SELECT *
FROM vw_MonthlyTrialInvestmentTrend
ORDER BY TrialYear, TrialMonth;

===========================================================
Business Insight
===========================================================

• Monthly investment trends reveal periods of high
  R&D activity and increased development spending.

• Months with the highest trial investment often
  coincide with intensive product development,
  reformulation, or scale-up activities.

• Comparing monthly trial counts with total
  investment helps determine whether higher costs
  are driven by an increased number of trials or
  by more expensive development projects.

• This analysis supports budgeting, resource
  allocation, and workload planning by identifying
  seasonal or cyclical investment patterns.

• Monitoring investment trends over time enables
  management to evaluate R&D spending efficiency
  and make informed financial decisions.
*/
