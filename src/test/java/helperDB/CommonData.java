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
    public static HashMap<String,Integer> actualIncomeListOrderByAmount;
    public static HashMap<String,Integer> expIncomeListOrderByAmount;
    public static List<String> actualNameList;
    public static List<String> expectedNameList=new ArrayList<String>(Arrays.asList("Brandon","James","Jason"));


    public CommonData() {
        expstudentLast_FirstName=new HashMap<>();
        expstudentLast_FirstName.put("Fleming","Nicolas");
        expstudentLast_FirstName.put("Stark","Glen");
        expstudentLast_FirstName.put("Peterson","Simon");
        expstudentLast_FirstName.put("Kohlar","Brian");
        expstudentLast_FirstName.put("Clinton","Laura");
        expstudentLast_FirstName.put("Heart","David");
        expstudentLast_FirstName.put("Roy","Kavya");


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

}