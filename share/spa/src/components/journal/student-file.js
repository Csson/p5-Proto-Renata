import ko from 'knockout';
import templateMarkup from 'text!./student-file.html';
import { Student } from '../../core/student.js';
import { User } from '../../core/user.js';
import { Note } from '../../core/note.js';
import { School } from '../../core/school.js';

class JournalStudentFile {
    constructor(params) {
        let self = this;
        self.student = ko.observable(new Student);

        $.getJSON('/api/student/' + params.studentId, function(result) {
            self.student(new Student(result));
        });

        self.usersAtSchool = ko.observableArray();
        self.notes = ko.observableArray();

        let now = new Date();
        self.nowDate = now.getFullYear()
                       + '-' + (now.getMonth() + 1 < 10 ? '0' + now.getMonth() + 1 : now.getMonth() + 1)
                       + '-' + (now.getDate() < 10 ? '0' + now.getDate() : now.getDate());
        self.nowTime = (now.getHours() < 10 ? '0' + now.getHours() : now.getHours())
                       + ':' + (now.getMinutes() < 10 ? '0' + now.getMinutes() : now.getMinutes());

        self.student.subscribe(function() {
            $.getJSON('/api/school/' + self.student().class.school.schoolId + '/users', function(result) {
                self.usersAtSchool.removeAll();
                for (var i = 0; i < result.users.length; i++) {
                    self.usersAtSchool.push(new User(result.users[i]));
                }
            });
            $.getJSON('/api/student/' + self.student().studentId + '/notes', function(result) {
                self.notes.removeAll();
                for (var i = 0; i < result.notes.length; i++) {
                    self.notes.push(new Note(result.notes[i]));
                }
            });
        });

        self.formDate = ko.observable(self.nowDate);
        self.formTime = ko.observable(self.nowTime);
        self.formResponsible = ko.observable('');
        self.formType = ko.observable('telefonkontakt');
        self.formNote = ko.observable('');
    }

    onSubmitModalForm() {
        let self = this;
        let args = {
            date: self.formDate(),
            time: self.formTime(),
            user_id: self.formResponsible(),
            type: self.formType(),
            note: self.formNote(),
        };
        $.ajax({
            type: 'POST',
            url: '/api/student/'+ self.student().studentId +'/note',
            data: args,
            success: function(result) {
                self.notes.removeAll();
                for (var i = 0; i < result.notes.length; i++) {
                    self.notes.push(new Note(result.notes[i]));
                }
            },
        });

    }
    
    dispose() {
        // This runs when the component is torn down. Put here any logic necessary to clean up,
        // for example cancelling setTimeouts or disposing Knockout subscriptions/computeds.
    }
}

export default { viewModel: JournalStudentFile, template: templateMarkup };
