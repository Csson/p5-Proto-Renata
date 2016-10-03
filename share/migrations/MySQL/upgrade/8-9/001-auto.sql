-- Convert schema '/home/erik/sw/own/Proto-Renata/share/migrations/_source/deploy/8/001-auto.yml' to '/home/erik/sw/own/Proto-Renata/share/migrations/_source/deploy/9/001-auto.yml':;

;
BEGIN;

;
ALTER TABLE guardian ADD COLUMN name varchar(255) NOT NULL;

;

COMMIT;

