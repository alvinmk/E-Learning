#!/bin/bash          
#WARNING! 
#RUNNING THIS WILL DROP ALL DATA FROM THE DATABASE

echo "RUNNING THIS WILL DROP ALL DATA FROM THE DATABASE"
echo "Continue? [y/n]"
read answer
if [ "$answer" = "y" ]
	then		

		#Create the database and user
	
		echo "Setting up database for Elearning, needs your mysql root password"
		mysql -u root -p -e "CREATE DATABASE E_Learning;"
		mysql -u root -p -e "CREATE USER elearn@localhost;"
		mysql -u root -p -e "GRANT ALL ON E_Learning.* TO elearn@localhost;"
		#Create the tables
		mysql -u elearn E_Learning < E_learningDB.mysql
		#Update the perl scripts connecting the database
		echo "Creating Elearnig database catalyst coupling"
		script/elearn_create.pl model E_learning::ElearnDB DBIC::Schema Elearn::Schema::E_learning::ElearnDB create=static dbi:mysql:E_Learning 'elearn' '' '{ AutoCommit => 1 }'
		chmod 777 Makefile.pl
		perl ../Makefile.PL
fi
