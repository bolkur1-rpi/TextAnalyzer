USE textdb;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS student;
SET FOREIGN_KEY_CHECKS = 1;
CREATE TABLE student(
    student_name varchar(255) NOT NULL UNIQUE,
    PRIMARY KEY (student_name)
);

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS paper;
SET FOREIGN_KEY_CHECKS = 1;
CREATE TABLE paper(
    paper_name varchar(255) NOT NULL UNIQUE,
    paper_display_name varchar(255) NOT NULL,
    number_of_words int NOT NULL,
    number_of_unique_words int NOT NULL,
    student_name VARCHAR(255),
    PRIMARY KEY (paper_name),
    FOREIGN KEY(student_name) REFERENCES student(student_name)
);
