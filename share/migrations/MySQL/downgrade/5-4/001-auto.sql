-- Convert schema '/home/erik/sw/own/Proto-Renata/share/migrations/_source/deploy/5/001-auto.yml' to '/home/erik/sw/own/Proto-Renata/share/migrations/_source/deploy/4/001-auto.yml':;

;
BEGIN;

;
ALTER TABLE student ADD COLUMN school_id bigint NOT NULL,
                    ADD INDEX student_idx_school_id (school_id),
                    ADD CONSTRAINT student_fk_school_id FOREIGN KEY (school_id) REFERENCES school (school_id);

;

COMMIT;

