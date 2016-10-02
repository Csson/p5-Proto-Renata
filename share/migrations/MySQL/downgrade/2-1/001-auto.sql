-- Convert schema '/home/erik/sw/own/Proto-Renata/share/migrations/_source/deploy/2/001-auto.yml' to '/home/erik/sw/own/Proto-Renata/share/migrations/_source/deploy/1/001-auto.yml':;

;
BEGIN;

;
ALTER TABLE student DROP FOREIGN KEY student_fk_school_id;

;
DROP TABLE student;

;
ALTER TABLE user_student DROP FOREIGN KEY user_student_fk_student_id,
                         DROP FOREIGN KEY user_student_fk_user_id;

;
DROP TABLE user_student;

;

COMMIT;

