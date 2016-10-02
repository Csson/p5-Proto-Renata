-- Convert schema '/home/erik/sw/own/Proto-Renata/share/migrations/_source/deploy/2/001-auto.yml' to '/home/erik/sw/own/Proto-Renata/share/migrations/_source/deploy/3/001-auto.yml':;

;
BEGIN;

;
SET foreign_key_checks=0;

;
CREATE TABLE `visit` (
  `visit_id` bigint NOT NULL auto_increment,
  `user_id` bigint NOT NULL,
  `student_id` bigint NOT NULL,
  `visit_date` datetime NOT NULL,
  INDEX `visit_idx_student_id` (`student_id`),
  INDEX `visit_idx_user_id` (`user_id`),
  PRIMARY KEY (`visit_id`),
  CONSTRAINT `visit_fk_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `visit_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

;
SET foreign_key_checks=1;

;

COMMIT;

