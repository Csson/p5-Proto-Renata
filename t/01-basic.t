use strict;
use warnings;
use Test::More;
use if $ENV{'AUTHOR_TESTING'}, 'Test::Warnings';

use Proto::Renata::Util qw/time_ago/;

like time_ago(91), qr/\D2 minuter/, '2 minuter';


done_testing;
