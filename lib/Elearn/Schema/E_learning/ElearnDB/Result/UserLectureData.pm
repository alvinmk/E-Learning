package Elearn::Schema::E_learning::ElearnDB::Result::UserLectureData;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "Core");
__PACKAGE__->table("user_lecture_data");
__PACKAGE__->add_columns(
  "user",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 100,
  },
  "rating",
  { data_type => "TINYINT", default_value => undef, is_nullable => 1, size => 1 },
  "lecture",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 20,
  },
  "times_watched",
  { data_type => "INT", default_value => 0, is_nullable => 1, size => 11 },
  "favorite",
  { data_type => "TINYINT", default_value => 0, is_nullable => 1, size => 1 },
);
__PACKAGE__->set_primary_key("user", "lecture");
__PACKAGE__->belongs_to(
  "lecture",
  "Elearn::Schema::E_learning::ElearnDB::Result::Lecture",
  { filename => "lecture" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2010-09-21 09:49:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ciBmKKjc9DbQ909NoQ9LfQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
