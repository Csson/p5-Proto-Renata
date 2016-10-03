-- Convert schema '/home/erik/sw/own/Proto-Renata/share/migrations/_source/deploy/10/001-auto.yml' to '/home/erik/sw/own/Proto-Renata/share/migrations/_source/deploy/11/001-auto.yml':;

;
BEGIN;

;
SET foreign_key_checks=0;

;
CREATE TABLE `note` (
  `note_id` bigint NOT NULL auto_increment,
  `student_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created_date` datetime NOT NULL,
  `contact_type` varchar(255) NOT NULL,
  `note` text NOT NULL,
  INDEX `note_idx_student_id` (`student_id`),
  INDEX `note_idx_user_id` (`user_id`),
  PRIMARY KEY (`note_id`),
  CONSTRAINT `note_fk_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  CONSTRAINT `note_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB;

;
SET foreign_key_checks=1;

;

COMMIT;

