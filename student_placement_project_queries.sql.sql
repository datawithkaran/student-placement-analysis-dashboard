CREATE DATABASE student_placement_project;

USE student_placement_project;

SELECT * FROM Student_Data LIMIT 10;

-- 1. Total Students
SELECT COUNT(*) AS total_students
FROM Student_Data;

-- 2.Placed Students
SELECT COUNT(*) AS placed_students
FROM Student_Data
WHERE Placement_Status = 'Placed';

-- 3.Not Placed Students
SELECT COUNT(*) AS not_placed_students
FROM Student_Data
WHERE Placement_Status = 'Not Placed';

-- 4. Placement Rate %
SELECT 
ROUND(
COUNT(CASE WHEN Placement_Status = 'Placed' THEN 1 END) * 100.0 / COUNT(*), 2
) AS placement_rate
FROM Student_Data;

-- 5.Department-wise Student Count
SELECT Department, COUNT(*) AS total_students
FROM Student_Data
GROUP BY Department;

-- 6. Department-wise placed students
SELECT Department,
COUNT(*) AS total_students,
COUNT(CASE WHEN Placement_Status = 'Placed' THEN 1 END) AS placed_students
FROM Student_Data
GROUP BY Department;

-- 7. Department-wise placement rate
SELECT Department,
ROUND(
COUNT(CASE WHEN Placement_Status = 'Placed' THEN 1 END) * 100.0 / COUNT(*), 2
) AS placement_rate
FROM Student_Data
GROUP BY Department;

-- 8. Average package
SELECT ROUND(AVG(Package_LPA),2) AS avg_package
FROM Student_Data
WHERE Placement_Status = 'Placed';

-- 9. Highest package
SELECT Name, Department, Company_Name, Package_LPA
FROM Student_Data
WHERE Placement_Status = 'Placed'
ORDER BY Package_LPA DESC
LIMIT 5;

-- 10. Internship impact
SELECT Internship,
COUNT(*) AS total_students,
COUNT(CASE WHEN Placement_Status = 'Placed' THEN 1 END) AS placed_students
FROM Student_Data
GROUP BY Internship;

-- 11. Communication Score vs Placement
SELECT Placement_Status,
ROUND(AVG(Communication_Score),2) AS avg_communication
FROM Student_Data
GROUP BY Placement_Status;

-- 12. Backlogs Impact
SELECT Backlogs,
COUNT(CASE WHEN Placement_Status='Placed' THEN 1 END) AS placed_students
FROM Student_Data
GROUP BY Backlogs
ORDER BY Backlogs;

-- 13. Performance Level Analysis
SELECT Performance_Level,
COUNT(*) AS total_students,
COUNT(CASE WHEN Placement_Status='Placed' THEN 1 END) AS placed_students
FROM Student_Data
GROUP BY Performance_Level;

-- 14. Placement Category Count
SELECT Placement_Category,
COUNT(*) AS total_students
FROM Student_Data
GROUP BY Placement_Category;

-- 15. Top Departments by Average Package
SELECT Department,
ROUND(AVG(Package_LPA),2) AS avg_package
FROM Student_Data
WHERE Placement_Status='Placed'
GROUP BY Department
ORDER BY avg_package DESC;

-- 16. Students with Highest Technical Skills
SELECT Name, Department, Technical_Skills_Score
FROM Student_Data
ORDER BY Technical_Skills_Score DESC
LIMIT 10;

-- 17. Students Having Both Internship & Placement
SELECT Name, Department, Company_Name, Package_LPA
FROM Student_Data
WHERE Internship='Completed'
AND Placement_Status='Placed';

-- 18. Gender-wise Placement Analysis
SELECT Gender,
COUNT(*) AS total_students,
COUNT(CASE WHEN Placement_Status='Placed' THEN 1 END) AS placed_students
FROM Student_Data
GROUP BY Gender;