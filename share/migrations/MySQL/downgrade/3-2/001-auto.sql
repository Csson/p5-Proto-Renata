-- Convert schema '/home/erik/sw/own/Proto-Renata/share/migrations/_source/deploy/3/001-auto.yml' to '/home/erik/sw/own/Proto-Renata/share/migrations/_source/deploy/2/001-auto.yml':;

;
BEGIN;

;
ALTER TABLE visit DROP FOREIGN KEY visit_fk_student_id,
                  DROP FOREIGN KEY visit_fk_user_id;

;
DROP TABLE visit;

;

COMMIT;

