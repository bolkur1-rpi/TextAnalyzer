DROP DATABASE IF EXISTS textdb;
CREATE DATABASE textdb;

USE textdb;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS student;
SET FOREIGN_KEY_CHECKS = 1;
CREATE TABLE student(
    student_id INT NOT NULL AUTO_INCREMENT,
    student_name VARCHAR(255) NOT NULL UNIQUE,
    PRIMARY KEY (student_id)
);

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS paper;
SET FOREIGN_KEY_CHECKS = 1;
CREATE TABLE paper(
    paper_id INT NOT NULL AUTO_INCREMENT,
    paper_name VARCHAR(255) NOT NULL UNIQUE,
    paper_display_name VARCHAR(255) NOT NULL,
    number_of_words INT NOT NULL,
    number_of_unique_words INT NOT NULL,
    number_of_sentences INT NOT NULL,
    number_of_paragraphs INT NOT NULL,
    words_per_sentence FLOAT NOT NULL,
    sentences_per_paragraph FLOAT NOT NULL,
    student_id INT,
    PRIMARY KEY (paper_id),
    FOREIGN KEY(student_id) REFERENCES student(student_id)
);
