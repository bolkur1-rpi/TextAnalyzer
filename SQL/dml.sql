-- ------------------------------------
-- FILE FOR FUNCTIONS/STORED PROCEDURES
-- ------------------------------------

-- ------------------------------------
--    SPECIFY WHICH DATABASE TO USE
-- ------------------------------------
USE textdb;

-- ------------------------------------
--          SELECT FUNCTIONS
-- ------------------------------------

-- ------------------------------------
--       SELECT ALL STUDENT IDS
-- ------------------------------------
DROP PROCEDURE IF EXISTS getAllStudentNames;
DELIMITER $$
CREATE PROCEDURE getAllStudentNames()
BEGIN
SELECT student_name FROM student;
END $$
DELIMITER ;

-- ------------------------------------
--  SELECT STUDENT NAME BY STUDENT ID
-- ------------------------------------
DROP PROCEDURE IF EXISTS getStudentNameById;
DELIMITER $$
CREATE PROCEDURE getStudentNameById(IN student_id_var INT)
BEGIN
SELECT student_name FROM student WHERE student_id = student_id_var;
END $$
DELIMITER ;

-- ------------------------------------
--  RETURN STUDENT ID BY STUDENT NAME
-- ------------------------------------
/*
DROP PROCEDURE IF EXISTS returnStudentIdByName;
DELIMITER $$
CREATE PROCEDURE returnStudentIdByName(IN student_name_var VARCHAR(255), OUT student_id_var INT)
BEGIN
SELECT IFNULL((SELECT student_id INTO student_id_var FROM student WHERE student_name = student_name_var), 0);
END $$
DELIMITER ;
*/
-- ------------------------------------
--         SELECT ALL PAPER ID
-- ------------------------------------
DROP PROCEDURE IF EXISTS getAllPaperNames;
DELIMITER $$
CREATE PROCEDURE getAllPaperNames()
BEGIN
SELECT paper_name FROM paper;
END $$
DELIMITER ;

-- ------------------------------------
--   SELECT PAPER NAMES BY STUDENT NAME
-- ------------------------------------
DROP PROCEDURE IF EXISTS getAllPaperNamesByStudentName;
DELIMITER $$
CREATE PROCEDURE getAllPaperNamesByStudentName(IN student_name_var INT)
BEGIN
SELECT paper_name FROM paper WHERE student_name = student_name_var;
END $$
DELIMITER ;


-- ------------------------------------
--       SELECT PAPER NAME BY ID
-- ------------------------------------
DROP PROCEDURE IF EXISTS getPaperNameById;
DELIMITER $$
CREATE PROCEDURE getPaperNameById(IN paper_id_var INT)
BEGIN
SELECT paper_name FROM paper WHERE paper_id = paper_id_var;
END $$
DELIMITER ;


-- ------------------------------------
--    RETURN NUMBER OF WORDS BY ID
-- ------------------------------------
DROP PROCEDURE IF EXISTS getNumberOfWordsByPaperName;
DELIMITER $$
CREATE PROCEDURE getNumberOfWordsByPaperName(IN paper_name_var INT)
BEGIN
SELECT number_of_words FROM paper WHERE paper_name = paper_name_var;
END $$
DELIMITER ;


-- ------------------------------------
-- RETURN NUMBER OF UNIQUE WORDS BY ID
-- ------------------------------------
DROP PROCEDURE IF EXISTS getNumberOfUniqueWordsByPaperName;
DELIMITER $$
CREATE PROCEDURE getNumberOfUniqueWordsByPaperName(IN paper_name_var INT)
BEGIN
SELECT number_of_unique_words FROM paper WHERE paper_name = paper_name_var;
END $$
DELIMITER ;

-- ------------------------------------
--          INSERT FUNCTIONS
-- ------------------------------------

-- ------------------------------------
--         CREATE NEW STUDENT
-- ------------------------------------
DROP PROCEDURE IF EXISTS createNewStudent;
DELIMITER $$
CREATE PROCEDURE createNewStudent(IN student_name_var VARCHAR(255))
BEGIN
INSERT INTO student(student_name)
VALUES (student_name_var);
END $$
DELIMITER ;

-- ------------------------------------
--          CREATE NEW PAPER
-- ------------------------------------
DROP PROCEDURE IF EXISTS createNewPaper;
DELIMITER $$
CREATE PROCEDURE createNewPaper(IN paper_name_var VARCHAR(255), IN paper_display_name_var VARCHAR(255), IN number_of_words_var INT, IN number_of_unique_words_var INT, IN student_name_var VARCHAR(255))
BEGIN
DECLARE student_id_var INT;
DECLARE student_exists INT; -- 1 if it exists, 0 if it doesnt exist
DECLARE last_auto_increment INT;
-- If student name exists, create new paper, if it doesnt exist then create new student, then create new paper
SET student_exists = 1;
SET student_exists = (SELECT IF(EXISTS(SELECT student_id FROM student WHERE student_name = student_name_var), 1, 0));
-- SET student_exists = (SELECT IF (IFNULL((SELECT student_id INTO student_id_var FROM student WHERE student_name = student_name_var), 1) = 1), 1, 0);
-- If student exists, create new paper
IF (SELECT student_exists = 1) THEN
        SET student_id_var = (SELECT student_id FROM student WHERE student_name = student_name_var);
        INSERT INTO paper(paper_name, paper_display_name, number_of_words, number_of_unique_words, student_id)
        VALUES (paper_name_var, paper_display_name_var, number_of_words_var, number_of_unique_words_var, student_id_var);
END IF;
-- If student doesnt exist, create new student and new paper
IF (SELECT student_exists = 0) THEN
        INSERT INTO student(student_name)
        VALUES (student_name_var);
        SET student_id_var = LAST_INSERT_ID();
        INSERT INTO paper(paper_name, paper_display_name, number_of_words, number_of_unique_words, student_id)
        VALUES (paper_name_var, paper_display_name_var, number_of_words_var, number_of_unique_words_var, student_id_var);
END IF;
END $$
DELIMITER ;
/*
DROP PROCEDURE IF EXISTS createNewPaper;
DELIMITER $$
CREATE PROCEDURE createNewPaper(IN paper_name_var VARCHAR(255), IN paper_display_name_var VARCHAR(255), IN number_of_words_var INT, IN number_of_unique_words_var INT, IN student_name_var INT)
BEGIN
DECLARE student_id_temp_var INT;
DECLARE student_exists INT; -- 1 if it exists, 0 if it doesnt exist
-- If student name exists, create new paper, if it doesnt exist then create new student, then create new paper

SET student_exists = (SELECT IF (IFNULL((SELECT student_id INTO student_id_temp_var FROM student WHERE student_name = student_name_var), 1) = 1), 1, 0);
IF SELECT student_exists = 1 THEN


SELECT IF(, "Yes: Create Paper", "No: Create Student, then create paper");
-- CALL returnStudentIdByName(student_name_var, student_id_temp_var);
SELECT @student_id_temp_var;
INSERT INTO paper(paper_name, paper_display_name, number_of_words, number_of_unique_words, student_id)
VALUES (paper_name_var, paper_display_name_var, number_of_words_var, number_of_unique_words_var, student_id_var);
END $$
DELIMITER ;
*/