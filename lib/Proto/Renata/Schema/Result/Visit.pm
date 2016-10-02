use 5.20.0;
use strict;
use warnings;

package Proto::Renata::Schema::Result::Visit;

# ABSTRACT: ...
# AUTHORITY
our $VERSION = '0.0001';

use Proto::Renata::Schema::Result -components => [qw/
/];
use DBIx::Class::Sweeten -all;
use experimental qw/postderef signatures/;

primary visit_id => bigint auto_increment;
belongs User => bigint;
belongs Student => bigint;
    col visit_date => datetime;

1;

__END__

=pod

=head1 SYNOPSIS

    use Proto::Renata::Schema::Result::Visit;

=head1 DESCRIPTION

Proto::Renata::Schema::Result::Visit is ...

=head1 SEE ALSO

=cut
