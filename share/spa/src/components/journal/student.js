import ko from 'knockout';
import templateMarkup from 'text!./student.html';
import { Student } from '../../core/student.js';
import { User } from '../../core/user.js';

class JournalStudent {
    constructor(params) {
        let self = this;
        self.student = ko.observable(new Student);
        self.usersAtSchool = ko.observableArray();

        self.formTitle = ko.observable('');
        self.formCategory = ko.observable('1');
        self.formUserId = ko.observable('');
        self.formStudentText = ko.observable('');
        self.formStudentPhone = ko.observable('');
        self.formAllDay = ko.observable(false);
        self.formDate = ko.observable('');
        self.formTime = ko.observable('');
        self.formDescription = ko.observable('');
        self.formSmsReminder = ko.observable('1');

        $.getJSON('/api/student/' + params.studentId, function(result) {
            self.student(new Student(result));
        });
        self.student.subscribe(function() {
            $.getJSON('/api/school/' + self.student().class.school.schoolId + '/users', function(result) {
                self.usersAtSchool();
                for (var i = 0; i < result.users.length; i++) {
                    self.usersAtSchool.push(new User(result.users[i]));
                }
            });
            self.formStudentText(self.student().fullName + ' (' + self.student().identificationNumber + ')');
            self.formStudentPhone(self.student().fullName + ': Telefon (' + self.student().phone + ')');
        });

    }
    hasStudentcards() {
        return self.student().studentcards.length > 0 ? 1 : 0;
    }
    onSubmitModalForm() {
        let self = this;
        let args = {
            user_id: self.formUserId(),
            student_id: self.student().studentId,
            category: 'Möte',
            all_day: self.formAllDay(),
            date: self.formDate(),
            time: self.formTime(),
            title: self.formTitle(),
            description: self.formDescription(),
            sms_reminder: 'Dagen innan, klockan 12',
            sms_number: self.student().phone,
        };
        $.ajax({
            type: 'POST',
            url: '/api/user/'+ self.formUserId() +'/event',
            data: args,
            success: function(result) { },
        });

    }

    dispose() {
        // This runs when the component is torn down. Put here any logic necessary to clean up,
        // for example cancelling setTimeouts or disposing Knockout subscriptions/computeds.
    }
}

export default { viewModel: JournalStudent, template: templateMarkup };
