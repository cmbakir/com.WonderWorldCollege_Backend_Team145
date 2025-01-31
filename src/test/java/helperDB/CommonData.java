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
    public static HashMap<String,String> studentMothr_MothrOcc;
    public static HashMap<String,String> expstudentMothr_MothrOcc;
    public static List<Integer> expstudentRoll_no=new ArrayList<>(Arrays.asList(102,107,113,202));
    public static List<Integer> studentRoll_no;

    public static HashMap<String,String> staffId_entrydt;
    public static HashMap<String,String> expstaffId_entrydt;

    public static Map<String, String> actualAddmissionStudents = new HashMap<>();
    public static Map<String, String> expectedAddmissionStudents;

    public static Map<String, String> actualSameLastnameOnlineAddmission;
    public static Map<String, String> expSameLastnameOnlineAddmission;


    public static List<String> expectedEmails;

    public static HashMap<String,Integer> actualIncomeListOrderByAmount;
    public static HashMap<String,Integer> expIncomeListOrderByAmount;
    public static List<String> actualNameList;
    public static List<String> expectedNameList=new ArrayList<String>(Arrays.asList("Brandon","James","Jason"));


    public static List<String> records = new ArrayList<>();
    public static int totalUniqueStudents;
    public static int averagePassingPercentage;


    public static HashMap<String,String> actStaffListOfOldestMember;
    public static HashMap<String,String> expStaffListOfOldestMember;

    public static float updatedFineAmount;
    public static float expectedFineAmount=200;
    public static String actualMonth;
    public static String expMonth="October";

    public static String expectedHighestExpense;




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




        expectedEmails = new ArrayList<>(Arrays.asList(
                "matthew.gusikowski@hotmail.com",
                "kandice.dickinson@hotmail.com",
                "austin.cartwright@hotmail.com",
                "eleonore.aufderhar@yahoo.com",
                "dorethea.kuvalis@hotmail.com"
        ));

        expIncomeListOrderByAmount=new HashMap<>();
        expIncomeListOrderByAmount.put("Absent Fine Charge",15);
        expIncomeListOrderByAmount.put("Child Food",87);
        expIncomeListOrderByAmount.put("Covid-19 Camp",23);
        expIncomeListOrderByAmount.put("Class 1 All Subject",14);
        expIncomeListOrderByAmount.put("School Rent",88);
        expIncomeListOrderByAmount.put("Holi Celebration",79);
        expIncomeListOrderByAmount.put("New Book",80);
        expIncomeListOrderByAmount.put("NCERT",2);
        expIncomeListOrderByAmount.put("Bridge Trust",9);
        expIncomeListOrderByAmount.put("NCERT- All Subject",24);

        expStaffListOfOldestMember=new HashMap<>();
        expStaffListOfOldestMember.put("email","admin@wonderworldcollege.com");
        expStaffListOfOldestMember.put("contact_no","56465465");
        expStaffListOfOldestMember.put("basic_salary","38000");




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

    public  static HashMap<String,String> getExpstudentMothr_MothrOcc(){
        return expstudentMothr_MothrOcc;
    }

    public static HashMap<String, Integer> getExpIncomeListOrderByAmount() {
        return expIncomeListOrderByAmount;
    }


public static HashMap<String, String> getExpStaffListOfOldestMember() {
    return expStaffListOfOldestMember;
}


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
