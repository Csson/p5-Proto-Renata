-- Convert schema '/home/erik/sw/own/Proto-Renata/share/migrations/_source/deploy/11/001-auto.yml' to '/home/erik/sw/own/Proto-Renata/share/migrations/_source/deploy/10/001-auto.yml':;

;
BEGIN;

;
ALTER TABLE note DROP FOREIGN KEY note_fk_student_id,
                 DROP FOREIGN KEY note_fk_user_id;

;
DROP TABLE note;

;

COMMIT;

