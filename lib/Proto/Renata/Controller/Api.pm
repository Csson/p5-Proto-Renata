use 5.20.0;
use warnings;

package Proto::Renata::Controller::Api;

# ABSTRACT: ...
# AUTHORITY
our $VERSION = '0.0100';

use Mojo::Base 'Mojolicious::Controller';
use Time::Moment;
use DateTime;
use DateTime::Format::Strptime;
use Proto::Renata::Util qw/time_ago long_time_ago/;
use experimental qw/postderef signatures/;

sub get_user_by_id($self) {
    my $user_id = $self->session('user_id');
    $self->render(json => $self->db->User($user_id)->TO_JSON);
}
sub get_schools_by_user_id($self) {
    my $user_id = $self->session('user_id');
    $self->render(json => {
        schools => [ 
            map { $_->TO_JSON } $self->db->School->get_by_user_id($user_id)->all,
        ],
    });
}
sub get_links_by_user_id($self) {
    my $user_id = $self->session('user_id');
    $self->render(json => {
        links => [
            map { $_->TO_JSON } $self->db->Link->get_by_user_id($user_id)->all,
        ]
    });
}

sub get_latest_visits_by_user_id($self) {
    my $user_id = $self->session('user_id');
    my $now = Time::Moment->now->utc_rd_as_seconds;

    $self->render(json => {
        visits => [
            map {
                $_->{'time_ago'} = time_ago($now - Time::Moment->from_string($_->{'visit_date'} =~ s{ }{T}r . 'Z', lenient => 1)->utc_rd_as_seconds);
                $_->{'birth_date'} =~ s{ ^ .* (?<year>\d{2}) - (?<month>\d{2}) - (?<day>\d{2}) $}{$+{'year'}$+{'month'}$+{'day'}}x;
                $_;
            } $self->db->Visit->get_latest_visits_by_user_id($user_id)->hri->all
        ],
    });
}

sub search($self) {
    my $search_string = $self->param('search_string');
    $self->render(json => {
        suggestions => [
            $self->db->Student->search_suggestions($search_string)->hri->all
        ],
    });
}

sub get_student_by_student_id($self) {
    my $student_id = $self->param('student_id');

    my $now = DateTime->now;
    my $strp = DateTime::Format::Strptime->new(pattern => '%Y-%m-%d');

    my $student = $self->db->Student->hri->get_by_id($student_id);
    my $age = $now - $strp->parse_datetime($student->{'birth_date'});
    $student->{'age'} = long_time_ago($age);
    $self->render(json => $student);
}

1;
