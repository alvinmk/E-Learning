use strict;
use warnings;
use Test::More;

BEGIN { use_ok 'Catalyst::Test', 'Elearn' }
BEGIN { use_ok 'Elearn::Controller::admin' }

ok( request('/admin')->is_success, 'Request should succeed' );
done_testing();
