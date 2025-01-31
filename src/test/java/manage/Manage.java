package manage;

import lombok.Getter;

@Getter
public class Manage {

    /**
     * US_01
     **/
    private String US02_class_sections="Select id From class_sections WHERE class_id=section_id;";

    private String US09_inserted_transportRoute="Insert INTO transport_route (route_title,no_of_vehicle,note,is_active,created_at,updated_at)\n"+
            "VALUES (?,?,?,?,?,?)";
    private String US10_insertedVisitorsBook="INSERT INTO visitors_book(staff_id, student_session_id, source, purpose, name, email, contact, id_proof, no_of_people, date, in_time, out_time, note, image, meeting_with, created_at) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

    private String US10_deletedVisitorsBook="Delete From visitors_book WHERE id= ?";

    private String US04_studentsTableAdmissionNo="SELECT lastname,firstname FROM students\n" +
            "WHERE admission_no\n" +
            "BETWEEN 18001 AND 18010\n" +
            "ORDER BY admission_no ASC;";
    private String US05_studentsTableIsmi_TileBaslayan="SELECT mother_name,mother_occupation FROM students\n" +
            "WHERE lastname \n" +
            "LIKE 'T%'\n" +
            "ORDER BY lastname ASC;";
    private String US06_studentsTableFathrOcc_OgrRoll="SELECT roll_no,father_occupation FROM students\n" +
            "WHERE father_occupation IN ('Doctor','Police')\n" +
            "ORDER BY roll_no ASC;";


    private String US25_staff_rating = "SELECT id, entrydt FROM staff_rating WHERE comment LIKE '%good%';";

    private String US26_online_addmission = "SELECT firstname, lastname, admission_no FROM online_admissions WHERE YEAR (created_at) =2023 AND MONTH (created_at) =1;";

    private String US27_same_Lastname_OnlineAddmission ="SELECT firstname, lastname, admission_no FROM online_admissions WHERE lastname IN (SELECT lastname FROM online_admissions GROUP BY lastname HAVING COUNT(*) > 1) ORDER BY lastname, firstname;";








    private String US07_usersuserid= "select * from users where role = 'parent' order by id DESC";

    private String US12_staff5emp= "select * from staff where id < 6 order by cast(regexp_replace(work_exp, '[^0-9]', '') as unsigned) desc limit 5";

    private String US08topicidUpdateQuery = "update topic set name = ? where id = ?";

    private String US08topicidUpdateVerify = "select name from topic where id = ?";

    private String US19_Students_LongestEmails = "SELECT email FROM students ORDER BY LENGTH(email) DESC LIMIT 5;";

    private String US20_HighestExpenseName = "SELECT name FROM expenses ORDER BY amount DESC LIMIT 1;";

    private String US21_InsertGeneralCall = "INSERT INTO general_calls (name, contact, date, description, follow_up_date, call_duration, note, call_type, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
    private String US21_GetLatestCall = "SELECT * FROM general_calls WHERE name = 'John Doe' ORDER BY call_duration DESC LIMIT 1;";


    private String US22_listIncomeTable="SELECT name, id FROM income ORDER BY amount DESC LIMIT 10;";

    private String US16_List_the_last_10_records_online_admissions="SELECT * FROM online_admissions ORDER BY id DESC LIMIT ?";

    private String US17_calculateAveragePassingPercentage = "SELECT AVG(passing_percentage) AS average_passing_percentage FROM onlineexam";

    private String US18_countDistinctStudentsOnlineExamStudentsTable = "SELECT COUNT(DISTINCT student_session_id) AS total_students FROM onlineexam_students";


    private String US23_listStaffTable="SELECT name FROM staff ORDER BY work_exp DESC LIMIT 3;";

    private String US24_listStaffTableOldestMember="SELECT email,contact_no,basic_salary FROM staff order by dob asc limit 1;";

    private String US11_updateTransportFeemaster="update transport_feemaster set fine_amount='200.00' where month='October';";




}