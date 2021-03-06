import ko from 'knockout';
import templateMarkup from 'text!./settings.html';

class HomePageSettings {
    constructor(params) {
        this.message = ko.observable('Hello from the home-page/settings component!');
    }
    
    dispose() {
        // This runs when the component is torn down. Put here any logic necessary to clean up,
        // for example cancelling setTimeouts or disposing Knockout subscriptions/computeds.
    }
}

export default { viewModel: HomePageSettings, template: templateMarkup };
