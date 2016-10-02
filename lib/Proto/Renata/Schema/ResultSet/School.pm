use 5.20.0;
use strict;
use warnings;

package Proto::Renata::Schema::ResultSet::School;

# ABSTRACT: ...
# AUTHORITY
our $VERSION = '0.0001';

use Proto::Renata::Schema::ResultSet -components => [qw/
/];
use experimental qw/postderef signatures/;

sub get_by_user_id($self, $user_id) {
    $self->search({ 'user_schools.user_id' => { -ident => $user_id } })->prefetch('user_schools');
}

1;

__END__

=pod

=head1 SYNOPSIS

    use Proto::Renata::Schema::ResultSet::School;

=head1 DESCRIPTION

Proto::Renata::Schema::ResultSet::School is ...

=head1 SEE ALSO

=cut
