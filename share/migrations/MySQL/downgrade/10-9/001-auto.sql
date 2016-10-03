-- Convert schema '/home/erik/sw/own/Proto-Renata/share/migrations/_source/deploy/10/001-auto.yml' to '/home/erik/sw/own/Proto-Renata/share/migrations/_source/deploy/9/001-auto.yml':;

;
BEGIN;

;
ALTER TABLE studentcard DROP FOREIGN KEY studentcard_fk_student_id;

;
DROP TABLE studentcard;

;

COMMIT;

