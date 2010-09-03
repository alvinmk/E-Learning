package Elearn::Schema::E_learning::ElearnDB::Result::Lecture;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "Core");
__PACKAGE__->table("lecture");
__PACKAGE__->add_columns(
  "creator",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 100,
  },
  "times_watched",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 80,
  },
  "description",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => 65535,
  },
  "category",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 20,
  },
  "public",
  { data_type => "TINYINT", default_value => undef, is_nullable => 0, size => 1 },
  "created",
  { data_type => "DATE", default_value => undef, is_nullable => 0, size => 10 },
  "filename",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 20,
  },
  "recomended",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  "filetype",
  { data_type => "VARCHAR", default_value => undef, is_nullable => 0, size => 4 },
  "language",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 20,
  },
);
__PACKAGE__->set_primary_key("filename");
__PACKAGE__->has_many(
  "chapters",
  "Elearn::Schema::E_learning::ElearnDB::Result::Chapter",
  { "foreign.lectureid" => "self.filename" },
);
__PACKAGE__->has_many(
  "course_modules",
  "Elearn::Schema::E_learning::ElearnDB::Result::CourseModule",
  { "foreign.lecture" => "self.filename" },
);
__PACKAGE__->has_many(
  "feedbacks",
  "Elearn::Schema::E_learning::ElearnDB::Result::Feedback",
  { "foreign.lectureid" => "self.filename" },
);
__PACKAGE__->belongs_to(
  "category",
  "Elearn::Schema::E_learning::ElearnDB::Result::Categories",
  { category => "category" },
);
__PACKAGE__->has_many(
  "lecture_has_tags",
  "Elearn::Schema::E_learning::ElearnDB::Result::LectureHasTags",
  { "foreign.lectureid" => "self.filename" },
);
__PACKAGE__->has_many(
  "lecture_questions",
  "Elearn::Schema::E_learning::ElearnDB::Result::LectureQuestions",
  { "foreign.lecture" => "self.filename" },
);
__PACKAGE__->has_many(
  "user_lecture_datas",
  "Elearn::Schema::E_learning::ElearnDB::Result::UserLectureData",
  { "foreign.lecture" => "self.filename" },
);
__PACKAGE__->has_many(
  "user_watched_lectures",
  "Elearn::Schema::E_learning::ElearnDB::Result::UserWatchedLecture",
  { "foreign.lecture" => "self.filename" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2010-09-03 15:53:04
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:+xZ0lnzCYT4JVVbJ/V27DA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
