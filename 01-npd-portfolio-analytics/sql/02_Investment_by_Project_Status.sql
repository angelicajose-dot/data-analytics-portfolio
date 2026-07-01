/*
===========================================================
Query 02 - Investment by Project Status
Author : Angelica Jose
Project: 2025 NPD SQL Portfolio
===========================================================

Business Question:
How much investment has been allocated to each
project status, and how many projects belong
to each stage of the product development
pipeline?

Objective:
Analyze the distribution of projects and trial
investments across different project statuses
to understand where R&D resources are primarily
allocated.

SQL Skills:
• CREATE VIEW
• INNER JOIN
• GROUP BY
• COUNT(DISTINCT)
• SUM()
• ORDER BY
===========================================================
*/


SELECT
    p.ProjectStatus,
    COUNT(DISTINCT p.ProjectCode) AS TotalProjects,
    SUM(t.TrialCost) AS TotalInvestment
FROM Project p
INNER JOIN Trial t
    ON p.ProjectCode = t.ProjectCode
GROUP BY p.ProjectStatus;
GO

/*
===========================================================
Example Usage
===========================================================

SELECT *
FROM vw_InvestmentByProjectStatus
ORDER BY TotalInvestment DESC;

===========================================================
Business Insight
===========================================================

• On-going projects account for the highest share
  of R&D investment, indicating that most financial
  resources are concentrated on active product
  development.

• Approved projects continue to receive substantial
  investment as they progress toward validation,
  commercialization, or production readiness.

• Launched projects typically require fewer trial
  investments because major development activities
  have already been completed.

• Shelved projects represent the smallest investment
  allocation, suggesting that lower-potential
  initiatives are discontinued early to reduce
  unnecessary costs.

• Understanding investment distribution by project
  status helps management evaluate portfolio balance,
  optimize resource allocation, and prioritize future
  development activities.
*/
