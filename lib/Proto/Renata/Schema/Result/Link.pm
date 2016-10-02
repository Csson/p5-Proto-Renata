use 5.20.0;
use strict;
use warnings;

package Proto::Renata::Schema::Result::Link;

# ABSTRACT: ...
# AUTHORITY
our $VERSION = '0.0001';

use Proto::Renata::Schema::Result -components => [qw/
/];
use DBIx::Class::Sweeten -all;
use experimental qw/postderef signatures/;

primary link_id => bigint auto_increment;
belongs Organisation => bigint;
    col url => text { remove_column => 0, is_serializable => 1 };
    col name => varchar;

1;

__END__

=pod

=head1 SYNOPSIS

    use Proto::Renata::Schema::Result::Link;

=head1 DESCRIPTION

Proto::Renata::Schema::Result::Link is ...

=head1 SEE ALSO

=cut
