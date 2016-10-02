use 5.20.0;
use warnings;

package Proto::Renata::Util;

# ABSTRACT: ...
# AUTHORITY
our $VERSION = '0.0100';

use experimental qw/postderef signatures/;
use ReadonlyX;
use utf8;
use Exporter 'import';
our @EXPORT_OK = qw/
    time_ago
    long_time_ago
/;

Readonly::Scalar my $MINUTE = 60;
Readonly::Scalar my $HOUR = $MINUTE * 60;
Readonly::Scalar my $DAY = $HOUR * 24;
Readonly::Scalar my $WEEK = $DAY * 7;
Readonly::Scalar my $MONTH = $DAY * 30;
Readonly::Scalar my $YEAR = $DAY * 365;

sub time_ago($seconds) {
    return $seconds < 29            ? 'för mindre än en minut sedan'
         : $seconds / $MINUTE < 1.5 ? 'för en minut sedan'
         : $seconds / $MINUTE < 45  ? sprintf 'för %.0f minuter sedan', $seconds / $MINUTE
         : $seconds / $HOUR < 1.5   ? 'för en timme sedan'
         : $seconds / $HOUR < 45    ? sprintf 'för %.0f timmar sedan', $seconds / $HOUR
         : $seconds / $DAY < 1.75   ? 'för en dag sedan'
         : $seconds / $DAY < 29     ? sprintf 'för %.0f dagar sedan', $seconds / $DAY
         : $seconds / $MONTH < 1.5  ? 'för en månad sedan'
         : $seconds / $MONTH < 12   ? sprintf 'för %.0f månader sedan', $seconds / $MONTH
         : $seconds / $YEAR < 1.25  ? 'för ett år sedan'
         :                            'för mer än ett år sedan'
         ;
}

sub long_time_ago($duration) {
    my $months = $duration->months > 0 ? sprintf(' och %d månad%s', $duration->months, $duration->months > 1 ? 'er' : '') : '';
    return sprintf '%d år%s', $duration->years, $months;
}

1;
