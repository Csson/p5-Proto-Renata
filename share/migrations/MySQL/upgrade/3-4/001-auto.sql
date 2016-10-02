-- Convert schema '/home/erik/sw/own/Proto-Renata/share/migrations/_source/deploy/3/001-auto.yml' to '/home/erik/sw/own/Proto-Renata/share/migrations/_source/deploy/4/001-auto.yml':;

;
BEGIN;

;
SET foreign_key_checks=0;

;
CREATE TABLE `class` (
  `class_id` bigint NOT NULL auto_increment,
  `school_id` bigint NOT NULL,
  `name` varchar(255) NOT NULL,
  INDEX `class_idx_school_id` (`school_id`),
  PRIMARY KEY (`class_id`),
  CONSTRAINT `class_fk_school_id` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;


;
ALTER TABLE student ADD COLUMN class_id bigint NOT NULL,
                    ADD INDEX student_idx_class_id (class_id),
                    ADD CONSTRAINT student_fk_class_id FOREIGN KEY (class_id) REFERENCES class (class_id) ON DELETE CASCADE ON UPDATE CASCADE;

;
;
SET foreign_key_checks=1;

COMMIT;

