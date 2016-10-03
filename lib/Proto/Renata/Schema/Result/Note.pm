use 5.20.0;
use strict;
use warnings;

package Proto::Renata::Schema::Result::Note;

# ABSTRACT: ...
# AUTHORITY
our $VERSION = '0.0001';

use Proto::Renata::Schema::Result -components => [qw/
/];
use DBIx::Class::Sweeten -all;
use experimental qw/postderef signatures/;

primary note_id => bigint auto_increment;
belongs Student => bigint;
belongs User => bigint;
    col created_date => datetime;
    col contact_type => varchar;
    col note => text { remove_column => 0, is_serializable => 1 };


1;

__END__

=pod

=head1 SYNOPSIS

    use Proto::Renata::Schema::Result::Note;

=head1 DESCRIPTION

Proto::Renata::Schema::Result::Note is ...

=head1 SEE ALSO

=cut
