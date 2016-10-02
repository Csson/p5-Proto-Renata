use 5.20.0;
use warnings;

package Proto::Renata::Schema::Result;

# ABSTRACT: ...
# AUTHORITY
our $VERSION = '0.0001';

use base 'DBIx::Class::Sweeten::Result';

sub base { $_[1] || 'Proto::Renata::Schema::ResultBase' }

sub default_result_namespace { 'Proto::Renata::Schema::Result' }

sub perl_version { 20 }

sub experimental {
    [qw/
        postderef
        signatures
    /];
}

1;

__END__
