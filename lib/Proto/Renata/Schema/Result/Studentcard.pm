use 5.20.0;
use strict;
use warnings;

package Proto::Renata::Schema::Result::Studentcard;

# ABSTRACT: ...
# AUTHORITY
our $VERSION = '0.0001';

use Proto::Renata::Schema::Result -components => [qw/
/];
use DBIx::Class::Sweeten -all;
use experimental qw/postderef signatures/;

primary studentcard_id => bigint auto_increment;
belongs Student => bigint;
    col heading => varchar;
    col info => varchar;

1;

__END__

=pod

=head1 SYNOPSIS

    use Proto::Renata::Schema::Result::Studentcard;

=head1 DESCRIPTION

Proto::Renata::Schema::Result::Studentcard is ...

=head1 SEE ALSO

=cut
