/*
===========================================================
Query 08 - Project Development Timeline
Author : Angelica Jose
Project: 2025 NPD SQL Portfolio
===========================================================

Business Question:
How long does each project take to progress from
its first development trial to its most recent
trial?

Objective:
Measure the development duration of each project
to identify lengthy development cycles, monitor
project progress, and support process improvement
initiatives.

SQL Skills:
• CREATE VIEW
• INNER JOIN
• GROUP BY
• MIN()
• MAX()
• DATEDIFF()
===========================================================
*/

SELECT
    p.ProjectCode,
    p.ProjectName,
    p.ProjectStatus,
    p.RPDAssigned,
    MIN(t.TrialDate) AS FirstTrialDate,
    MAX(t.TrialDate) AS LatestTrialDate,
    COUNT(t.TrialNo) AS TotalTrials,
    DATEDIFF(
		DAY,
		MIN(t.TrialDate),
		'2026-12-19'
	) AS DevelopmentDurationDays
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
FROM vw_ProjectDevelopmentTimeline
ORDER BY DevelopmentDurationDays DESC;

===========================================================
Business Insight
===========================================================

• Measuring the development timeline provides
  visibility into how long each project remains in
  the R&D pipeline before reaching completion or its
  current stage.

• Projects with longer development durations may
  indicate complex product formulations, multiple
  reformulations, regulatory requirements, or
  repeated validation trials.

• Comparing development duration with the number of
  trials helps determine whether extended timelines
  are driven by technical complexity or process
  inefficiencies.

• Projects with relatively short timelines and
  successful completion may serve as benchmarks for
  improving future product development efficiency.

• Monitoring project development timelines enables
  management to identify bottlenecks, optimize
  resource allocation, and reduce time-to-market for
  new product launches.
*/
