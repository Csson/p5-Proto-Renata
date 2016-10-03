use 5.20.0;
use strict;
use warnings;

package Proto::Renata::Schema::ResultSet::Note;

# ABSTRACT: ...
# AUTHORITY
our $VERSION = '0.0001';

use Proto::Renata::Schema::ResultSet -components => [qw/
/];
use experimental qw/postderef signatures/;

sub get_notes_by_student_id($self, $student_id) {

    return $self->prefetch('user')->search({ student_id => $student_id })->order_by('!created_date');

}

1;

__END__

=pod

=head1 SYNOPSIS

    use Proto::Renata::Schema::ResultSet::Note;

=head1 DESCRIPTION

Proto::Renata::Schema::ResultSet::Note is ...

=head1 SEE ALSO

=cut
