use 5.20.0;
use strict;
use warnings;

package Proto::Renata::Schema::ResultSet::Student;

# ABSTRACT: ...
# AUTHORITY
our $VERSION = '0.0001';

use Proto::Renata::Schema::ResultSet -components => [qw/
/];
use experimental qw/postderef signatures/;

sub search_suggestions($self, $search_string) {
    my $first_name_hits = $self->search({ 'first_name' => { like => "$search_string%" }});
    my $last_name_hits = $self->search({ 'last_name' => { like => "$search_string%" }});

    return $self->prefetch('class')->search_or([$first_name_hits, $last_name_hits]);
}

sub get_by_id($self, $student_id) {
    return $self->prefetch([qw/warnings guardians studentcards notes/])->prefetch({ class => { school => 'organisation'}})->find($student_id);
}

1;

__END__

=pod

=head1 SYNOPSIS

    use Proto::Renata::Schema::ResultSet::Student;

=head1 DESCRIPTION

Proto::Renata::Schema::ResultSet::Student is ...

=head1 SEE ALSO

=cut
