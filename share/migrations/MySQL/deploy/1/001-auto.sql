-- 
-- Created by SQL::Translator::Producer::MySQL
-- Created on Sat Oct  1 13:35:05 2016
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
SET foreign_key_checks=1;
