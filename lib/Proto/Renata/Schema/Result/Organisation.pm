use 5.20.0;
use strict;
use warnings;

package Proto::Renata::Schema::Result::Organisation;

# ABSTRACT: ...
# AUTHORITY
our $VERSION = '0.0001';

use Proto::Renata::Schema::Result -components => [qw/
/];
use DBIx::Class::Sweeten -all;
use experimental qw/postderef signatures/;

primary organisation_id => bigint auto_increment many 'User',
                                                 many 'Link',
                                                 many 'School';
    col name => varchar;


1;

__END__

=pod

=head1 SYNOPSIS

    use Proto::Renata::Schema::Result::Organisation;

=head1 DESCRIPTION

Proto::Renata::Schema::Result::Organisation is ...

=head1 SEE ALSO

=cut
