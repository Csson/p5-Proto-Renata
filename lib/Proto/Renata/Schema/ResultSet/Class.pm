use 5.20.0;
use strict;
use warnings;

package Proto::Renata::Schema::ResultSet::Class;

# ABSTRACT: ...
# AUTHORITY
our $VERSION = '0.0001';

use Proto::Renata::Schema::ResultSet -components => [qw/
/];
use experimental qw/postderef signatures/;

sub get_by_school_id($self, $school_id) {
    return $self->search({ school_id => $school_id })->order_by('name')->prefetch('students');
}

1;

__END__

=pod

=head1 SYNOPSIS

    use Proto::Renata::Schema::ResultSet::Class;

=head1 DESCRIPTION

Proto::Renata::Schema::ResultSet::Class is ...

=head1 SEE ALSO

=cut
