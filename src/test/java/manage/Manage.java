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




}