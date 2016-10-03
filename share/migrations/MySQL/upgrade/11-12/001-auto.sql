-- Convert schema '/home/erik/sw/own/Proto-Renata/share/migrations/_source/deploy/11/001-auto.yml' to '/home/erik/sw/own/Proto-Renata/share/migrations/_source/deploy/12/001-auto.yml':;

;
BEGIN;

;
SET foreign_key_checks=0;

;
CREATE TABLE `event` (
  `event_id` bigint NOT NULL auto_increment,
  `user_id` bigint NOT NULL,
  `student_id` bigint NOT NULL,
  `title` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `all_day` enum('0','1') NOT NULL DEFAULT '0',
  `start_date` datetime NOT NULL,
  `description` text NOT NULL,
  `sms_reminder` varchar(255) NOT NULL,
  `sms_number` varchar(255) NOT NULL,
  INDEX `event_idx_student_id` (`student_id`),
  INDEX `event_idx_user_id` (`user_id`),
  PRIMARY KEY (`event_id`),
  CONSTRAINT `event_fk_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `event_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

;

;
ALTER TABLE note DROP FOREIGN KEY note_fk_student_id,
                 DROP FOREIGN KEY note_fk_user_id;

;
ALTER TABLE note ADD CONSTRAINT note_fk_student_id FOREIGN KEY (student_id) REFERENCES student (student_id) ON DELETE CASCADE ON UPDATE CASCADE,
                 ADD CONSTRAINT note_fk_user_id FOREIGN KEY (user_id) REFERENCES user (user_id) ON DELETE CASCADE ON UPDATE CASCADE;

;
SET foreign_key_checks=1;

COMMIT;

