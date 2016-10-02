import 'jquery';
import 'bootstrap';
import ko from 'knockout';
import 'knockout-projections'
import * as router from './router';

// Components can be packaged as AMD modules, such as the following:
ko.components.register('nav-bar', { require: 'components/nav-bar/nav-bar' });
ko.components.register('nav-content', { require: 'components/nav-content/nav-content' });

ko.components.register('home-page', { require: 'components/home-page/home' });

// ... or for template-only components, you can just point to a .html file directly:
ko.components.register('about-page', {
    template: { require: 'text!components/about-page/about.html' }
});

ko.components.register('journal', { require: 'components/journal/journal' });


ko.components.register('home-page-start', { require: 'components/home-page/start' });


ko.components.register('home-page-settings', { require: 'components/home-page/settings' });


ko.components.register('journal-student', { require: 'components/journal/student' });




ko.components.register('journal-student-file', { require: 'components/journal/student-file' });




// [Scaffolded component registrations will be inserted here. To retain this feature, don't remove this comment.]

// Start the application
ko.applyBindings({ route: router.currentRoute });
