package stepdefinitions;

import com.mysql.cj.protocol.Resultset;
import helperDB.CommonData;
import helperDB.subjects;
import io.cucumber.java.en.Given;
import manage.Manage;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static helperDB.CommonData.*;
import static helperDB.JDBC_Structure_Methods.*;
import static org.junit.Assert.*;

public class DB_Stepdefinitions extends Manage {
    // DB
    CommonData data = new CommonData();

    @Given("Database connection established")
    public void database_connection_established() {
        createConnection();
    }

    @Given("Database connection is closed")
    public void database_connection_is_closed() {
        closeConnection();
    }

    @Given("User_chats table query prepared.")
    public void user_chats_table_query_prepared() throws SQLException {

    }

    @Given("Query results {int} are validated.")
    public void query_results_are_validated(int expected) throws SQLException {

    }

    @Given("Query is prepared where class_id and section_id are equal in the class_sections table")
    public void query_is_prepared_where_class_id_and_section_id_are_equal_in_the_class_sections_table() throws SQLException {
        query=getUS02_class_sections();
        resultSet=getStatement().executeQuery(query);
    }

    @Given("Query results lists are validated.")
    public void query_results_lists_are_validated() throws SQLException {
        sectionId=new ArrayList<>();
        while (resultSet.next()) {
            sectionId.add(resultSet.getInt("id"));
        }
        if(!sectionId.isEmpty()){
            for (int i = 0; i < sectionId.size() ; i++) {
                assertEquals(sectionId.get(i),expectedSectionId.get(i));
                System.out.println(sectionId.get(i) + " ");
            }
        }else{
            assertFalse("Result set is Empty", resultSet.next());
        }
    }

    @Given("Query is prepared  in the students table")
    public void query_is_prepared_in_the_students_table() throws SQLException {

    }

    @Given("Query result {string} are validated.")
    public void query_result_are_validated(String expectedMail) throws SQLException {

    }

    @Given("Query is prepared  in the students table with admission numbers")
    public void query_is_prepared_in_the_students_table_with_admission_numbers() throws SQLException {
        query=getUS04_studentsTableAdmissionNo();
        resultSet=getStatement().executeQuery(query);
    }

    @Given("Query results lists the firstname and lastname are validated.")
    public void query_results_lists_the_firstname_and_lastname_are_validated() throws SQLException {
        studentLast_FirstName=new HashMap<>();
        while (resultSet.next()){
            studentLast_FirstName.put(resultSet.getString("lastname"),resultSet.getString("firstname"));
        }
        for (String lastname : data.getExpstudentLast_FirstName().keySet()){
            String expFirstName=data.getExpstudentLast_FirstName().get(lastname);
            String actualFirstName=studentLast_FirstName.get(lastname);
            assertEquals("Firstname does not match for lastname "+lastname, expFirstName, actualFirstName);
        }

    }

    @Given("Query is prepared  in the students table whose lastname starts with {string}")
    public void query_is_prepared_in_the_students_table_whose_lastname_starts_with(String string) throws SQLException {

    }

    @Given("Query results lists the mother_name and mother_occupation.")
    public void query_results_lists_the_mother_name_and_mother_occupation() throws SQLException {

    }

    @Given("Query is prepared  in the students table according to the father_occupation value")
    public void query_is_prepared_in_the_students_table_according_to_the_father_occupation_value() throws SQLException {

    }

    @Given("Query results lists the roll_no information are validated")
    public void query_results_lists_the_roll_no_information_are_validated() throws SQLException {


    }

    @Given("Query is prepared  in the users table role=parent")
    public void query_is_prepared_in_the_users_table_role_parent() throws SQLException {

    }

    @Given("List query results roll information")
    public void list_query_results_roll_information() throws SQLException {

    }

    @Given("Insert a record into the topic table")
    public void insert_a_record_into_the_topic_table() throws SQLException {

    }

    @Given("retrieve the inserted record's ID")
    public void retrieve_the_inserted_record_s_id() throws SQLException {
        ResultSet generatedKeys = preparedStatement.getGeneratedKeys();
        if (generatedKeys.next()) {
            insertedId = generatedKeys.getInt(1); // Eklenen kaydın ID'sini al
        }
        System.out.println("Inserted Id kaydedildi"+ insertedId);

    }


    @Given("update the record's name using the retrieved ID")
    public void update_the_record_s_name_using_the_retrieved_id() throws SQLException {

    }

