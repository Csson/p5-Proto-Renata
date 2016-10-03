use 5.20.0;
use strict;
use warnings;

package Proto::Renata::Schema::Result::Student;

# ABSTRACT: ...
# AUTHORITY
our $VERSION = '0.0001';

use Proto::Renata::Schema::Result -components => [qw/
/];
use DBIx::Class::Sweeten -all;
use experimental qw/postderef signatures/;

primary student_id => bigint auto_increment across UserStudent => 'User',
                                            many 'Visit',
                                            many 'Warning',
                                            many 'Guardian',
                                            many 'Studentcard',
                                            many 'Note',
                                            many 'Event';
belongs Class => bigint;
    col first_name => varchar;
    col last_name => varchar;
    col birth_date => date;
    col pin => char 4;
    col gender => enum [qw/male female/];
    col address => text { remove_column => 0, is_serializable => 1 };
    col phone => varchar;
    col email => varchar;

sub create_note($self, $args) {
    $self->create_related(notes => $args);
}

1;

__END__

=pod

=head1 SYNOPSIS

    use Proto::Renata::Schema::Result::Student;

=head1 DESCRIPTION

Proto::Renata::Schema::Result::Student is ...

=head1 SEE ALSO

=cut
