use 5.20.0;
use strict;
use warnings;

package Proto::Renata::Schema::Result::School;

# ABSTRACT: ...
# AUTHORITY
our $VERSION = '0.0001';

use Proto::Renata::Schema::Result -components => [qw/
/];
use DBIx::Class::Sweeten -all;
use experimental qw/postderef signatures/;

primary school_id => bigint auto_increment across UserSchool => 'User',
                                           many 'Class';
belongs Organisation => bigint;
    col name => varchar;


1;

__END__

=pod

=head1 SYNOPSIS

    use Proto::Renata::Schema::Result::School;

=head1 DESCRIPTION

Proto::Renata::Schema::Result::School is ...

=head1 SEE ALSO

=cut
