package Elearn::Schema::ElearnDB::Result::LectureQuestions;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "Core");
__PACKAGE__->table("lecture_questions");
__PACKAGE__->add_columns(
  "lecture",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 20,
  },
  "question",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 200,
  },
  "answer",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => 65535,
  },
  "alternative1",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => 65535,
  },
  "alternative2",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => 65535,
  },
  "user",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 100,
  },
  "question_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 32 },
);
__PACKAGE__->set_primary_key("question_id");
__PACKAGE__->belongs_to(
  "lecture",
  "Elearn::Schema::ElearnDB::Result::Lecture",
  { filename => "lecture" },
);
__PACKAGE__->has_many(
  "user_question_answers",
  "Elearn::Schema::ElearnDB::Result::UserQuestionAnswers",
  { "foreign.question" => "self.question_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2010-08-24 13:51:06
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:5jdVGa2LuC1nFMewVb16Ww


# You can replace this text with custom content, and it will be preserved on regeneration
1;
