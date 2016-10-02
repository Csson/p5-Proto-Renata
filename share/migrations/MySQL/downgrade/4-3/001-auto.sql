-- Convert schema '/home/erik/sw/own/Proto-Renata/share/migrations/_source/deploy/4/001-auto.yml' to '/home/erik/sw/own/Proto-Renata/share/migrations/_source/deploy/3/001-auto.yml':;

;
BEGIN;

;
ALTER TABLE student DROP FOREIGN KEY student_fk_class_id,
                    DROP INDEX student_idx_class_id,
                    DROP COLUMN class_id;

;
ALTER TABLE class DROP FOREIGN KEY class_fk_school_id;

;
DROP TABLE class;

;

COMMIT;

