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

    private String US07_usersuserid= "select * from users where role = 'parent' order by id DESC";

    private String US12_staff5emp= "select * from staff where id < 6 order by cast(regexp_replace(work_exp, '[^0-9]', '') as unsigned) desc limit 5";

    private String US08topicidUpdateQuery = "update topic set name = ? where id = ?";

    private String US08topicidUpdateVerify = "select name from topic where id = ?";



}