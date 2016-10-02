use 5.20.0;
use strict;
use warnings;

package Proto::Renata::Schema::ResultSet::Visit;

# ABSTRACT: ...
# AUTHORITY
our $VERSION = '0.0001';

use Proto::Renata::Schema::ResultSet -components => [qw/
/];
use experimental qw/postderef signatures/;

sub get_latest_visits_by_user_id($self, $user_id, $limit = 10) {
    $self->search({
            'me.user_id' => { -ident => $user_id },
        }, {
            select => [qw/student.student_id student.first_name student.last_name student.birth_date/, { max => 'me.visit_date' }],
            as => [qw/student_id first_name last_name birth_date visit_date/],
        })->prefetch('student')
          ->group_by([qw/student.student_id first_name last_name birth_date/])
          ->order_by('!visit_date')
          ->rows($limit);
}

1;

__END__

=pod

=head1 SYNOPSIS

    use Proto::Renata::Schema::ResultSet::Visit;

=head1 DESCRIPTION

Proto::Renata::Schema::ResultSet::Visit is ...

=head1 SEE ALSO

=cut
