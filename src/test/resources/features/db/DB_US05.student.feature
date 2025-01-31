
Feature:I need to be able to list students starting with 'T' through the student database

  Background: Database Connection
    * Database connection established

    Scenario: WWCAPI85 DB US05 I need to be able to list the mother_name and mother:occupation values of students
    whose last name information starts with 'T' in the students table via the database.
      * The query is prepared with students whose lastname starts with T in the student table
      * Query results lists the mother:occupation and mother_name are validated.
      * Database connection is closed



