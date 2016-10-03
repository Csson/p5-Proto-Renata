use 5.20.0;
use strict;
use warnings;

package Proto::Renata::Schema::Result::User;

# ABSTRACT: ...
# AUTHORITY
our $VERSION = '0.0001';

use Proto::Renata::Schema::Result -components => [qw/
/];
use DBIx::Class::Sweeten -all;
use experimental qw/postderef signatures/;

primary user_id => bigint auto_increment across UserSchool => 'School',
                                         across UserStudent => 'Student',
                                         many 'Visit',
                                         many 'Note',
                                         many 'Event';
belongs Organisation => bigint;
    col first_name => varchar;
    col last_name => varchar;

sub add_event($self, $args) {
    $self->create_related(events => $args);
}

1;

__END__

=pod

=head1 SYNOPSIS

    use Proto::Renata::Schema::Result::User;

=head1 DESCRIPTION

Proto::Renata::Schema::Result::User is ...

=head1 SEE ALSO

=cut
