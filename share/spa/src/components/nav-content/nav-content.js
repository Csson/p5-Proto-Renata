import ko from 'knockout';
import templateMarkup from 'text!./nav-content.html';

class NavContent {
    constructor(params) {
        this.route = params.route;
    }
    
    dispose() {
        // This runs when the component is torn down. Put here any logic necessary to clean up,
        // for example cancelling setTimeouts or disposing Knockout subscriptions/computeds.
    }
}

export default { viewModel: NavContent, template: templateMarkup };
