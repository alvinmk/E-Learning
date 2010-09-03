package Elearn::Schema::E_learning::ElearnDB::Result::Courses;

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
  "Elearn::Schema::E_learning::ElearnDB::Result::CourseModule",
  { "foreign.course_name" => "self.course_name" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2010-09-03 15:53:04
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:PsYZK3iEOIRC6vU4vmbPDw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
