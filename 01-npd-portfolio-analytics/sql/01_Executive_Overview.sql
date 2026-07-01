/*
===========================================================
Query 01 - Executive Overview
Author : Angelica Jose
Project: 2025 NPD SQL Portfolio
===========================================================

Business Question:
What is the overall performance of the New Product
Development (NPD) portfolio in terms of project
count, trial activities, investment, and average
trial cost?

Objective:
Provide executives with a high-level summary of the
NPD portfolio to support strategic planning and
investment monitoring.

SQL Skills:
• COUNT(DISTINCT)
• COUNT()
• SUM()
• AVG()
• Aggregate Functions
===========================================================
*/

SELECT
    COUNT(DISTINCT p.ProjectCode) AS TotalProjects,
    COUNT(t.TrialNo) AS TotalTrials,
    SUM(t.TrialCost) AS TotalInvestment,
    AVG(t.TrialCost) AS AverageTrialCost
FROM Project p
LEFT JOIN Trial t
ON p.ProjectCode = t.ProjectCode;
GO

/*
===========================================================
Business Insight
===========================================================

• The organization is currently managing 41 active
  product development projects supported by 241
  development trials.

• A total investment exceeding ?1 million has been
  allocated to R&D trial activities, reflecting the
  company's commitment to product innovation.

• The average trial cost provides a useful benchmark
  for evaluating project efficiency and estimating
  budgets for future developments.

• This executive summary serves as the primary KPI
  dashboard for monitoring portfolio size, investment,
  and overall R&D performance.
*/
