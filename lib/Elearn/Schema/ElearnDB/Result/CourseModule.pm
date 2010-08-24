package Elearn::Schema::ElearnDB::Result::CourseModule;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "Core");
__PACKAGE__->table("course_module");
__PACKAGE__->add_columns(
  "course_name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 50,
  },
  "lecture",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 50,
  },
  "lecture_number",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("course_name", "lecture");
__PACKAGE__->belongs_to(
  "lecture",
  "Elearn::Schema::ElearnDB::Result::Lecture",
  { filename => "lecture" },
);
__PACKAGE__->belongs_to(
  "course_name",
  "Elearn::Schema::ElearnDB::Result::Courses",
  { course_name => "course_name" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2010-08-24 13:51:06
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:VP/PHNsbsH6CAYVHkSlKsg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
