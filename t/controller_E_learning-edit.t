use strict;
use warnings;
use Test::More;

BEGIN { use_ok 'Catalyst::Test', 'Elearn' }
BEGIN { use_ok 'Elearn::Controller::E_learning::edit' }

ok( request('/e_learning/edit')->is_success, 'Request should succeed' );
done_testing();
