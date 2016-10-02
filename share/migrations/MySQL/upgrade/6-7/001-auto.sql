-- Convert schema '/home/erik/sw/own/Proto-Renata/share/migrations/_source/deploy/6/001-auto.yml' to '/home/erik/sw/own/Proto-Renata/share/migrations/_source/deploy/7/001-auto.yml':;

;
BEGIN;

;
SET foreign_key_checks=0;

;
CREATE TABLE `warning` (
  `warning_id` bigint NOT NULL auto_increment,
  `student_id` bigint NOT NULL,
  `type` varchar(255) NOT NULL,
  `info` varchar(255) NOT NULL,
  INDEX `warning_idx_student_id` (`student_id`),
  PRIMARY KEY (`warning_id`),
  CONSTRAINT `warning_fk_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

;
SET foreign_key_checks=1;

;

COMMIT;

