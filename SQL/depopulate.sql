-- ----------------------------------------
--     FILE TO DEPOPULATE DATABASE
-- ----------------------------------------
USE textdb;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE student;
TRUNCATE TABLE paper;
SET FOREIGN_KEY_CHECKS = 1;