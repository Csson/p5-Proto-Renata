import ko from 'knockout';
import templateMarkup from 'text!./example.html';

class JournalExample {
    constructor(params) {
        this.message = ko.observable('Hello from the journal/example component!');
    }
    
    dispose() {
        // This runs when the component is torn down. Put here any logic necessary to clean up,
        // for example cancelling setTimeouts or disposing Knockout subscriptions/computeds.
    }
}

export default { viewModel: JournalExample, template: templateMarkup };
