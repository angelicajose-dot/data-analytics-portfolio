/*
===========================================================
Query 05 - Project Status Distribution
Author : Angelica Jose
Project: 2025 NPD SQL Portfolio
===========================================================

Business Question:
How are projects distributed across each stage of
the New Product Development (NPD) pipeline?

Objective:
Analyze the number of projects in each project
status to evaluate portfolio balance, identify
pipeline bottlenecks, and support strategic
resource planning.

SQL Skills:
• CREATE VIEW
• GROUP BY
• COUNT()
===========================================================
*/

SELECT
    ProjectStatus,
    COUNT(ProjectCode) AS TotalProjects
FROM Project
GROUP BY ProjectStatus;
GO

/*
===========================================================
Example Usage
===========================================================

SELECT *
FROM vw_ProjectStatusDistribution
ORDER BY TotalProjects DESC;

===========================================================
Business Insight
===========================================================

• The distribution of projects across each status
  provides an overview of the organization's product
  development pipeline.

• A higher number of On-going projects indicates an
  active R&D portfolio but may also suggest increased
  demand for development resources and project
  management.

• A healthy proportion of Launched projects reflects
  successful product commercialization and effective
  progression through the development process.

• Approved projects represent the transition between
  development and commercialization, helping assess
  future product launch opportunities.

• Shelved projects highlight initiatives that were
  discontinued due to technical, financial, or market
  considerations, providing valuable insights for
  improving project selection and investment
  decisions.

• Monitoring project distribution enables management
  to evaluate portfolio health, identify bottlenecks,
  and maintain a balanced pipeline across all stages
  of product development.
*/
