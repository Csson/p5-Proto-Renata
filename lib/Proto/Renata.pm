use 5.20.0;
use strict;
use warnings;

package Proto::Renata;

# ABSTRACT: Short intro
# AUTHORITY
our $VERSION = '0.0100';

use Mojo::Base 'Mojolicious';
use Mojo::Home;
use Proto::Renata::Config;
use Proto::Renata::Schema;
use Path::Tiny;
use experimental qw/postderef signatures/;


sub startup($self) {
    $self->setup;

    my $distdir = path(Mojo::Home->new->rel_dir('share/spa/dist'));
    warn $distdir->absolute->stringify;
    push $self->static->paths->@*, Mojo::Home->new->rel_dir('share/spa/dist');

    $self->renderer->cache->max_keys(0);

    my $r = $self->routes;
    $r->get('/proto/')->to(cb => sub ($c) { $c->session('user_id', 1); $c->reply->static('index.html'); })->name('proto');
    $r->get('/')->to(cb => sub($c) { $c->redirect_to('/proto#home/start') });

    my $api = $r->get('/api');
    $api->get('user')->to('api#get_user_by_id')->name('user');
    $api->get('user/events')->to('api#get_events_by_user_id')->name('user_events');
    $api->get('user/schools')->to('api#get_schools_by_user_id')->name('user_schools');
    $api->get('user/links')->to('api#get_links_by_user_id')->name('user_links');
    $api->get('user/visits/latest')->to('api#get_latest_visits_by_user_id')->name('user_latest_visits');
    $api->get('search')->to('api#search')->name('search');
    $api->get('student/:student_id')->to('api#get_student_by_student_id')->name('student');
    $api->get('school/:school_id')->to('api#get_school_by_school_id')->name('get_school');
    $api->get('school/:school_id/users')->to('api#get_users_by_school_id')->name('users_by_school');
    $api->get('school/:school_id/classes')->to('api#get_classes_by_school_id')->name('classes_by_school');
    $api->get('student/:student_id/notes')->to('api#get_student_notes')->name('get_student_notes');
    $r->post('/api/student/:student_id/note')->to('api#create_student_note')->name('create_student_note');
    $r->post('/api/user/:user_id/event')->to('api#create_user_event')->name('create_user_event');

}

sub setup($self) {
    $self->defaults(layout => 'default');
    $self->plugin('UnicodeNormalize');
    $self->plugin('BootstrapHelpers');

    my $serverconf = Proto::Renata::Config->new;
    $self->secrets($serverconf->config->get('secrets'));
    $self->helper(serverconf => sub { $serverconf });

    $self->mode($self->serverconf->config->get(':protorenata/mode'));
    $self->log(Mojo::Log->new(path => $self->serverconf->config->get(':protorenata/logdir')));

    $self->defaults(layout => 'default');

    $self->helper(db => sub {
        state $db = Proto::Renata::Schema->connect;
        return $db;
    });
}

1;

__END__

=pod

=encoding utf-8

Javascriptkällkoden ligger under C<share/spa/src>.
