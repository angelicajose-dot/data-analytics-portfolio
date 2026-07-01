/*
===========================================================
Query 06 - High-Cost Projects
Author : Angelica Jose
Project: 2025 NPD SQL Portfolio
===========================================================

Business Question:
Which projects have accumulated the highest trial
investment and may require closer financial
monitoring?

Objective:
Identify projects with total trial investments
exceeding a defined threshold to help management
monitor high-cost initiatives and evaluate resource
allocation decisions.

SQL Skills:
• CREATE VIEW
• INNER JOIN
• GROUP BY
• SUM()
• HAVING
===========================================================
*/

SELECT
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
HAVING SUM(t.TrialCost) > 50000;
GO

/*
===========================================================
Example Usage
===========================================================

SELECT *
FROM vw_HighCostProjects
ORDER BY TotalInvestment DESC;

===========================================================
Business Insight
===========================================================

• High-cost projects represent the largest consumers
  of R&D resources and should be regularly monitored
  to ensure investment remains aligned with expected
  business value.

• Projects requiring numerous trial iterations often
  accumulate higher development costs due to repeated
  formulation improvements, validation, and process
  optimization.

• Comparing high-investment projects with their
  current development status helps management
  determine whether additional funding is justified
  or if corrective actions are needed.

• Projects with significant investment but limited
  progress may indicate technical challenges,
  changing market priorities, or inefficient resource
  utilization.

• Identifying high-cost projects enables better
  budget control, investment prioritization, and
  portfolio risk management across the product
  development pipeline.
*/
