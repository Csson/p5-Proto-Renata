import { School } from './school.js';
import { Student } from './student.js';

export class Class {
    constructor(params = {}) {
        let self = this;
        self.classId = params.classId;
        self.name = params.name;
        self.school = new School(params.school || {});
        self.students = [];

        let students = params.students || [];
        for (let i = 0; i < students.length; i++) {
            self.students.push(new Student(students[i]));
        }
    }
}
