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
use experimental qw/postderef signatures/;


sub startup($self) {
    $self->setup;

    push $self->static->paths->@*, Mojo::Home->new->rel_dir('share/spa/dist');

    $self->renderer->cache->max_keys(0);

    my $r = $self->routes;
    $r->get('/proto/')->to(cb => sub ($c) { $c->session('user_id', 1); $c->reply->static('index.html'); })->name('proto');
    $r->get('/')->to(cb => sub($c) { $c->redirect_to('/proto#home/start') });

    my $api = $r->get('/api');
    $api->get('user')->to('api#get_user_by_id')->name('user');
    $api->get('user/schools')->to('api#get_schools_by_user_id')->name('user_schools');
    $api->get('user/links')->to('api#get_links_by_user_id')->name('user_links');
    $api->get('user/visits/latest')->to('api#get_latest_visits_by_user_id')->name('user_latest_visits');
    $api->get('search')->to('api#search')->name('search');
    $api->get('student/:student_id')->to('api#get_student_by_student_id')->name('student');

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

=head1 SYNOPSIS

    use Proto::Renata;

=head1 DESCRIPTION

Proto::Renata is ...

=head1 SEE ALSO

=cut




use 5.20.0;
use warnings;

package App::Proffy::Web;

# ABSTRACT: ...
our $AUTHORITY = 'cpan:CSSON'; # AUTHORITY
our $VERSION = '0.0100';

use Mojo::Base 'Mojolicious';
use Mojo::Home;
use File::ShareDir 'dist_dir';
use Path::Tiny;
use App::Proffy::Reporter;
use experimental qw/postderef signatures/;

has reporter => sub { App::Proffy::Reporter->new(infile => Mojo::Home->new->rel_file('share/nytprof.out')) };

sub startup($self) {
    $self->plugin('BootstrapHelpers');
    $self->plugin('EPRenderer', template => { prepend => 'use experimental qw/postderef/;' });

    my $dirroot = 1 ? path(Mojo::Home->new->rel_dir('share'))
                    : path(dist_dir('App-Proffy'))
                    ;
    my $template_dir = $dirroot->child('templates');
    push $self->renderer->paths->@* => $template_dir->realpath;
    push $self->static->paths->@* => $dirroot->child('public')->stringify;
    $self->defaults(layout => 'default');

    $self->renderer->cache->max_keys(0);

    my $r = $self->routes;
 #   $r->cache->max_keys(0);


    $r->get('/file/*filename')->to(cb => sub($c) {
        my($file) = grep { $_->fileinfo->filename eq $c->param('filename') } $self->reporter->files->@*;
        $c->render(template => 'views/one_source_file', file => $file);
    })->name('one_file');

    $r->get('/sub/*subname')->to(cb => sub($c) {
        my @file_line_range = $self->reporter->profile->file_line_range_of_sub($c->param('subname'));
        my $filename = $file_line_range[0];
        my $first_line = $file_line_range[2] || -1;
        my $last_line = $file_line_range[3] || -1;

        if(defined $filename) {
            my($file) = grep { $_->fileinfo->filename eq $file_line_range[0] } $self->reporter->files->@*;
            $c->stash(start_at => $first_line);
            $c->stash(end_at => $last_line);
            $c->render(layout => undef, template => 'views/one_source_file', file => $file);
        }
        else {
            $c->render(text => 'No source to show.');
        }
    })->name('sub');

    $r->get('/svg')->to(cb => sub ($c) {
        $c->render(template => 'views/svg', reporter => $self->reporter);
    })->name('svg');
    $r->get('/')->to(cb => sub ($c) {
        $c->render(template => 'views/overview', reporter => $self->reporter);
    })->name('home');
}

1;

__END__
