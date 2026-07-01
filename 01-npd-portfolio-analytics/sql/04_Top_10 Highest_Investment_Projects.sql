/*
===========================================================
Query 04 - Top 10 Highest Investment Projects
Author : Angelica Jose
Project: 2025 NPD SQL Portfolio
===========================================================

Business Question:
Which product development projects have received
the highest R&D investment, and how much has
been spent on each project?

Objective:
Identify the top 10 projects with the highest
trial investment to evaluate resource allocation,
monitor high-cost developments, and support
portfolio prioritization.

SQL Skills:
• CREATE VIEW
• INNER JOIN
• GROUP BY
• SUM()
• TOP
• ORDER BY
===========================================================
*/


SELECT TOP 10
    p.ProjectCode,
    p.ProjectName,
    p.ProjectStatus,
    p.RPDAssigned,
    COUNT(t.TrialNo) AS TotalTrials,
    SUM(t.TrialCost) AS TotalInvestment
FROM Project p
INNER JOIN Trial t
    ON p.ProjectCode = t.ProjectCode
GROUP BY
    p.ProjectCode,
    p.ProjectName,
    p.ProjectStatus,
    p.RPDAssigned
ORDER BY
    SUM(t.TrialCost) DESC;
GO

/*
===========================================================
Example Usage
===========================================================

SELECT *
FROM vw_Top10HighestInvestmentProjects
ORDER BY TotalInvestment DESC;

===========================================================
Business Insight
===========================================================

• The top 10 projects account for a significant
  proportion of the total R&D investment,
  highlighting the company's highest-priority
  development initiatives.

• Projects with the largest investment often
  involve multiple trial iterations, product
  optimization, or complex formulation and
  validation activities.

• Comparing total investment with the number of
  trials helps determine whether project costs
  are driven by trial frequency or higher
  per-trial expenses.

• Monitoring high-investment projects enables
  management to review project progress, assess
  return on investment, and ensure resources are
  allocated to initiatives with the greatest
  strategic value.

• This analysis supports data-driven decision
  making by identifying projects that require
  closer financial monitoring and performance
  evaluation.
*/
