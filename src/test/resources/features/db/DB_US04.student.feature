
  Feature: I need to be able to list students by a certain admission_no in the students table via the database.

    Background: Database Connection
      * Database connection established

    Scenario: WWCAPI84 DB US04 I need to be able to list the firstname and lastname information of the students
    with admission_no between 18001 and 18010 in the students table via the database.
      * Query is prepared  in the students table with admission numbers
      * Query results lists the firstname and lastname are validated.
      * Database connection is closed