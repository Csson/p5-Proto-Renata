-- Convert schema '/home/erik/sw/own/Proto-Renata/share/migrations/_source/deploy/9/001-auto.yml' to '/home/erik/sw/own/Proto-Renata/share/migrations/_source/deploy/10/001-auto.yml':;

;
BEGIN;

;
SET foreign_key_checks=0;

;
CREATE TABLE `studentcard` (
  `studentcard_id` bigint NOT NULL auto_increment,
  `student_id` bigint NOT NULL,
  `heading` varchar(255) NOT NULL,
  `info` varchar(255) NOT NULL,
  INDEX `studentcard_idx_student_id` (`student_id`),
  PRIMARY KEY (`studentcard_id`),
  CONSTRAINT `studentcard_fk_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

;
SET foreign_key_checks=1;

;

COMMIT;

