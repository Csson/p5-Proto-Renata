use 5.20.0;
use strict;
use warnings;

package Proto::Renata::Schema::Result::Class;

# ABSTRACT: ...
# AUTHORITY
our $VERSION = '0.0001';

use Proto::Renata::Schema::Result -components => [qw/
/];
use DBIx::Class::Sweeten -all;
use experimental qw/postderef signatures/;

primary class_id => bigint auto_increment many 'Student';
belongs School => bigint;
    col name => varchar;

1;

__END__

=pod

=head1 SYNOPSIS

    use Proto::Renata::Schema::Result::Class;

=head1 DESCRIPTION

Proto::Renata::Schema::Result::Class is ...

=head1 SEE ALSO

=cut
