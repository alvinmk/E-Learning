package Elearn::Schema::ElearnDB::Result::Courses;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "Core");
__PACKAGE__->table("courses");
__PACKAGE__->add_columns(
  "course_name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 100,
  },
  "description",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => 65535,
  },
);
__PACKAGE__->set_primary_key("course_name");
__PACKAGE__->has_many(
  "course_modules",
  "Elearn::Schema::ElearnDB::Result::CourseModule",
  { "foreign.course_name" => "self.course_name" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2010-08-24 13:51:06
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:eYhunF9NAE2m/OrB+H6Ilw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
