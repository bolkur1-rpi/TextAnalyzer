USE textdb;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS student;
SET FOREIGN_KEY_CHECKS = 1;
CREATE TABLE student(
    student_id int NOT NULL AUTO_INCREMENT,
    student_name varchar(255) NOT NULL UNIQUE,
    PRIMARY KEY (student_id)
);

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS paper;
SET FOREIGN_KEY_CHECKS = 1;
CREATE TABLE paper(
    paper_id int NOT NULL AUTO_INCREMENT,
    paper_name varchar(255) NOT NULL UNIQUE,
    paper_display_name varchar(255) NOT NULL,
    number_of_words int NOT NULL,
    number_of_unique_words int NOT NULL,
    student_id int,
    PRIMARY KEY (paper_id),
    FOREIGN KEY(student_id) REFERENCES student(student_id)
);