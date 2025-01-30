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
    /**  # lastname	firstname
     Fleming   	Nicolas
     Stark	   Glen
     Peterson	Simon
     Kohlar   	Brian
     Clinton 	Laura
     Heart	 David
     Roy       Kavya

     **/
    public static HashMap<String, Integer> getExpIncomeListOrderByAmount() {
        return expIncomeListOrderByAmount;
    }


public static HashMap<String, String> getExpStaffListOfOldestMember() {
    return expStaffListOfOldestMember;
}

}