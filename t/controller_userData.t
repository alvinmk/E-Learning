use strict;
use warnings;
use Test::More;

BEGIN { use_ok 'Catalyst::Test', 'Elearn' }
BEGIN { use_ok 'Elearn::Controller::userData' }

ok( request('/userdata')->is_success, 'Request should succeed' );
done_testing();
