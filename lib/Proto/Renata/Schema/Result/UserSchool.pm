use 5.20.0;
use strict;
use warnings;

package Proto::Renata::Schema::Result::UserSchool;

# ABSTRACT: ...
# AUTHORITY
our $VERSION = '0.0001';

use Proto::Renata::Schema::Result -components => [qw/
/];
use DBIx::Class::Sweeten -all;
use experimental qw/postderef signatures/;

primary_belongs School => bigint;
primary_belongs User => bigint;

1;

__END__

=pod

=head1 SYNOPSIS

    use Proto::Renata::Schema::Result::UserSchool;

=head1 DESCRIPTION

Proto::Renata::Schema::Result::UserSchool is ...

=head1 SEE ALSO

=cut
