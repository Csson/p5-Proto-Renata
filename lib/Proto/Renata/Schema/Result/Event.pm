use 5.20.0;
use strict;
use warnings;

package Proto::Renata::Schema::Result::Event;

# ABSTRACT: ...
# AUTHORITY
our $VERSION = '0.0001';

use Proto::Renata::Schema::Result -components => [qw/
/];
use DBIx::Class::Sweeten -all;
use experimental qw/postderef signatures/;

primary event_id => bigint auto_increment;
belongs User => bigint;
belongs Student => bigint;
    col title => varchar;
    col category => varchar;
    col all_day => bool default_value '0';
    col start_date => datetime;
    col description => text { remove_column => 0, is_serializable => 1 };
    col sms_reminder => varchar;
    col sms_number => varchar;

1;

__END__

=pod

=head1 SYNOPSIS

    use Proto::Renata::Schema::Result::Event;

=head1 DESCRIPTION

Proto::Renata::Schema::Result::Event is ...

=head1 SEE ALSO

=cut
