-- Convert schema '/home/erik/sw/own/Proto-Renata/share/migrations/_source/deploy/4/001-auto.yml' to '/home/erik/sw/own/Proto-Renata/share/migrations/_source/deploy/5/001-auto.yml':;

;
BEGIN;
set foreign_key_checks = 0;
;
ALTER TABLE student DROP FOREIGN KEY student_fk_school_id,
                    DROP INDEX student_idx_school_id,
                    DROP COLUMN school_id;

;
set foreign_key_checks = 1;
COMMIT;

