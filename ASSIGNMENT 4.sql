-- WE WILL USE CREATED TABLE FROM ASSIGNMENT 3 
-- ALREADY STUDENT TABLE IS CREATED AND INSERTED VALUES
USE ASSIGNMENT3;
SELECT *FROM STUDENTS;

-- TASK 1 : RANK STUDENTS BASED ON  TOTAL SCORES 
SELECT 
    student_id AS StudentID, name AS Name, total_score AS TotalScore,
    RANK() OVER (ORDER BY total_score DESC) AS ScoreRank
FROM Students;

-- TASK 2 : CALCULATE RUNNING TOTALS FOR MATH SCORES
SELECT 
    student_id AS StudentID, name AS Name, math_score AS MathScore,
    SUM(math_score) OVER (ORDER BY student_id) AS RunningMathTotal
FROM Students;