    @Given("Verify the data information Result is obtained.")
    public void verify_the_data_information_result_is_obtained() {
        int rowCount=0;
        try {
            rowCount= preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        assertEquals(1,rowCount);
    }

    @Given("Insert a new record into the transport_route table")
    public void insert_a_new_record_into_the_transport_route_table() throws SQLException {
        query=getUS09_inserted_transportRoute();
        preparedStatement=getPraperedStatementGeneratedKeys(query,true);
        /**  Table: transport_route
         Columns:
         route_title varchar(100)
         no_of_vehicle int(11)
         note text
         is_active varchar(255)
         created_at timestamp
         updated_at date   */
        preparedStatement.setString(1,"Ennenda");
        preparedStatement.setInt(2,faker.number().numberBetween(1,5));
        preparedStatement.setString(3,faker.lorem().word());
        preparedStatement.setString(4,"Active");
        preparedStatement.setTimestamp(5,new Timestamp(System.currentTimeMillis()));
        preparedStatement.setDate(6,Date.valueOf("2025-01-27"));

    }

    @Given("Insert a new record into the visitors_book table")
    public void insert_a_new_record_into_the_visitors_book_table() throws SQLException {
        query=getUS10_insertedVisitorsBook();
        preparedStatement=getPraperedStatementGeneratedKeys(query,true);
        //parametreler hazırlanır
        preparedStatement.setInt(1,105);//staff id
        preparedStatement.setInt(2,201);//student session id
        preparedStatement.setString(3,"Online");//source
        preparedStatement.setString(4,"Admission");//purpose
        preparedStatement.setString(5,"John Doe");//name
        preparedStatement.setString(6,"j.doe@hotmail.com");//email
        preparedStatement.setString(7,"67543212345");//contact
        preparedStatement.setString(8,"Auswise");//ıdprofil
        preparedStatement.setInt(9,3);
        preparedStatement.setDate(10,Date.valueOf("2025-01-27"));
        preparedStatement.setString(11,"09.00");
        preparedStatement.setString(12,"17.00");
        preparedStatement.setString(13,"Meeting");
        preparedStatement.setString(14,"image.jpg");
        preparedStatement.setString(15,"Herr BAKIR");
        preparedStatement.setTimestamp(16,new Timestamp(System.currentTimeMillis()));



    }

    @Given("Delete the record from the visitors_book table using the retrieved ID")
    public void delete_the_record_from_the_visitors_book_table_using_the_retrieved_id() throws SQLException {
        query=getUS10_deletedVisitorsBook();
        preparedStatement=getPraperedStatement(query);
        preparedStatement.setInt(1,insertedId);
    }

    @Given("Update fine_amount to '200.00' for records where month is 'October'")
    public void update_fine_amount_to_200_for_records_where_month_is_october() throws SQLException {

        // Parametreleri ayarla

    }

    @Given("Query the first 5 staff members by work_exp in ascending order")
    public void query_the_first_5_staff_members_by_work_exp_in_ascending_order() throws SQLException {

    }

    @Given("Verify the staff members are listed correctly")
    public void verify_the_staff_members_are_listed_correctly() {

    }


    @Given("query prepared for email addresses where firstname contains 'al'")
    public void query_prepared_for_email_addresses_where_firstname_contains_al() throws SQLException {


    }

    @Given("should be see the list of email addresses with 'al' in the firstname")
    public void should_be_see_the_list_of_email_addresses_with_al_in_the_firstname() throws SQLException {


    }
    @Given("insert {int} random subjects into the database")
    public void insert_random_subjects_into_the_database(Integer count) {
        subjects subjectService= new subjects();
        List<Map<String,Object>> subjects=subjectService.generateFakeSubjects(count);
        subjectService.insertSubjects(connection,subjects);
    }
    @Given("{int} Enter the data in bulk.Check that is added to the table")
    public void enter_the_data_in_bulk_check_that_is_added_to_the_table(int rowCount) {
        System.out.println(bulkResult.length+"record is successfully added to the table");
        assertEquals(rowCount,bulkResult.length);

    }
    @Given("Query is prepared for the name and ID of the top {int} income values in the income table based on the highest amount")
    public void query_is_prepared_for_the_name_and_id_of_the_top_income_values_in_the_income_table_based_on_the_highest_amount(Integer int1) throws SQLException {
        query=getUS22_listIncomeTable();
        resultSet=getStatement().executeQuery(query);
    }

    @Given("Query results lists the name and ID are validated.")
    public void query_results_lists_the_name_and_id_are_validated() throws SQLException {

        actualIncomeListOrderByAmount=new HashMap<>();
        while (resultSet.next()){
            actualIncomeListOrderByAmount.put(resultSet.getString("name"),resultSet.getInt("id"));
        }
        for (String name : data.getExpIncomeListOrderByAmount().keySet()){
            int expId=data.getExpIncomeListOrderByAmount().get(name);
            int actualId=actualIncomeListOrderByAmount.get(name);
            assertEquals("Id does not match for name "+name, expId, actualId);
        }

    }

    @Given("Query is prepared for the name of the {int} income values with the longest employement in the staff table according to their departments")
    public void query_is_prepared_for_the_name_of_the_income_values_with_the_longest_employement_in_the_staff_table_according_to_their_departments(Integer int1) throws SQLException {
        query=getUS23_listStaffTable();
        resultSet=getStatement().executeQuery(query);
    }
    @Given("Query results lists the name is validated.")
    public void query_results_lists_the_name_is_validated() throws SQLException {
        actualNameList=new ArrayList<>();
        while (resultSet.next()){

            actualNameList.add(resultSet.getString("name"));


        }
        System.out.println(actualNameList);
        System.out.println(expectedNameList);

        for (int i = 0; i <actualNameList.size() ; i++) {

            assertEquals(actualNameList.get(i),expectedNameList.get(i));

        }


    }



    @Given("execute the query to fetch the last {int} records from online_admissions")
    public void execute_the_query_to_fetch_the_last_records_from_online_admissions(Integer count) {
        query=getUS16_List_the_last_10_records_online_admissions();
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, count);
            ResultSet resultSet = preparedStatement.executeQuery();
            records.clear();
            while (resultSet.next()) {
                records.add(resultSet.getString("id") + " - " +
                        resultSet.getString("firstname") + " " +
                        resultSet.getString("lastname") + " - " +
                        resultSet.getString("email"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    @Given("should see the last {int} records displayed")
    public void should_see_the_last_records_displayed(Integer count) {

        System.out.println("Last " + count + " Records:");
        for (String record : records) {
            System.out.println(record);
        }

        assertFalse("No records found!", records.isEmpty());
        assertEquals("The number of retrieved records is incorrect!", count.intValue(), records.size());
    }

    @Given("execute the query to calculate the average passing percentage")
    public void execute_the_query_to_calculate_the_average_passing_percentage() {

        try {
            query=getUS17_calculateAveragePassingPercentage();

            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);

            if (resultSet.next()) {
                averagePassingPercentage = resultSet.getInt("average_passing_percentage");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Given("should see the average passing percentage displayed")
    public void hould_see_the_average_passing_percentage_displayed() {

        System.out.println("Average Passing Percentage: " + averagePassingPercentage);
        assertTrue("The average passing percentage is out of expected range!", averagePassingPercentage >= 0 && averagePassingPercentage <= 100);
    }


    @Given("execute the query to count distinct student_session_id")
    public void execute_the_query_to_count_distinct_student_session_id() {
        try {
            query=getUS18_countDistinctStudentsOnlineExamStudentsTable();

            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);

            if (resultSet.next()) {
                totalUniqueStudents = resultSet.getInt("total_students");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Given("should see the total number of students displayed")
    public void should_see_the_total_number_of_students_displayed() {

        System.out.println("Total Unique Students: " + totalUniqueStudents);

        assertNotNull("Total number of students should not be null", totalUniqueStudents);
        assertTrue("Total number of students should be greater than zero", totalUniqueStudents > 0);
    }



    @Given("Query is prepared to find the top 5 longest emails in the students table")
    public void query_is_prepared_to_find_top_5_longest_emails() throws SQLException {
        query = getUS19_Students_LongestEmails();
        resultSet = getStatement().executeQuery(query);
    }

    @Given("Top 5 longest email addresses are validated.")
    public void top_5_longest_email_addresses_are_validated() throws SQLException {
        List<String> emailList = new ArrayList<>();
        while (resultSet.next()) {
            emailList.add(resultSet.getString("email"));
        }
        if (!emailList.isEmpty()) {
            for (int i = 0; i < emailList.size(); i++) {
                assertEquals(emailList.get(i), CommonData.expectedEmails.get(i));
                System.out.println(emailList.get(i) + " ");
            }
        } else {
            assertFalse("Result set is empty", resultSet.next());
        }
    }

    @Given("Query is prepared for the email, phone, and salary informations of the oldest staff member values in the staff table.")
    public void query_is_prepared_for_the_email_phone_and_salary_informations_of_the_oldest_staff_member_values_in_the_staff_table() throws SQLException {
        query=getUS24_listStaffTableOldestMember();
        resultSet=getStatement().executeQuery(query);
    }
    @Given("Query results lists the email, phone, and salary informations are validated.")
    public void query_results_lists_the_email_phone_and_salary_informations_are_validated() throws SQLException {
        actStaffListOfOldestMember=new HashMap<>();

            resultSet.next();
            actStaffListOfOldestMember.put("email",resultSet.getString("email"));
            actStaffListOfOldestMember.put("contact_no",resultSet.getString("contact_no"));
            actStaffListOfOldestMember.put("basic_salary",resultSet.getString("basic_salary"));


        assertEquals(expStaffListOfOldestMember,actStaffListOfOldestMember);
    }

    @Given("Query is prepared for updating the fine_amount value to {string} for the record in the transport_feemaster table where the month value is {string}.")
    public void query_is_prepared_for_updating_the_fine_amount_value_to_for_the_record_in_the_transport_feemaster_table_where_the_month_value_is(String string, String string2) throws SQLException {
        query=getUS11_updateTransportFeemaster();
        preparedStatement=getPraperedStatementGeneratedKeys(query,true);




    }
    @Given("Query results lists the fine_amount value informations where month is october are validated as {string}.")
    public void query_results_lists_the_fine_amount_value_informations_where_month_is_october_are_validated_as(String string) {


    }




}