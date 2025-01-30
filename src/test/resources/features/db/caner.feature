Feature: WWCAPI-38[DB_US07]

  Scenario:List the contents in the users table with role equal to parent,
  sorted by user id in descending order.

    * Database connection established
    * Query is prepared where role equal to parent in users table.
    * Query results validated according to the user id in descending order.
    * Database connection is closed


  Scenario:WWCAPI-43[DB_US12]List the first 5 employees in the staff table sorted by work experience
  from the oldest to the newest.

    * Database connection established
    * Query is prepared for the first five employees in the staff table.
    * Query results validated according to the  work experience in descending order.
    * Database connection is closed

    Scenario:WWCAPI-41[DB_US08] The name information for the specified id in the topic table should be updatable.

      * Database connection established
      * Prepare and run UpdateQuery that returns the name information of the specified id in the topic table.
      * Verifies that the data returning the name of the requested id in the topic table has been updated.
      * Database connection is closed







