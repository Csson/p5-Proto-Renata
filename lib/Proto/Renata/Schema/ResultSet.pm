use 5.20.0;
use warnings;

package Proto::Renata::Schema::ResultSet;

# ABSTRACT: ...
# AUTHORITY
our $VERSION = '0.0001';

use base 'DBIx::Class::Candy::ResultSet';

sub base { $_[1] || 'Proto::Renata::Schema::ResultSetBase' }

sub perl_version { 20 }

sub experimental {
    [qw/
        signatures
        postderef
    /];
}

1;

__END__
