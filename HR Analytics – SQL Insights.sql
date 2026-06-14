Select * from HR_Table

--Checking and Updating EmpID To Unique Value

SELECT Employee_Name,
       COUNT(DISTINCT EmpID) AS Distinct_EmpIDs
FROM HR_Table
GROUP BY Employee_Name
HAVING COUNT(DISTINCT EmpID) > 1;


--Checking and Updating DeptID To Unique Value 

select DeptID ,Department from HR_Table
select DeptID ,Department from HR_Table where Department = 'Production' 

UPDATE HR_Table
SET DeptID =
    CASE
        WHEN Department = 'Admin Offices' THEN 1
        WHEN Department = 'Executive Office' THEN 2
        WHEN Department = 'IT/IS' THEN 3
        WHEN Department = 'Software Engineering' THEN 4
        WHEN Department = 'Production' THEN 5
        WHEN Department = 'Sales' THEN 6
        ELSE DeptID
    END;


SELECT Department,
       COUNT(DISTINCT DeptID) AS Distinct_DeptIDs
FROM HR_Table
GROUP BY Department
HAVING COUNT(DISTINCT DeptID) > 1;

--Checking and Updating EmpStatusID To Unique Value and Remapping

SELECT EmploymentStatus,
       EmpStatusID,
       COUNT(*) AS Cnt
FROM HR_Table
GROUP BY EmploymentStatus, EmpStatusID;


SELECT DISTINCT EmpStatusID, EmploymentStatus
FROM HR_Table
ORDER BY EmpStatusID;

UPDATE HR_Table
SET EmpStatusID =
    CASE
        WHEN EmploymentStatus = 'Active' THEN 1
        WHEN EmploymentStatus = 'Terminated for Cause' THEN 2
        WHEN EmploymentStatus = 'Voluntarily Terminated' THEN 3
        ELSE EmpStatusID
    END;

SELECT COUNT(DISTINCT EmpStatusID) AS Distinct_EmpStatusIDs,
       EmploymentStatus
FROM HR_Table
GROUP BY EmploymentStatus
HAVING COUNT(DISTINCT EmpStatusID) > 1;

--Checking and Updating EmpStatusID To Unique Value and Remapping

SELECT DISTINCT PerfScoreID, PerformanceScore
FROM HR_Table
ORDER BY PerfScoreID;

Select PerfScoreID, PerformanceScore , Count (*) as cnt from HR_Table group by PerfScoreID, PerformanceScore

UPDATE HR_Table
SET PerfScoreID =
    CASE
        WHEN PerformanceScore = 'PIP' THEN 1
        WHEN PerformanceScore = 'Needs Improvement' THEN 2
        WHEN PerformanceScore = 'Fully Meets' THEN 3
        WHEN PerformanceScore = 'Exceeds' THEN 4

        ELSE PerfScoreID
    END;

Select Distinct PerfScoreID ,  PerformanceScore from HR_Table order by PerfScoreID


--Checking and Updating Position ID To Unique Value and Remapping

Select Distinct Position , PositionID from HR_Table order by PositionID

Update HR_Table
set PositionID = 17
where Position = 'Production Manager'

Update HR_Table
set PositionID = 24
where Position = 'Software Engineer'


--Checking and Updating ManagerID To Unique Value

SELECT ManagerName,
       COUNT(DISTINCT ManagerID) AS Distinct_ManagerIDs
FROM HR_Table
GROUP BY ManagerName
HAVING COUNT(DISTINCT ManagerID) > 1;

Select ManagerName ,ManagerID from HR_Table where ManagerName = 'Brandon R. LeBlanc'

Update HR_Table
set ManagerID = 1
where ManagerName = 'Brandon R. LeBlanc'

Select ManagerName ,ManagerID from HR_Table where ManagerName = 'Michael Albert'

Update HR_Table
set ManagerID = 22
where ManagerName = 'Michael Albert'


