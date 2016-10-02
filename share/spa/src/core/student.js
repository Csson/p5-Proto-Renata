import { Class } from './class.js';
import { Warning } from './warning.js';

export class Student {
    constructor(params = { }) {
        let self = this;
        self.studentId = params.student_id || '';
        self.firstName = params.first_name || '';
        self.lastName = params.last_name || '';
        self.fullName = self.firstName + ' ' + self.lastName;
        self.birthDate = params.birth_date || '';

        let gender = typeof params.gender !== undefined ? params.gender === 'male' ?  '♂' : '♀' : '';

        self.gender = gender;
        self.pin = params.pin || '';
        self.age = params.age || '';

        let identificationNumber = self.birthDate.replace(/-/g, '') + '-' + self.pin;
        identificationNumber = identificationNumber.slice(0, 2) + ' ' + identificationNumber.slice(2);
        self.identificationNumber = identificationNumber;
        self.class = new Class(params.class || {});
        self.warnings = [];

        let warnings = params.warnings || [];

        for (var i = 0; i < warnings.length; i++) {
            self.warnings.push(new Warning(warnings[i])); 
        }

    }
    url() {
        return '#journal/student/' + this.studentId;
    }
    urlFile() {
        return '#journal/student/' + this.studentId + '/file';
    }
}
