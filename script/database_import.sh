mysql -u elearn E_Learning < E_learningDB.mysql
script/elearn_create.pl model E_learning::ElearnDB DBIC::Schema Elearn::Schema::E_learning::ElearnDB create=static dbi:mysql:E_Learning 'elearn' '' '{ AutoCommit => 1 }'
