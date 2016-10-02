-- Convert schema '/home/erik/sw/own/Proto-Renata/share/migrations/_source/deploy/1/001-auto.yml' to '/home/erik/sw/own/Proto-Renata/share/migrations/_source/deploy/2/001-auto.yml':;

;
BEGIN;

;
SET foreign_key_checks=0;

;
CREATE TABLE `student` (
  `student_id` bigint NOT NULL auto_increment,
  `school_id` bigint NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `birth_date` date NOT NULL,
  `pin` char(4) NOT NULL,
  INDEX `student_idx_school_id` (`school_id`),
  PRIMARY KEY (`student_id`),
  CONSTRAINT `student_fk_school_id` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`)
) ENGINE=InnoDB;

;
CREATE TABLE `user_student` (
  `user_id` bigint NOT NULL,
  `student_id` bigint NOT NULL,
  INDEX `user_student_idx_student_id` (`student_id`),
  INDEX `user_student_idx_user_id` (`user_id`),
  PRIMARY KEY (`user_id`, `student_id`),
  CONSTRAINT `user_student_fk_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_student_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

;
SET foreign_key_checks=1;

;

COMMIT;

