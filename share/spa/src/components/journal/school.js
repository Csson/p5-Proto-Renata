import ko from 'knockout';
import templateMarkup from 'text!./school.html';
import { School } from '../../core/school.js';
import { Class } from '../../core/class.js';

class JournalSchool {
    constructor(params) {
        let self = this;
        self.school = ko.observable(new School);
        self.classes = ko.observableArray();

        $.getJSON('/api/school/' + params.schoolId, function(result) {
            self.school(new School(result));
        });
        self.school.subscribe(function() {
            $.getJSON('/api/school/' + self.school().schoolId + '/classes', function(result) {
                self.classes.removeAll();
                for (var i = 0; i < result.classes.length; i++) {
                    self.classes.push(new Class(result.classes[i]));
                }
            });
        });
    }
    
    dispose() {
        // This runs when the component is torn down. Put here any logic necessary to clean up,
        // for example cancelling setTimeouts or disposing Knockout subscriptions/computeds.
    }
}

export default { viewModel: JournalSchool, template: templateMarkup };
