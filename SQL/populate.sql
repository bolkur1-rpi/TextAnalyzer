-- ----------------------------------------
--     FILE TO POPULATE DATABASE
-- ----------------------------------------

-- ----------------------------------------
--     SPECIFY WHICH DATABASE TO USE
-- ----------------------------------------
USE textdb;

-- ----------------------------------------
--     EMPTY STUDENT AND PAPER TABLES
-- ----------------------------------------
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE student;
TRUNCATE TABLE paper;
SET FOREIGN_KEY_CHECKS = 1;
-- ----------------------------------------
--     CALL INSERT FUNCTIONS
-- ----------------------------------------

-- ----------------------------------------
-- Function createNewStudent(
-- 	VARCHAR(255)
-- ) 
-- takes one(1) parameter: student_name.
-- Variable student_id is automatically
-- inserted.
-- ----------------------------------------

-- student_id: 1
CALL createNewStudent('Jogvan');
-- student_id: 2
CALL createNewStudent('Olivur');
-- student_id: 3
CALL createNewStudent('Johan Bjartur');
-- student_id: 4
CALL createNewStudent('Ingmar');
-- student_id: 5
CALL createNewStudent('Teitur');
-- student_id: 6
CALL createNewStudent('Per');
-- student_id: 7
CALL createNewStudent('Oli');

-- ----------------------------------------
-- Function createNewPaper(
-- 	VARCHAR(255)
-- 	INT
-- 	INT
-- 	INT
-- )
-- takes four(4) parameters:
-- 	paper_name,
-- 	number_of_words,
-- 	number_of_unique_words,
-- 	student_id
-- Variable paper_id is automatically
-- inserted.
-- ----------------------------------------

-- paper_id: 1
CALL createNewPaper('filename1', 'Uppgava hja Jogvan', 600, 5, 1);
-- paper_id: 2
CALL createNewPaper('filename2', 'Uppgava hja Olivur', 250, 20, 2);
-- paper_id: 3
CALL createNewPaper('filename3', 'Uppgava hja Johan Bjartur', 820, 100, 3);
-- paper_id: 4
CALL createNewPaper('filename4', 'Uppgava hja Ingmar', 500, 499, 4);
-- paper_id: 5
CALL createNewPaper('filename5', 'Uppgava hja Teitur', 120, 50, 5);
-- paper_id: 6
CALL createNewPaper('filename6', 'Uppgava hja Per', 720, 75, 6);
-- paper_id: 7
CALL createNewPaper('filename7', 'Uppgava hja Per', 230, 50, 7);
-- paper_id: 8
CALL createNewPaper('filename8', 'Roman', 10000, 500, 1);
-- paper_id: 9
CALL createNewPaper('filename9', 'Novel', 1200, 460, 2);
-- paper_id: 10
CALL createNewPaper('filename10', 'Stuttsoga', 800, 200, 3);
-- paper_id: 11
CALL createNewPaper('filename11', 'Ordabok', 75000, 75000, 4);
-- paper_id: 12
CALL createNewPaper('filename12', 'Dokumentation', 2400, 320, 5);
-- paper_id: 13
CALL createNewPaper('filename13', 'Notatir', 76, 50, 7);
-- paper_id: 14
CALL createNewPaper('filename14', 'Dagbok', 760, 165, 1);

