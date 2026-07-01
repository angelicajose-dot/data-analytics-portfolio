/*
===========================================================
Query 07 - Project Investment Ranking
Author : Angelica Jose
Project: 2025 NPD SQL Portfolio
===========================================================

Business Question:
Which projects have received the highest total
investment, and how do they rank relative to
one another?

Objective:
Rank projects based on cumulative trial investment
to identify the most resource-intensive initiatives
and support investment prioritization across the
NPD portfolio.

SQL Skills:
• CREATE VIEW
• INNER JOIN
• GROUP BY
• SUM()
• RANK() OVER()
• Window Functions
===========================================================
*/


SELECT
    p.ProjectCode,
    p.ProjectName,
    p.ProjectStatus,
    p.RPDAssigned,
    COUNT(t.TrialNo) AS TotalTrials,
    SUM(t.TrialCost) AS TotalInvestment,
    RANK() OVER (
        ORDER BY SUM(t.TrialCost) DESC
    ) AS ProjectRank
FROM Project p
INNER JOIN Trial t
    ON p.ProjectCode = t.ProjectCode
GROUP BY
    p.ProjectCode,
    p.ProjectName,
    p.ProjectStatus,
    p.RPDAssigned;
GO

/*
===========================================================
Example Usage
===========================================================

SELECT *
FROM vw_ProjectInvestmentRanking
ORDER BY ProjectRank;

===========================================================
Business Insight
===========================================================

• Ranking projects by total investment highlights
  which initiatives consume the greatest share of
  R&D resources.

• Top-ranked projects are typically strategic
  initiatives requiring multiple development trials,
  extensive formulation work, or large-scale
  validation activities.

• Comparing project rank with development status
  enables management to evaluate whether investment
  levels are aligned with project progress and
  commercialization potential.

• Lower-ranked projects generally require fewer
  resources, making them suitable candidates for
  rapid development or lower-risk innovation.

• This ranking supports portfolio reviews, budget
  prioritization, and executive decision-making by
  providing a clear comparison of investment across
  all projects.
*/
