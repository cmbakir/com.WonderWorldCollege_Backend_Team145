package helperDB;


import lombok.Getter;

import java.util.*;

@Getter
public class CommonData {
    public static List<Integer> sectionId;
    public static List<Integer> expectedSectionId=new ArrayList<Integer>(Arrays.asList(1,5));
    public static int insertedId;
    public static HashMap<String,String> studentLast_FirstName;
    public static HashMap<String,String> expstudentLast_FirstName;
    public static int [] bulkResult;
    public static HashMap<String,String> studentMothr_MothrOcc;
    public static HashMap<String,String> expstudentMothr_MothrOcc;
    public static List<Integer> expstudentRoll_no=new ArrayList<>(Arrays.asList(102,107,113,202));
    public static List<Integer> studentRoll_no;

    public CommonData() {
        expstudentLast_FirstName=new HashMap<>();
        expstudentLast_FirstName.put("Fleming","Nicolas");
        expstudentLast_FirstName.put("Stark","Glen");
        expstudentLast_FirstName.put("Peterson","Simon");
        expstudentLast_FirstName.put("Kohlar","Brian");
        expstudentLast_FirstName.put("Clinton","Laura");
        expstudentLast_FirstName.put("Heart","David");
        expstudentLast_FirstName.put("Roy","Kavya");
        expstudentLast_FirstName.put("Singh","Kriti");
        expstudentLast_FirstName.put("Thomas","Edward");

        expstudentMothr_MothrOcc=new HashMap<>();
        expstudentMothr_MothrOcc.put("sara","private job");
        expstudentMothr_MothrOcc.put("Emma","House wife");
        expstudentMothr_MothrOcc.put("Caroline Thomas","Teacher");
        expstudentMothr_MothrOcc.put("Caroline Thomas","Teacher");
        expstudentMothr_MothrOcc.put("Lara Peterson","Professor");
    }

    public static HashMap<String, String> getExpstudentLast_FirstName() {
        return expstudentLast_FirstName;
    }
    /**  # lastname	firstname
     Fleming   	Nicolas
     Stark	   Glen
     Peterson	Simon
     Kohlar   	Brian
     Clinton 	Laura
     Heart	 David
     Roy       Kavya

     **/
    public  static HashMap<String,String> getExpstudentMothr_MothrOcc(){
        return expstudentMothr_MothrOcc;
    }

}
