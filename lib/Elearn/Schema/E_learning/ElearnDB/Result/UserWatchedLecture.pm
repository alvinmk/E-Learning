package Elearn::Schema::E_learning::ElearnDB::Result::UserWatchedLecture;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "Core");
__PACKAGE__->table("user_watched_lecture");
__PACKAGE__->add_columns(
  "user",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 100,
  },
  "lecture",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 20,
  },
  "time",
  {
    data_type => "TIMESTAMP",
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => 14,
  },
);
__PACKAGE__->set_primary_key("user", "time");
__PACKAGE__->belongs_to(
  "lecture",
  "Elearn::Schema::E_learning::ElearnDB::Result::Lecture",
  { filename => "lecture" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2010-09-21 09:49:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:wWuZmv0gtDkBGHkD8kFm1Q


# You can replace this text with custom content, and it will be preserved on regeneration
1;
