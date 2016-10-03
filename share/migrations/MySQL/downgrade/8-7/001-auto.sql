-- Convert schema '/home/erik/sw/own/Proto-Renata/share/migrations/_source/deploy/8/001-auto.yml' to '/home/erik/sw/own/Proto-Renata/share/migrations/_source/deploy/7/001-auto.yml':;

;
BEGIN;

;
ALTER TABLE student DROP COLUMN address,
                    DROP COLUMN phone,
                    DROP COLUMN email;

;
ALTER TABLE guardian DROP FOREIGN KEY guardian_fk_student_id;

;
DROP TABLE guardian;

;

COMMIT;

