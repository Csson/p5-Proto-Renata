use 5.20.0;
use warnings;

package Proto::Renata::Schema::ResultBase;

# ABSTRACT: ...
# AUTHORITY
our $VERSION = '0.0001';

use base 'DBIx::Class::Sweeten::Result::Base';
use experimental qw/postderef signatures/;

__PACKAGE__->load_components(qw/
    Helper::Row::RelationshipDWIM
    InflateColumn::DateTime
    Sweeten::Helper::Row
    Helper::Row::ToJSON
/);

1;

__END__
