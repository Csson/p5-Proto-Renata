import { Student } from './student.js';

export class Event {
    constructor(params = {}) {
        let self = this;
        self.title = params.title;
        self.description = params.description;
        self.startDate = params.start_date;
        self.student = new Student(params.student);

    }
}
