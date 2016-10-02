import ko from 'knockout';
import template from 'text!./nav-bar.html';

class SearchSuggestion {
    constructor(params) {
        this.firstName = params.first_name;
        this.lastName = params.last_name;
        this.studentId = params.student_id;
        this.url = '#journal/student/' + this.studentId;
    }
}

class NavBarViewModel {
    constructor(params) {
        let self = this;
        self.route = params.route;
        self.searchSuggestions = ko.observableArray();
        self.showSearchSuggestions = ko.computed(function() {
            return self.searchSuggestions().length > 0 ? 1 : 0;
        });
    }
    keyUp(args, event) {
        let self = this;
        let searchString = event.currentTarget.value;
        if(searchString.length < 2) {
            self.searchSuggestions([]);
        }
        else {
            $.getJSON('/api/search/', { search_string: searchString }, function(result) {
                self.searchSuggestions([]);
                for (var i = 0; i < result.suggestions.length; i++) {
                    self.searchSuggestions.push(new SearchSuggestion(result.suggestions[i]));
                }
            });
        }
        return true;
    }
    clearSearchSuggestions(searchSuggestion, args, event) {
        this.searchSuggestions([]);
        window.location = searchSuggestion.url;
        return true;
    }
}

export default { viewModel: NavBarViewModel, template: template };
