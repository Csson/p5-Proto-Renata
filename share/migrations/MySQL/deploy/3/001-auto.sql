-- 
-- Created by SQL::Translator::Producer::MySQL
-- Created on Sat Oct  1 19:04:57 2016
-- 
;
SET foreign_key_checks=0;
--
-- Table: `organisation`
--
CREATE TABLE `organisation` (
  `organisation_id` bigint NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`organisation_id`)
) ENGINE=InnoDB;
--
-- Table: `link`
--
CREATE TABLE `link` (
  `link_id` bigint NOT NULL auto_increment,
  `organisation_id` bigint NOT NULL,
  `url` text NOT NULL,
  `name` varchar(255) NOT NULL,
  INDEX `link_idx_organisation_id` (`organisation_id`),
  PRIMARY KEY (`link_id`),
  CONSTRAINT `link_fk_organisation_id` FOREIGN KEY (`organisation_id`) REFERENCES `organisation` (`organisation_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;
--
-- Table: `school`
--
CREATE TABLE `school` (
  `school_id` bigint NOT NULL auto_increment,
  `organisation_id` bigint NOT NULL,
  `name` varchar(255) NOT NULL,
  INDEX `school_idx_organisation_id` (`organisation_id`),
  PRIMARY KEY (`school_id`),
  CONSTRAINT `school_fk_organisation_id` FOREIGN KEY (`organisation_id`) REFERENCES `organisation` (`organisation_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;
--
-- Table: `user`
--
CREATE TABLE `user` (
  `user_id` bigint NOT NULL auto_increment,
  `organisation_id` bigint NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  INDEX `user_idx_organisation_id` (`organisation_id`),
  PRIMARY KEY (`user_id`),
  CONSTRAINT `user_fk_organisation_id` FOREIGN KEY (`organisation_id`) REFERENCES `organisation` (`organisation_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;
--
-- Table: `student`
--
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
--
-- Table: `user_school`
--
CREATE TABLE `user_school` (
  `school_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  INDEX `user_school_idx_school_id` (`school_id`),
  INDEX `user_school_idx_user_id` (`user_id`),
  PRIMARY KEY (`school_id`, `user_id`),
  CONSTRAINT `user_school_fk_school_id` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_school_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;
--
-- Table: `user_student`
--
CREATE TABLE `user_student` (
  `user_id` bigint NOT NULL,
  `student_id` bigint NOT NULL,
  INDEX `user_student_idx_student_id` (`student_id`),
  INDEX `user_student_idx_user_id` (`user_id`),
  PRIMARY KEY (`user_id`, `student_id`),
  CONSTRAINT `user_student_fk_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_student_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;
--
-- Table: `visit`
--
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
SET foreign_key_checks=1;