--Checking and Updating Termd To Unique Value

Select Distinct Termd , TermReason from HR_Table



-- Q1: How many employees are active vs terminated in each department?

SELECT
    Department,
    IsActive,
    COUNT(*) AS HeadCount
FROM HR_Table
GROUP BY Department, IsActive
ORDER BY Department, IsActive;


-- Q2: Which department has the highest employee turnover rate?

SELECT
    Department,
    COUNT(*) AS Total,
    SUM(Termd) AS Terminated,
    ROUND(
        CAST(SUM(Termd) AS FLOAT) / COUNT(*) * 100, 2
    ) AS TurnoverRate_Pct
FROM HR_Table
GROUP BY Department
ORDER BY TurnoverRate_Pct DESC;

-- Q3: Is there a gender pay gap across departments?

SELECT
    Department,
    Sex,
    ROUND(AVG(CAST(Salary AS FLOAT)), 2) AS AvgSalary,
    MIN(Salary) AS MinSalary,
    MAX(Salary) AS MaxSalary
FROM HR_Table
GROUP BY Department, Sex
ORDER BY Department, Sex;


-- Q4: Why are employees leaving the company?

SELECT
    TermReason,
    COUNT(*) AS Count
FROM HR_Table
WHERE Termd = 1
GROUP BY TermReason
ORDER BY Count DESC;


-- Q5: How long do employees typically stay in each department?

SELECT
    Department,
    ROUND(AVG(TenureYears), 2) AS AvgTenure,
    MIN(TenureYears) AS MinTenure,
    MAX(TenureYears) AS MaxTenure
FROM HR_Table
GROUP BY Department
ORDER BY AvgTenure DESC;


-- Q6: What percentage of employees are high performers?

SELECT
    PerformanceScore,
    COUNT(*) AS Count,
    ROUND(
        CAST(COUNT(*) AS FLOAT) /
        (SELECT COUNT(*) FROM HR_Table) * 100, 2
    ) AS Percentage
FROM HR_Table
GROUP BY PerformanceScore
ORDER BY Count DESC;


-- Q7: Which recruitment source brings the most satisfied, long-staying employees?

SELECT
    RecruitmentSource,
    COUNT(*) AS TotalHired,
    ROUND(AVG(CAST(EmpSatisfaction AS FLOAT)), 2) AS AvgSatisfaction,
    ROUND(AVG(TenureYears), 2) AS AvgTenure
FROM HR_Table
GROUP BY RecruitmentSource
ORDER BY AvgSatisfaction DESC;


-- Q8: Which departments have the most absences and late arrivals?

SELECT
    Department,
    ROUND(AVG(CAST(Absences AS FLOAT)), 2) AS AvgAbsences,
    ROUND(AVG(CAST(DaysLateLast30 AS FLOAT)), 2) AS AvgDaysLate
FROM HR_Table
GROUP BY Department
ORDER BY AvgAbsences DESC;


-- Q9: Which manager has the highest team turnover rate?

SELECT
    ManagerName,
    COUNT(*) AS TotalTeam,
    SUM(Termd) AS Terminated,
    ROUND(
        CAST(SUM(Termd) AS FLOAT) / COUNT(*) * 100, 2
    ) AS TurnoverRate_Pct
FROM HR_Table
GROUP BY ManagerName
ORDER BY TurnoverRate_Pct DESC;


-- Q10: Do older employees perform better and earn more than younger ones?

SELECT
    AgeGroup,
    COUNT(*) AS Count,
    ROUND(AVG(CAST(EmpSatisfaction AS FLOAT)), 2) AS AvgSatisfaction,
    ROUND(AVG(EngagementSurvey), 2) AS AvgEngagement,
    ROUND(AVG(CAST(Salary AS FLOAT)), 2) AS AvgSalary
FROM HR_Table
GROUP BY AgeGroup
ORDER BY AgeGroup;

