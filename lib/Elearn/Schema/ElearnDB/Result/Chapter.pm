package Elearn::Schema::ElearnDB::Result::Chapter;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "Core");
__PACKAGE__->table("chapter");
__PACKAGE__->add_columns(
  "chapter",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 50,
  },
  "lectureid",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 20,
  },
  "start",
  { data_type => "FLOAT", default_value => undef, is_nullable => 0, size => 32 },
  "stop",
  { data_type => "FLOAT", default_value => undef, is_nullable => 0, size => 32 },
);
__PACKAGE__->set_primary_key("chapter", "lectureid", "start", "stop");
__PACKAGE__->belongs_to(
  "lectureid",
  "Elearn::Schema::ElearnDB::Result::Lecture",
  { filename => "lectureid" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2010-08-24 13:51:06
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:R7AoxH3FlEcI6vL+wtcVMQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
