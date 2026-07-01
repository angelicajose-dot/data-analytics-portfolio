/*
===========================================================
Query 09 - RPD Specialist Performance
Author : Angelica Jose
Project: 2025 NPD SQL Portfolio
===========================================================

Business Question:
How does each RPD Specialist perform in terms of
project ownership, trial activities, and total
R&D investment?

Objective:
Evaluate the workload and investment managed by
each RPD Specialist to support resource planning,
performance evaluation, and workload balancing
across the R&D team.

SQL Skills:
• CREATE VIEW
• INNER JOIN
• GROUP BY
• COUNT(DISTINCT)
• COUNT()
• SUM()
• AVG()
===========================================================
*/


SELECT
    p.RPDAssigned,
    COUNT(DISTINCT p.ProjectCode) AS TotalProjects,
    COUNT(t.TrialNo) AS TotalTrials,
    SUM(t.TrialCost) AS TotalInvestment,
    AVG(t.TrialCost) AS AverageTrialCost
FROM Project p
INNER JOIN Trial t
    ON p.ProjectCode = t.ProjectCode
GROUP BY
    p.RPDAssigned;
GO

/*
===========================================================
Example Usage
===========================================================

SELECT *
FROM vw_RPDSpecialistPerformance
ORDER BY TotalInvestment DESC;

===========================================================
Business Insight
===========================================================

• Comparing specialist performance provides
  visibility into how projects, trial activities,
  and R&D investments are distributed across the
  development team.

• Specialists managing a larger number of projects
  and trials typically carry a higher workload and
  may require additional resources or support to
  maintain project timelines.

• Higher total investment does not necessarily
  indicate better performance; it may reflect the
  complexity, scope, or strategic importance of the
  assigned projects.

• Average trial cost serves as a useful benchmark
  for comparing spending patterns among specialists
  and identifying opportunities to improve cost
  efficiency.

• This analysis helps management balance workloads,
  allocate resources effectively, and monitor team
  performance to ensure successful execution of the
  product development portfolio.
*/
