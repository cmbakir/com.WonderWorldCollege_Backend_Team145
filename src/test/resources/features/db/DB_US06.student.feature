

Feature:I need to be able to list students' roll_no information from largest to smallest based on certain criteria through the student database.

  Background: Database Connection
    * Database connection established

  Scenario: WWCAPI86 DB US06 List the roll_no information of the students whose father_occupation
  value in the students table in the database is Doctor or Police, from largest to smallest.

    * Query is prepared  in the students table according to the father_occupation value
    * Query results lists the roll_no information are validated
    * Database connection is closed



