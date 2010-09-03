package Elearn::Schema::E_learning::ElearnDB::Result::LectureHasTags;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "Core");
__PACKAGE__->table("lecture_has_tags");
__PACKAGE__->add_columns(
  "tag",
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
);
__PACKAGE__->set_primary_key("tag", "lectureid");
__PACKAGE__->belongs_to(
  "tag",
  "Elearn::Schema::E_learning::ElearnDB::Result::Tags",
  { tag => "tag" },
);
__PACKAGE__->belongs_to(
  "lectureid",
  "Elearn::Schema::E_learning::ElearnDB::Result::Lecture",
  { filename => "lectureid" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2010-09-03 15:53:04
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Hw1A+RXUGOcmYYIvsmRyfA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
