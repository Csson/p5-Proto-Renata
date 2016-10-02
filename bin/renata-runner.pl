#!/usr/bin/env perl

# ABSTRACT: Short intro
# AUTHORITY
# PODNAME: renata-runner.pl
our $VERSION = '0.0100';

use strict;
use warnings;
use lib 'lib';

require Mojolicious::Commands;
Mojolicious::Commands->start_app('Proto::Renata');
