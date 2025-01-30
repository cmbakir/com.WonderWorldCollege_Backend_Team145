Feature: DB Testing

  Background: Database Connection
    * Database connection established


  @02
    #List the IDs of contents from the class_sections table where the class_id and section_id values are equal.
  Scenario: List the IDs of the contents in the class_sections table where class_id and section_id are equal
    * Query is prepared where class_id and section_id are equal in the class_sections table
    * Query results lists are validated.
    * Database connection is closed


  @US04

  # List the firstname and lastname
  # of students in the students table with admission numbers between 18001 and 18010.
  Scenario: List the firstname and lastname in the students table with admission numbers
    * Query is prepared  in the students table with admission numbers
    * Query results lists the firstname and lastname are validated.
    * Database connection is closed

  @US09
  Scenario: Insert transport_route
    * Insert a new record into the transport_route table
    * Verify the data information Result is obtained.
    * retrieve the inserted record's ID
  @US10
  Scenario: Insert and delete a record from visitors_book table
    * Insert a new record into the visitors_book table
    * Verify the data information Result is obtained.
    * retrieve the inserted record's ID
    * Delete the record from the visitors_book table using the retrieved ID
    * Verify the data information Result is obtained.
    * Database connection is closed


  Scenario: Retrieve and list the first 5 staff members by work_exp
    * Query the first 5 staff members by work_exp in ascending order
    * Verify the staff members are listed correctly
    * Database connection is closed
  @02
  Scenario: Get email addresses where firstname contains 'al'
    * query prepared for email addresses where firstname contains 'al'
    * should be see the list of email addresses with 'al' in the firstname
    * Database connection is closed

  @US29
  Scenario: inserted bulk data from subjects table
    * insert 5 random subjects into the database
    * 5 Enter the data in bulk.Check that is added to the table
    * Database connection is closed



  @US25
  Scenario: List the student IDs and entry dates (entrydt) from the staff_rating table where the comments column contains 'good'.
  * query prepared for student IDs and entrydt where the column contains good.
  * Verify the student IDs and entrydts are listed correctly


  @US26
  Scenario: List the admission_no, firstname, lastname of students from the online_admissions table who registered in January 2023.
    * query prepared for student firstname, lastname and online_admissions where the column contains year and month
    * Verify the firstname, lastname and online_admissions are listed correctly

  @US27
  Scenario: List students from the online_admissions table who share the same last name.
    * query prepared for student firstname, lastname and online_admissions who share the same last name.
    * Verify the firstname, lastname and online_admissions are listed correctly for listing the student

  @US19
  Scenario: WWCAPI-14 DB_US19 List the top 5 longest email addresses from the students table
    * Query is prepared to find the top 5 longest emails in the students table
    * Top 5 longest email addresses are validated.
    * Database connection is closed


  @US22
  Scenario:DB_US22 List the name and ID of the top 10 income values from the income table based on the highest amount
    * Query is prepared for the name and ID of the top 10 income values in the income table based on the highest amount
    * Query results lists the name and ID are validated.
    * Database connection is closed

  @US23
  Scenario: DB_US23 List the first 3 staff members with the longest employment duration in the staff table according to their departments.
    * Query is prepared for the name of the 3 income values with the longest employement in the staff table according to their departments
    * Query results lists the name is validated.
    * Database connection is closed


  @US16
  Scenario: DB_US16 Retrieve the last 10 records from online_admissions table
    * execute the query to fetch the last 10 records from online_admissions
    * should see the last 10 records displayed
    * Database connection is closed

  @US17
  Scenario: DB_US17 Calculate the average passing percentage
    * execute the query to calculate the average passing percentage
    * should see the average passing percentage displayed
    * Database connection is closed

  @US18
  Scenario: DB_US18 Count distinct students in onlineexam_students table
    * execute the query to count distinct student_session_id
    * should see the total number of students displayed
    * Database connection is closed


  @US24
  Scenario: DB_US24 List the email, phone, and salary information of the oldest staff member in the staff table.
    * Query is prepared for the email, phone, and salary informations of the oldest staff member values in the staff table.
    * Query results lists the email, phone, and salary informations are validated.
    * Database connection is closed

  @US11
  Scenario: DB_US11 Update the fine_amount value to '200.00' for the record in the transport_feemaster table where the month value is 'October'.

    * Query is prepared for updating the fine_amount value to '200.00' for the record in the transport_feemaster table where the month value is 'October'.
    * Query results lists the fine_amount value informations where month is october are validated as '200.00'.
    * Database connection is closed



  @US20
  Scenario: WWCAPI-15 DB_US20 Find and print the highest expense name from the expenses table
    * Query is prepared to find the highest expense name in the expenses table
    * The highest expense name is printed
    * The result should not be empty
    * Database connection is closed

  @US21
  Scenario: WWCAPI-17 DB_US21 Insert a new call record into general_calls table
    * A new call record is inserted into the general_calls table
    * The inserted call record is validated.
    * Database connection is closed



