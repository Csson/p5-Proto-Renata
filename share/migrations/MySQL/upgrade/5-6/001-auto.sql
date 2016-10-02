-- Convert schema '/home/erik/sw/own/Proto-Renata/share/migrations/_source/deploy/5/001-auto.yml' to '/home/erik/sw/own/Proto-Renata/share/migrations/_source/deploy/6/001-auto.yml':;

;
BEGIN;

;
ALTER TABLE student ADD COLUMN gender enum('male', 'female') NOT NULL;

;

COMMIT;

