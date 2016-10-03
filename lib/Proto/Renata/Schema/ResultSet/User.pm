use 5.20.0;
use strict;
use warnings;

package Proto::Renata::Schema::ResultSet::User;

# ABSTRACT: ...
# AUTHORITY
our $VERSION = '0.0001';

use Proto::Renata::Schema::ResultSet -components => [qw/
/];
use experimental qw/postderef signatures/;

sub get_users_by_school_id($self, $school_id) {
    return $self->search({ 'user_schools.school_id' => { -ident => $school_id }}, { join => 'user_schools' })->order_by('first_name');
}

1;

__END__

=pod

=head1 SYNOPSIS

    use Proto::Renata::Schema::ResultSet::User;

=head1 DESCRIPTION

Proto::Renata::Schema::ResultSet::User is ...

=head1 SEE ALSO

=cut
