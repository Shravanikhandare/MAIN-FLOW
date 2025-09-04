-- CREATE DATABASE
CREATE DATABASE ASSIGNMENT3;
SHOW DATABASES;
USE ASSIGNMENT3;

-- CREATE TABLE STUDENTS
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    math_score INT CHECK (math_score >= 0 AND math_score <= 100),
    science_score INT CHECK (science_score >= 0 AND science_score <= 100),
    english_score INT CHECK (english_score >= 0 AND english_score <= 100),
    total_score INT GENERATED ALWAYS AS (math_score + science_score + english_score) STORED
);

-- CREATE AN INDEX ON MATH_SCORE FOR QUERY OPTIMIZATION
CREATE INDEX idx_math_score ON Students(math_score);

-- INSERT DATA
INSERT INTO Students (student_id, name, math_score, science_score, english_score) VALUES
(1, 'Aarav Sharma', 85, 90, 88),
(2, 'Vivaan Patel', 92, 78, 85),
(3, 'Aditya Singh', 95, 82, 90),
(4, 'Diya Gupta', 88, 85, 92),
(5, 'Saanvi Reddy', 78, 80, 75),
(6, 'Arjun Kumar', 70, 65, 68),
(7, 'Ananya Joshi', 90, 88, 86),
(8, 'Vihaan Rao', 95, 90, 92),
(9, 'Ishita Nair', 82, 78, 80),
(10, 'Reyansh Desai', 85, 85, 85);

SELECT * FROM Students;

 -- TASK 1 : IDENTIFY TOP STUDENTS BY TOTAL SCORES
SELECT name,total_score
FROM (SELECT name, (math_score + science_score + english_score) AS total_score 
FROM Students) AS subquery
ORDER BY total_score DESC
LIMIT 5;

-- TASK 2 : CALCULATE AVERAGES BASED ON SPECIFIC CONDITIONS
-- USE SUBQUERIES TO FILTER AND GROUP DATA FOR AVERAGE CALCULATIONS
-- EXAMPLE 1 : CALCULATE THE AVERAGE SCORE OF STUDENTS WHO SCORED ABOVE 70 IN MATH

SELECT AVG(math_score) AS average_math_score
FROM (
    SELECT math_score
    FROM Students
    WHERE math_score > 70
) AS subquery_math;

-- EXAMPLE 2 : CALCULATE THE AVERAGE TOTAL SCORE FOR STUDENTS WITH TOTAL SCORE BETWEEN 200 AND 250

SELECT AVG(total_score) AS average_total_score
FROM (
    SELECT (math_score + science_score + english_score) AS total_score
    FROM Students
    WHERE (math_score + science_score + english_score) BETWEEN 200 AND 250
) AS subquery_total;

-- TASK 3 : FIND SECOND_ HIGHEST MATH SCORES
SELECT MAX(math_score) AS second_highest_math_score
FROM Students
WHERE math_score < (SELECT MAX(math_score) FROM Students);