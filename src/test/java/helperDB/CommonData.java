package helperDB;


import io.cucumber.java.it.Ma;
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

    public static HashMap<String,String> staffId_entrydt;
    public static HashMap<String,String> expstaffId_entrydt;

    public static Map<String, String> actualAddmissionStudents = new HashMap<>();
    public static Map<String, String> expectedAddmissionStudents;

    public static Map<String, String> actualSameLastnameOnlineAddmission;
    public static Map<String, String> expSameLastnameOnlineAddmission;




    public CommonData() {
        expstudentLast_FirstName=new HashMap<>();
        expstudentLast_FirstName.put("Fleming","Nicolas");
        expstudentLast_FirstName.put("Stark","Glen");
        expstudentLast_FirstName.put("Peterson","Simon");
        expstudentLast_FirstName.put("Kohlar","Brian");
        expstudentLast_FirstName.put("Clinton","Laura");
        expstudentLast_FirstName.put("Heart","David");
        expstudentLast_FirstName.put("Roy","Kavya");

        expstaffId_entrydt = new HashMap<>();
        expstaffId_entrydt.put("1", "2021-07-03 07:48:49");
        expstaffId_entrydt.put("2", "2023-07-22 19:51:40");

        expectedAddmissionStudents = new HashMap<>();
        expectedAddmissionStudents.put("William wood", null);
        expectedAddmissionStudents.put("Vidhusi Jain", null);
        expectedAddmissionStudents.put("Tanmay Roy", null);
        expectedAddmissionStudents.put("Steffan Crown", "18056");  // Null admission_no
        expectedAddmissionStudents.put("Rahul Sinha", "00201");
        expectedAddmissionStudents.put("Noah Roy", null);
        expectedAddmissionStudents.put("Karuna Rana", "18023");
        expectedAddmissionStudents.put("Jenny Sen", null);
        expectedAddmissionStudents.put("Feria Jon", null);
        expectedAddmissionStudents.put("David Wood", null);
        expectedAddmissionStudents.put("Chiyo Measy", "18089");
        expectedAddmissionStudents.put("Brayden Sen", null);
        expectedAddmissionStudents.put("Ahmad Khan", "0015");

        expSameLastnameOnlineAddmission = new HashMap<>();
        expSameLastnameOnlineAddmission.put("abc ", null);
        expSameLastnameOnlineAddmission.put("Ayse ",null);
        expSameLastnameOnlineAddmission.put("CEM BAKIR",null);
        expSameLastnameOnlineAddmission.put("CEM BAKIR","403152");
        expSameLastnameOnlineAddmission.put("Ahmet Deneme",null);
        expSameLastnameOnlineAddmission.put("deneme deneme","10");
        expSameLastnameOnlineAddmission.put("Ahmad Khan","0015");
        expSameLastnameOnlineAddmission.put("mohit khan","0015");
        expSameLastnameOnlineAddmission.put("özlem özlem","594068");
        expSameLastnameOnlineAddmission.put("Ozlem Ozlem",null);
        expSameLastnameOnlineAddmission.put("Noah Roy",null);
        expSameLastnameOnlineAddmission.put("Tanmay Roy",null);
        expSameLastnameOnlineAddmission.put("Brayden Sen ",null);
        expSameLastnameOnlineAddmission.put("Jenny Sen",null);
        expSameLastnameOnlineAddmission.put("Abhimanyu Sinha","");
        expSameLastnameOnlineAddmission.put("Rahul Sinha","00201");
        expSameLastnameOnlineAddmission.put("David Wood",null);
        expSameLastnameOnlineAddmission.put("William wood",null);



    }

    public static HashMap<String, String> getExpstudentLast_FirstName() {
        return expstudentLast_FirstName;
    }

    public static HashMap<String, String> getExpstaffId_entrydt() {
        return expstaffId_entrydt;
    }

public static Map<String, String> getExpectedAddmissionStudents() {
        return expectedAddmissionStudents;
}
public static Map<String, String> getExpSameLastnameOnlineAddmission() {
        return expSameLastnameOnlineAddmission;
}

/*
    # lastname	firstname
     Fleming   	Nicolas
     Stark	   Glen
     Peterson	Simon
     Kohlar   	Brian
     Clinton 	Laura
     Heart	 David
     Roy       Kavya

     **/


    /*
            'Steffan',' Crown','18056'
            'Karuna','Rana','18023'
            'Rahul','Sinha','00201'
            'Noah','Roy',NULL
            'David','Wood',NULL
            'William','wood',NULL
            'Feria',' Jon',NULL
            'Vidhusi','Jain',NULL
            'Ahmad','Khan','0015'
            'Jenny','Sen',NULL
            'Tanmay','Roy',NULL
            'Chiyo','Measy','18089'
            'Brayden','Sen',NULL

     */

/*
'abc','',NULL
'Ayse','',NULL
'CEM','BAKIR',NULL
'CEM','BAKIR','403152'
'Ahmet','Deneme',NULL
'deneme','deneme','10'
'Ahmad','Khan','0015'
'mohit','khan','0147'
'özlem','özlem','594068'
'Ozlem','Ozlem',NULL
'Noah','Roy',NULL
'Tanmay','Roy',NULL
'Brayden','Sen',NULL
'Jenny','Sen',NULL
'Abhimanyu','Sinha ',''
'Rahul','Sinha','00201'
'David','Wood',NULL
'William','wood',NULL

 */

}