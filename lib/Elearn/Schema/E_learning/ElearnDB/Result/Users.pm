package Elearn::Schema::E_learning::ElearnDB::Result::Users;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "Core");
__PACKAGE__->table("users");
__PACKAGE__->add_columns(
  "name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 100,
  },
);
__PACKAGE__->set_primary_key("name");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2010-09-21 09:49:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:yk58i47b4DUCelKQoZiUtw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
