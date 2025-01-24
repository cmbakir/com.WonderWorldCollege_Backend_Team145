
Feature: WWCAPI10 API_US023 As an administrator (admin) I want to be able to access Alumni List via API connection.

@cem
  Scenario Outline: WWCAPI152 TC_01 -> API_US023 Verify that a GET request to the `/api/studentList` endpoint with valid authorization returns
  a 200 status code, a "Success" message, and the `student_id`, `current_email`, `current_phone`, `occupation`, `occupation`, `address`, `photo` and `created_at` fields for ID (x)
  in the response body.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/studentList" path parameters.
    # Api kullanicisi "/api/alumniList" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular
    * The api user verifies the information in the response body for the entry with the specified <dataIndex> index, including "<student_session_id>","<id>","<clas>","<section_id>", "<section>" , "<admission_no>" , "<roll_no>", "<admission_date>"   ,  "<firstname>", "<middlename>"  , "<lastname>" ,"<image>," "<mobileno>" , "<email>"
    # Api kullanıcısı response body icindeki <dataIndex> indexe sahip olanin "<student_session_id>", "<id>", "<class>", "<section_id>","<section>", "<admission_no>" ve "<roll_no>" , "<admission_date>"   ,  "<firstname>", "<middlename>"  , "<lastname>" ,"<image>," "<mobileno>" , "<email> bilgilerini doğrular.

    Examples:
      | dataIndex |  student_session_id  | id    | clas     |   section_id     |  section    |admission_no |roll_no| admission_date    |  firstname    |middlename  |lastname |image                          |mobileno  |email           |
      | 0         |         1            | 1     | Class4    |      1           |    A        |18001        | 101   |2021-03-18         |      Edward    |           |Thomas  | uploads/student_images/1.jpg  |82333666113|edward@gmail.com|


  Scenario: WWCAPI153 TC_02 -> API_US023 Verify that a GET request to /api/studentList with invalid authorization returns a 403 status code and a
  "failed" message.

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/studentList" path parameters.
    # Api kullanicisi "api/alumniList" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 403.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "failed".