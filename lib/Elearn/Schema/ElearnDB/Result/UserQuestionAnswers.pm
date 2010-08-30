package Elearn::Schema::E_learning::ElearnDB::Result::UserQuestionAnswers;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "Core");
__PACKAGE__->table("user_question_answers");
__PACKAGE__->add_columns(
  "question",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 32 },
  "correct_answer",
  { data_type => "TINYINT", default_value => undef, is_nullable => 0, size => 1 },
  "user_answered",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 100,
  },
);
__PACKAGE__->set_primary_key("question", "user_answered");
__PACKAGE__->belongs_to(
  "question",
  "Elearn::Schema::E_learning::ElearnDB::Result::LectureQuestions",
  { question_id => "question" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2010-08-24 13:51:06
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:xRi0X+9xGx8abTibtFvI+Q


# You can replace this text with custom content, and it will be preserved on regeneration
1;
