import ko from 'knockout';
import templateMarkup from 'text!./journal.html';

class Journal {
    constructor(params) {
        this.message = ko.observable('Hello from the journal component!');
        this.route = params.route;
    }
    doSomething() {
        this.message('You invoked doSomething() on the viewmodel.' + this.route);
    }
    dispose() {
        // This runs when the component is torn down. Put here any logic necessary to clean up,
        // for example cancelling setTimeouts or disposing Knockout subscriptions/computeds.
    }
}

export default { viewModel: Journal, template: templateMarkup };
