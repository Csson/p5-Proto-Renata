-- Convert schema '/home/erik/sw/own/Proto-Renata/share/migrations/_source/deploy/7/001-auto.yml' to '/home/erik/sw/own/Proto-Renata/share/migrations/_source/deploy/8/001-auto.yml':;

;
BEGIN;

;
SET foreign_key_checks=0;

;
CREATE TABLE `guardian` (
  `guardian_id` bigint NOT NULL auto_increment,
  `student_id` bigint NOT NULL,
  `post_address` text NOT NULL,
  `phone` varchar(255) NOT NULL,
  `work_phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  INDEX `guardian_idx_student_id` (`student_id`),
  PRIMARY KEY (`guardian_id`),
  CONSTRAINT `guardian_fk_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

;

;
ALTER TABLE student ADD COLUMN address text NOT NULL,
                    ADD COLUMN phone varchar(255) NOT NULL,
                    ADD COLUMN email varchar(255) NOT NULL;

;
SET foreign_key_checks=1;

COMMIT;

