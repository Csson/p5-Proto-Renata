use 5.20.0;
use warnings;

package Proto::Renata::Schema::ResultSetBase;

# ABSTRACT: ...
# AUTHORITY
our $VERSION = '0.0001';

use base 'DBIx::Class::ResultSet';

__PACKAGE__->load_components(qw/
    Helper::ResultSet
    Helper::ResultSet::OneRow
    Helper::ResultSet::Bare
/);

1;

__END__
