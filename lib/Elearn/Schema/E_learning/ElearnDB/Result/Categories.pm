package Elearn::Schema::E_learning::ElearnDB::Result::Categories;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "Core");
__PACKAGE__->table("categories");
__PACKAGE__->add_columns(
  "category",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 50,
  },
);
__PACKAGE__->set_primary_key("category");
__PACKAGE__->has_many(
  "lectures",
  "Elearn::Schema::E_learning::ElearnDB::Result::Lecture",
  { "foreign.category" => "self.category" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2010-09-03 15:53:04
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:rXK5XodOwjbCSlnD+0HBRg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
