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
--       RETURNS ALL STUDENT IDS
-- ------------------------------------
DROP PROCEDURE IF EXISTS getAllStudentId;
DELIMITER $$
CREATE PROCEDURE getAllStudentId()
BEGIN
SELECT student_id FROM student;
END $$
DELIMITER ;

-- ------------------------------------
--  RETURN STUDENT NAME BY STUDENT ID
-- ------------------------------------
DROP PROCEDURE IF EXISTS getStudentNameById;
DELIMITER $$
CREATE PROCEDURE getStudentNameById(IN student_id_var INT)
BEGIN
SELECT student_name FROM student WHERE student_id = student_id_var;
END $$
DELIMITER ;

-- ------------------------------------
--         RETURNS ALL PAPER ID
-- ------------------------------------
DROP PROCEDURE IF EXISTS getAllPaperId;
DELIMITER $$
CREATE PROCEDURE getAllPaperId()
BEGIN
SELECT paper_id FROM paper;
END $$
DELIMITER ;

-- ------------------------------------
--   RETURNS PAPER IDS BY STUDENT ID
-- ------------------------------------
DROP PROCEDURE IF EXISTS getAllPaperIdByStudentId;
DELIMITER $$
CREATE PROCEDURE getAllPaperIdByStudentId(IN student_id_var INT)
BEGIN
SELECT paper_id FROM paper WHERE student_id = student_id_var;
END $$
DELIMITER ;


-- ------------------------------------
--       RETURN PAPER NAME BY ID
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
DROP PROCEDURE IF EXISTS getNumberOfWordsById;
DELIMITER $$
CREATE PROCEDURE getNumberOfWordsById(IN paper_id_var INT)
BEGIN
SELECT number_of_words FROM paper WHERE paper_id = paper_id_var;
END $$
DELIMITER ;


-- ------------------------------------
-- RETURN NUMBER OF UNIQUE WORDS BY ID
-- ------------------------------------
DROP PROCEDURE IF EXISTS getNumberOfUniqueWordsById;
DELIMITER $$
CREATE PROCEDURE getNumberOfUniqueWordsById(IN paper_id_var INT)
BEGIN
SELECT number_of_unique_words FROM paper WHERE paper_id = paper_id_var;
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
CREATE PROCEDURE createNewPaper(IN paper_name_var VARCHAR(255), IN paper_display_name_var VARCHAR(255), IN paper_display_name_var, IN number_of_words_var INT, IN number_of_unique_words_var INT, IN student_id_var INT)
BEGIN
INSERT INTO paper(paper_name, paper_display_name, number_of_words, number_of_unique_words, student_id)
VALUES (paper_name_var, paper_display_name_var, number_of_words_var, number_of_unique_words_var, student_id_var);
END $$
DELIMITER ;


-- ------------------------------------
--      
-- ------------------------------------