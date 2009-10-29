#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'SVK::Log::Filter::Format' );
}

diag( "Testing SVK::Log::Filter::Format $SVK::Log::Filter::Format::VERSION, Perl $], $^X" );
