package Elearn::Schema::ElearnDB::Result::Feedback;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "Core");
__PACKAGE__->table("feedback");
__PACKAGE__->add_columns(
  "lectureid",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 50,
  },
  "user",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 100,
  },
  "feedback",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => 65535,
  },
  "time",
  {
    data_type => "TIMESTAMP",
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => 14,
  },
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "response_to",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->belongs_to(
  "lectureid",
  "Elearn::Schema::ElearnDB::Result::Lecture",
  { filename => "lectureid" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2010-08-24 13:51:06
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:r+Qg9sDGzYGpWXqOgnE64A


# You can replace this text with custom content, and it will be preserved on regeneration
1;
