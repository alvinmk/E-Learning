package Elearn::Schema::E_learning::ElearnDB::Result::Tags;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "Core");
__PACKAGE__->table("tags");
__PACKAGE__->add_columns(
  "tag",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 50,
  },
);
__PACKAGE__->set_primary_key("tag");
__PACKAGE__->has_many(
  "lecture_has_tags",
  "Elearn::Schema::E_learning::ElearnDB::Result::LectureHasTags",
  { "foreign.tag" => "self.tag" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2010-09-21 09:49:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:8gD1FmSvoDRbTSbzGPYkUw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
