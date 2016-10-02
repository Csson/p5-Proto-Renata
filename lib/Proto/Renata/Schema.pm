use 5.20.0;
use warnings;

package Proto::Renata::Schema;

# ABSTRACT: ...
# AUTHORITY
our $VERSION = '0.0001';

use mro 'c3';
sub schema_version { 7 }

use base 'DBIx::Class::Sweeten::Schema';
use Proto::Renata::Config;
use experimental qw/postderef signatures/;

__PACKAGE__->load_namespaces;

sub connection {
    my $config = Proto::Renata::Config->new;
    return shift->next::method($config->get('db/dsn'), $config->get('db/user'), $config->get('db/password'), $config->get('db/settings'));
}

1;

__END__

=pod

=head1 SYNOPSIS

    use Proto::Schema;

=head1 DESCRIPTION

Proto::Schema is ...

=head1 SEE ALSO

=cut
