use 5.20.0;
use strict;
use warnings;

package Proto::Renata::Schema::Result::Guardian;

# ABSTRACT: ...
# AUTHORITY
our $VERSION = '0.0001';

use Proto::Renata::Schema::Result -components => [qw/
/];
use DBIx::Class::Sweeten -all;
use experimental qw/postderef signatures/;

primary guardian_id => bigint auto_increment;
belongs Student => bigint;
    col name => varchar;
    col post_address => text { remove_column => 0, is_serializable => 1 };
    col phone => varchar;
    col work_phone => varchar;
    col email => varchar;


1;

__END__
