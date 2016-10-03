-- Convert schema '/home/erik/sw/own/Proto-Renata/share/migrations/_source/deploy/12/001-auto.yml' to '/home/erik/sw/own/Proto-Renata/share/migrations/_source/deploy/11/001-auto.yml':;

;
BEGIN;

;
ALTER TABLE note DROP FOREIGN KEY note_fk_student_id,
                 DROP FOREIGN KEY note_fk_user_id;

;
ALTER TABLE note ADD CONSTRAINT note_fk_student_id FOREIGN KEY (student_id) REFERENCES student (student_id),
                 ADD CONSTRAINT note_fk_user_id FOREIGN KEY (user_id) REFERENCES user (user_id);

;
ALTER TABLE event DROP FOREIGN KEY event_fk_student_id,
                  DROP FOREIGN KEY event_fk_user_id;

;
DROP TABLE event;

;

COMMIT;

