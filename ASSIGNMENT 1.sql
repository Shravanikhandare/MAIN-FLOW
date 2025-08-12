-- CREATE DATABASE
CREATE DATABASE STUDENTMANAGEMENT;

-- USE DATABASE
USE STUDENTMANAGEMENT;

-- CREATE TABLE
CREATE TABLE STUDENTS (
       STUDENT_ID INT AUTO_INCREMENT PRIMARY KEY,
       NAME VARCHAR(50),
       GENDER VARCHAR(1),
       AGE INT,
       GRADE VARCHAR(10),
       MATHSCORE INT, 
       SCIENCESCORE INT,
       ENGLISHSCORE INT
       );
       
	-- INSERT DATA
    INSERT INTO STUDENTS(
    NAME,GENDER,AGE,GRADE,MATHSCORE,SCIENCESCORE,ENGLISHSCORE) VALUES
    ('ALICE','F',16,'A',85,90,88),
    ('BOB','M',17,'B',75,80,70),
    ('CHARLIE','M',16,'A',95,85,92),
    ('DIANA','F',17,'C',60,65,70),
    ('Ethan', 'M', 15, 'B', 78, 80, 75),
    ('Fiona', 'F', 16, 'A', 90, 92, 95),
	('George', 'M', 17, 'C', 58, 60, 65),
	('Hannah', 'F', 15, 'B', 72, 75, 78),
    ('Ian', 'M', 16, 'A', 88, 85, 89),
    ('Jane', 'F', 17, 'A', 94, 96, 97);
    
    -- QUERY 1 (Display all students and their details)
    SELECT * FROM STUDENTS;
    
    -- QUERY 2 (Calculate the average scores for each subject)
    SELECT 
    AVG(MATHSCORE) AS AVGMATHSCORE,
    AVG(SCIENCESCORE) AS AVGSCIENCESCORE,
    AVG(ENGLISHSCORE)AS AVGENGLISHSCORE
    FROM STUDENTS;
    
    -- QUERY 3 (Find the student(s) with the highest total score across all subjects)
    SELECT
    NAME,
    (MATHSCORE + SCIENCESCORE +ENGLISHSCORE ) AS TOTALSCORE
    FROM STUDENTS ORDER BY TOTALSCORE DESC
    LIMIT 1;
    
    -- QUERY 4 (Count the number of students in each grade)
    SELECT
    GRADE,
    COUNT(*) AS STUDENTCOUNT
    FROM STUDENTS GROUP BY GRADE;

-- QUERY 5 (Find the average score for male and female students)
    SELECT
    GENDER,
    AVG(MATHSCORE) AS AVGMATHSCORE,
    AVG(SCIENCESCORE) AS AVGSCIENCESCORE,
    AVG(ENGLISHSCORE) AS AVGENGLISHSCORE
    FROM STUDENTS GROUP BY GENDER;

-- QUERY 6 (Identify students whose Math score is above 80)
   SELECT
    NAME,
    MATHSCORE
    FROM STUDENTS WHERE MATHSCORE > 80;
    
-- QUERY 7 (Update the grade of a student with a specific StudentID)
    UPDATE STUDENTS
    SET GRADE = 'A+' WHERE STUDENT_ID = 3;

-- QUERY 8 (Verify the update)
SELECT * FROM STUDENTS WHERE STUDENT_ID = 3;
    


    
    
    
    