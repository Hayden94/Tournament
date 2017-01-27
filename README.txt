Running the program:
In order to run the program successfully, one must have PostgreSQL, Python 2.7, and GitBash installed.
The steps to run this program include: 
	Creating the database, its tables and views. This is done by:
		1. Openning the GitBash terminal and CD to the /tournament directory
		2. Import the sql database by running the commands
			> psql
			> \i tournament.sql
	
	Quit the psql command line and run tests to verify if the program works properly:
		1. Quit psql with command:
			> \q
		2. Run test program with command:
			> python tournament_test.py
		3. Read output to make sure all tests pass.


Included files:
tournament.sql - sql file for create the database, its tables, and views.
tournament.py - Python file for Swiss style tournament logic
tournament_test.py - Python client file to run tests on tournament.py 
			
		