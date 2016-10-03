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
use Proto::Renata::Util qw/time_ago long_time_ago month_to_name/;
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

sub get_events_by_user_id($self) {
    my $user_id = $self->session('user_id');
    my @events = $self->db->Event->get_by_user_id($user_id)->rows(10)->hri->all;

    $self->render(json => { events => \@events });
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

sub get_users_by_school_id($self) {
    my $school_id = $self->param('school_id');

    my @users = $school_id == -1 ? () : $self->db->User->get_users_by_school_id($school_id)->hri->all;
    $self->render(json => { users => \@users });
}

sub get_student_notes($self) {
    my $student_id = $self->param('student_id');
    my @notes = $self->db->Note->get_notes_by_student_id($student_id)->hri->all;

    for my $note (@notes) {
        $note->{'created_date'} =~ m{^ (\d{4}) - (\d{2}) - (\d{2}) }x;
        $note->{'created_date'} = sprintf '%s %s %s', $3, month_to_name($2), $1;
        $note->{'contact_type'} = ucfirst $note->{'contact_type'};
    }

    $self->render(json => { notes => \@notes });
}

sub create_student_note($self) {
    my $student_id = $self->param('student_id');
    my $args = {
        created_date => join (' ', $self->param('date'), $self->param('time')),
        user_id => $self->param('user_id'),
        contact_type => $self->param('type'),
        note => $self->param('note'),
    };

    $self->db->Student($student_id)->create_note($args);
    $self->redirect_to('get_student_notes', student_id => $student_id);
}

sub create_user_event($self) {
    my $user_id = $self->param('user_id');
    my $args = {
        user_id => $self->param('user_id'),
        student_id => $self->param('student_id'),
        category => $self->param('category'),
        all_day => $self->param('all_day'),
        start_date => join(' ', $self->param('date'), $self->param('time')),
        title => $self->param('title'),
        description => $self->param('description'),
        sms_reminder => $self->param('sms_reminder'),
        sms_number => $self->param('sms_number'),
    };
    $self->db->User($user_id)->add_event($args);
    $self->render(json => {});

}

sub get_school_by_school_id($self) {
    my $school_id = $self->param('school_id');
    $self->render(json => $self->db->School->get_by_id($school_id)->hri->first);
}

sub get_classes_by_school_id($self) {
    my $school_id = $self->param('school_id');
    $self->render(json => { classes => [$self->db->Class->get_by_school_id($school_id)->hri->all ]});
}

1;
