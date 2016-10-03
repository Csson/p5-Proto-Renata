import ko from 'knockout';
import templateMarkup from 'text!./start.html';
import { Event } from '../../core/event.js';
import { User } from '../../core/user.js';
import { School } from '../../core/school.js';

class LatestVisit {
    constructor(params) {
        this.firstName = params.first_name;
        this.initial = params.first_name.substr(0, 1) + params.last_name.substr(0, 1);
        this.visitDate = params.visit_date;
        this.timeAgo = params.time_ago;
        this.birthDate = params.birth_date;
        this.studentId = params.student_id || '';
        this.url = '#journal/student/' + this.studentId;

    }
}
class Link {
    constructor(params) {
        this.name = params.name;
        this.url = params.url;
    }
}

class HomePageStart {
    constructor(params) {
        var self = this;
        self.message = ko.observable('Hello from the home-page/start component!');

        self.firstName = ko.observable();

        self.user = ko.observable(new User());
        self.schools = ko.observableArray();
        self.latestVisits = ko.observableArray();
        self.links = ko.observableArray();

        self.events = ko.observableArray();
        self.hasEvents = ko.computed(function() {
            return self.events().length > 0;
        });

        $.getJSON('/api/user/', function(result) {
            self.user(new User(result));
        });
        $.getJSON('/api/user/schools/', function(result) {
            for (var i = 0; i < result.schools.length; i++) {
                self.schools.push(new School(result.schools[i]));
            }
        });
        $.getJSON('/api/user/links/', function(result) {
            for (var i = 0; i < result.links.length; i++) {
                self.links.push(new Link(result.links[i]));
            }
        });
        $.getJSON('/api/user/visits/latest/', function(result) {
            for (var i = 0; i < result.visits.length; i++) {
                self.latestVisits.push(new LatestVisit(result.visits[i]));
            }
        });
        $.getJSON('/api/user/events', function(result) {
            self.events();
            for (var i = 0; i < result.events.length; i++) {
                self.events.push(new Event(result.events[i]));
            }
            console.log(self.events());
        });
    }
    
    dispose() {

    }
}

export default { viewModel: HomePageStart, template: templateMarkup };
