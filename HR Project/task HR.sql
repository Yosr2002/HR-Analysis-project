use depi44;
SELECT 
    Gender, 
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM dbo.depi$) AS Percentage
FROM dbo.depi$
GROUP BY Gender;

SELECT 
    CASE 
        WHEN Age BETWEEN 20 AND 30 THEN '20-30'
        WHEN Age BETWEEN 31 AND 40 THEN '31-40'
        WHEN Age BETWEEN 41 AND 50 THEN '41-50'
        ELSE '51+'
    END AS AgeGroup,
    COUNT(*) AS Count
FROM dbo.depi$
GROUP BY 
    CASE 
        WHEN Age BETWEEN 20 AND 30 THEN '20-30'
        WHEN Age BETWEEN 31 AND 40 THEN '31-40'
        WHEN Age BETWEEN 41 AND 50 THEN '41-50'
        ELSE '51+'
    END;

SELECT Attrition, COUNT(*) AS Count, 
       (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM dbo.depi$)) AS Percentage
FROM dbo.depi$
GROUP BY Attrition;

SELECT Gender, AVG(Salary) AS AvgSalary, AVG(Age) AS AvgAge
FROM dbo.depi$
WHERE Attrition = 'Yes'
GROUP BY Gender;

SELECT BusinessTravel, COUNT(*) AS Count
FROM dbo.depi$
GROUP BY BusinessTravel;

SELECT [DistanceFromHome (KM)], COUNT(*) AS Count, AVG(JobSatisfaction) AS AvgJobSatisfaction
FROM dbo.depi$
GROUP BY [DistanceFromHome (KM)]
ORDER BY[DistanceFromHome (KM)];

SELECT Salary, COUNT(*) AS Count
FROM dbo.depi$
GROUP BY Salary
ORDER BY Salary;

SELECT JobRole, AVG(Salary) AS AvgSalary
FROM dbo.depi$
GROUP BY JobRole
ORDER BY AvgSalary DESC;


SELECT 
    AVG(TRY_CAST(JobSatisfaction AS DECIMAL(10, 2))) AS AvgJobSatisfaction, 
    AVG(TRY_CAST(PerformanceID AS DECIMAL(10, 2))) AS AvgPerformance
FROM dbo.depi$;

SELECT EducationField, JobRole, COUNT(*) AS Count
FROM dbo.depi$
GROUP BY EducationField, JobRole;

SELECT JobRole, AVG(YearsSinceLastPromotion) AS AvgYearsSinceLastPromotion
FROM dbo.depi$
GROUP BY JobRole;

SELECT JobRole, AVG(WorkLifeBalance) AS AvgWorkLifeBalance
FROM dbo.depi$
GROUP BY JobRole;

SELECT TrainingOpportunitiesTaken, AVG(WorkLifeBalance) AS AvgWorkLifeBalance
FROM dbo.depi$
GROUP BY TrainingOpportunitiesTaken;

SELECT MaritalStatus, AVG(JobSatisfaction) AS AvgJobSatisfaction
FROM dbo.depi$
GROUP BY MaritalStatus;

SELECT State, COUNT(*) AS Count
FROM dbo.depi$
GROUP BY State;

SELECT 
    AVG(Salary) AS AvgSalary,
    AVG([DistanceFromHome (KM)]) AS AvgDistanceFromHome,
    AVG(YearsAtCompany) AS AvgYearsAtCompany,
    AVG(YearsWithCurrManager) AS AvgYearsWithCurrManager
FROM dbo.depi$;