import ko from 'knockout';
import templateMarkup from 'text!./student-file.html';
import { Student } from '../../core/student.js';

class JournalStudentFile {
    constructor(params) {
        let self = this;
        self.student = ko.observable(new Student);

        $.getJSON('/api/student/' + params.studentId, function(result) {
            console.log(result);
            self.student(new Student(result));
        });
    }
    
    dispose() {
        // This runs when the component is torn down. Put here any logic necessary to clean up,
        // for example cancelling setTimeouts or disposing Knockout subscriptions/computeds.
    }
}

export default { viewModel: JournalStudentFile, template: templateMarkup };
