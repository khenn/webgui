# Tests WebGUI::Asset::Wobject::Survey
#
#

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../lib";
use Test::More;
use Test::Deep;
use Test::MockObject::Extends;
use Test::Exception;
use Data::Dumper;
use List::Util qw/shuffle/;
use WebGUI::Test;    # Must use this before any other WebGUI modules
use WebGUI::Session;
use Tie::IxHash;

#----------------------------------------------------------------------------
# Init
my $session = WebGUI::Test->session;

#----------------------------------------------------------------------------
# Tests
my $tests = 36;
plan tests => $tests + 1;

#----------------------------------------------------------------------------
# put your tests here

my $usedOk = use_ok('WebGUI::Asset::Wobject::Survey::ExpressionEngine');

SKIP: {

    skip $tests, "Unable to load ExpressionEngine" unless $usedOk;

    my $e = "WebGUI::Asset::Wobject::Survey::ExpressionEngine";

    is( $e->run( $session, 'jump { 1 } target' ),
        undef, "Nothing happens unless we turn on enableSurveyExpressionEngine in config" );
    WebGUI::Test->originalConfig('enableSurveyExpressionEngine');
    $session->config->set( 'enableSurveyExpressionEngine', 1 );
    is( $e->run( $session, 'jump { 1 } target' ), 'target', "..now we're in business!" );

    my %values = (
        n  => 5,
        s1 => 'my string',
    );

    my %scores = (
        n1 => 1,
        n2 => 2,
    );

    # These should all jump to 'target'
    my @should_pass = (
        q{jump { 1 } target},
        q{jump { return 1 } target},
        q{jump { "string" } target},
        q{jump { value(n) == 5 } target},
        q{jump { value(n) > 0 } target},
        q{jump { value(s1) eq "my string" } target},
        q{jump { value(s1) =~ m/my/ } target},
        q{jump { value(n) == 4 or value(n) == 5 } target},
        q{jump { value(n) == 5 && value(n) > 0 } target},
        q{jump { (value(n) > 1 ? 10 : 11) == 10 } target},
        q{jump { $a=1; $a++; $a++; $a *= 2; $a == 6 } target},
        q{jump { @a = (1..10); $a[0] == 1 && @a == 10 } target},               # arrays
        q{jump { if (value(n) == 5) { 1 } else { 0 } } target},                # if statement
        q{jump { $q2 = 3; $avg = (value(n) + $q2) / 2; $avg == 4 } target},    # look ma, averages!
        q{jump { $q2 = 3; avg(value(n), $q2) == 4 } target},                   # look ma, built-in avg sub!
        q{jump { value(n) == 5 } target; jump { value(n) == 5 } targetX},      # first jump wins
        q{jump { value(n) == 0 } targetX; jump { value(n) == 5 } target},      # false jumps ignored
        q{jump { min(3,5,2) == 2 } target},                                    # List::Util min
        q{jump { sum(value(n),1,1,1) == 8 } target},                           # List::Util sum, etc..
        q{jump { score(n1) == 1 && score(n2) == 2 } target},                   # score() works
    );

    my @should_fail = (
        q{},                                                                   # empty
        q{ return },                                                           # empty
        q{1},                                                                  # doesn't call jump
        q|{|,                                                                  # doesn't compile
        q{blah-dee-blah-blah},                                                 # rubbish expression
        q{jump {} target},                                                     # empty anon sub to jump
        q{jump { 0 } target},                                                  # false sub to jump
        q{jump { value(n) == 500 } target},
        q{jump { value(s1) eq 'blah' } target},
        q{jump { time } target},                                               # time and other opcodes not allowed
    );

    for my $expr (@should_pass) {
        is( $e->run( $session, $expr, { values => \%values, scores => \%scores } ),
            'target', "\"$expr\" jumps as expected" );
    }

    for my $expr (@should_fail) {
        is( $e->run( $session, $expr, { values => \%values, scores => \%scores } ),
            undef, "\"$expr\" fails as expected" );
    }

    $e->run( $session, q{jump {$x = value(s1); $x = 'X'} target}, { values => \%values } );
    is( $values{s1}, 'my string', "Expression can't modify values" );

    like( $e->run( $session, '{', { validate => 1 } ), qr/Missing right curly/, "Validation option works" );

    # Check validTargets option
    is( $e->run( $session, q{jump {1} target}, { values => \%values, validTargets => { a => 1 } } ),
        undef, 'target is not valid' );
    is( $e->run( $session, q{jump {1} target}, { values => \%values, validTargets => { target => 1 } } ),
        'target', '..whereas now it is ok' );
}

#----------------------------------------------------------------------------
# Cleanup
END { }