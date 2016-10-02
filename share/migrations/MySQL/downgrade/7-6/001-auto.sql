-- Convert schema '/home/erik/sw/own/Proto-Renata/share/migrations/_source/deploy/7/001-auto.yml' to '/home/erik/sw/own/Proto-Renata/share/migrations/_source/deploy/6/001-auto.yml':;

;
BEGIN;

;
ALTER TABLE warning DROP FOREIGN KEY warning_fk_student_id;

;
DROP TABLE warning;

;

COMMIT;

