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

    private String US04_studentsTableAdmissionNo="Select lastname,firstname From students Where admission_no>18001 And admission_no<18010;";


    private String US19_Students_LongestEmails = "SELECT email FROM students ORDER BY LENGTH(email) DESC LIMIT 5;";
    public String getUS19_Students_LongestEmails() {
        return US19_Students_LongestEmails;
    }


    private String US22_listIncomeTable="SELECT name, id FROM income ORDER BY amount DESC LIMIT 10;";

    private String US16_List_the_last_10_records_online_admissions="SELECT * FROM online_admissions ORDER BY id DESC LIMIT ?";

    private String US17_calculateAveragePassingPercentage = "SELECT AVG(passing_percentage) AS average_passing_percentage FROM onlineexam";

    private String US18_countDistinctStudentsOnlineExamStudentsTable = "SELECT COUNT(DISTINCT student_session_id) AS total_students FROM onlineexam_students";


    private String US23_listStaffTable="SELECT name FROM staff ORDER BY work_exp DESC LIMIT 3;";

    private String US24_listStaffTableOldestMember="SELECT email,contact_no,basic_salary FROM staff order by dob asc limit 1;";

    private String US11_updateTransportFeemaster="update transport_feemaster set fine_amount='200.00' where month='October';";



}