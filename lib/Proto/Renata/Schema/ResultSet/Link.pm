use 5.20.0;
use strict;
use warnings;

package Proto::Renata::Schema::ResultSet::Link;

# ABSTRACT: ...
# AUTHORITY
our $VERSION = '0.0001';

use Proto::Renata::Schema::ResultSet -components => [qw/
/];
use experimental qw/postderef signatures/;

sub get_by_user_id($self, $user_id) {
    return $self->search({ 'users.user_id' => { -ident => $user_id } })
                ->prefetch({ organisation => 'users' })
                ->order_by('me.name');
}

1;

__END__

=pod

=head1 SYNOPSIS

    use Proto::Renata::Schema::ResultSet::Link;

=head1 DESCRIPTION

Proto::Renata::Schema::ResultSet::Link is ...

=head1 SEE ALSO

=cut
