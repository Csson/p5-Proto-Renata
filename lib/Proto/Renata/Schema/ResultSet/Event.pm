use 5.20.0;
use strict;
use warnings;

package Proto::Renata::Schema::ResultSet::Event;

# ABSTRACT: ...
# AUTHORITY
our $VERSION = '0.0001';

use Proto::Renata::Schema::ResultSet -components => [qw/
/];
use experimental qw/postderef signatures/;

sub get_by_user_id($self, $user_id) {
    $self->prefetch('student')->search({ user_id => $user_id, start_date => { '>=' => \'now()' } })->order_by('start_date');
}

1;

__END__

=pod

=head1 SYNOPSIS

    use Proto::Renata::Schema::ResultSet::Event;

=head1 DESCRIPTION

Proto::Renata::Schema::ResultSet::Event is ...

=head1 SEE ALSO

=cut
