use 5.20.0;
use warnings;

package Proto::Renata::Config;

# ABSTRACT: ...
# AUTHORITY
our $VERSION = '0.0001';

use Moo;
with 'Config::FromHash::Auto';

use Dir::Self;
use experimental qw/postderef signatures/;

sub package { __PACKAGE__ }
sub dir { __DIR__ }

1;

__END__
