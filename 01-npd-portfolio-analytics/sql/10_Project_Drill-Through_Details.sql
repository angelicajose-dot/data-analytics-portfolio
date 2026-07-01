/*
===========================================================
Query 10 - Project Drill-Through Details
Author : Angelica Jose
Project: 2025 NPD SQL Portfolio
===========================================================

Business Question:
What are the detailed trial records, project
information, and investment history for each
individual product development project?

Objective:
Provide a detailed project-level dataset that
enables users to drill through from summary
dashboard visuals into the complete trial history
of a selected project for further analysis.

SQL Skills:
• CREATE VIEW
• INNER JOIN
• SELECT
===========================================================
*/

SELECT
    p.ProjectCode,
    p.ProjectName,
    p.ProjectStatus,
    p.RPDAssigned,
    t.TrialNo,
    t.TrialDate,
    t.TrialCost
FROM Project p
INNER JOIN Trial t
    ON p.ProjectCode = t.ProjectCode;
GO

/*
===========================================================
Example Usage
===========================================================

SELECT *
FROM vw_ProjectDrillthrough
WHERE ProjectCode = 'P001'
ORDER BY TrialDate;

===========================================================
Business Insight
===========================================================

• This view provides a comprehensive record of every
  development trial conducted for each project,
  allowing stakeholders to investigate individual
  project performance beyond summary dashboards.

• Users can review the complete trial history,
  including trial sequence, investment amount, and
  development timeline for any selected project.

• Project drill-through enables managers to identify
  projects with frequent trial iterations, unusually
  high trial costs, or extended development periods
  that may require additional review.

• Combining project information with trial-level data
  improves traceability, supports root cause
  analysis, and provides greater transparency into
  R&D activities.

• This view serves as the detailed data source for
  Power BI drill-through pages, allowing users to
  seamlessly navigate from executive summaries to
  project-specific insights for informed decision-
  making.
*/
