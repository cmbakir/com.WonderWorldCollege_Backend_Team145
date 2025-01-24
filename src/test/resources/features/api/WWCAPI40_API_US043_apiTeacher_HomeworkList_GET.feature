Feature: As a teacher, I want to be able to access the Homework List via API connection.


  Scenario Outline: Verify that a GET request to the `/apiteacher/homeworkList` endpoint with valid authorization returns
  a 200 status code, a "Success" message, and the `class_id`, `section_id`, `session_id`, `staff_id`, `subject_group_subject_id`, `subject_id`, `homework_date`,`submit_date`, `marks`, `description`, `create_date`, `evaluation_date`, `document`, `created_by`, `evaluated_by`, `created_at`, `class`, `section`, `subject_name`, `subject_groups_id`, `name`, `assignments`,fields for ID (x)
  in the response body.

    * The api user constructs the base url with the "teacher" token.
    # Api kullanicisi "teacher" token ile base urli olusturur
    * The api user sets "apiteacher/homeworkList" path parameters.
    # Api kullanicisi "apiteacher/homeworkList" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular
    * The api user verifies the information in the response body for the entry with the specified <dataIndex> index, including "<class_id>", "<section_id>", "<session_id>", "<staff_id>","<subject_group_subject_id>", "<subject_id>", "<homework_date>", "<submit_date>", "<marks>", "<description>", "<create_date>", "<evaluation_date>", "<document>", "<created_by>", "<evaluated_by>", "<created_at>", "<class>", "<section>", "<subject_name>", "<subject_groups_id>", "<name>", assignments.
    # Api kullanıcısı response body icindeki <dataIndex> indexe sahip olanin "<class_id>", "<section_id>", "<session_id>", "<staff_id>","<subject_group_subject_id>", "<subject_id>", "<homework_date>", "<submit_date>", "<marks>", "<description>", "<create_date>", "<evaluation_date>", "<document>", "<created_by>", "<evaluated_by>", "<created_at>", "<class>", "<section>", "<subject_name>", "<subject_groups_id>", "<name>", bilgilerini doğrular.


    Examples:
                | dataIndex  | class_id  | section_id   | session_id   | staff_id   | subject_group_subject_id  | subject_id  | homework_date  | submit_date  | marks |  description                | create_date | evaluation_date  | document  | created_by  | evaluated_by  | created_at          |  section     | subject_name    | subject_groups_id | name    |
                | 0          | 11        | 1            |  20          | 374        |  74                       |  4          |  2025-01-17    |  2025-01-20  | 80.00 |  <p>Probability,Vectors</p> | 2025-01-16  | null             | null      |  374        |  null         | 2025-01-16 09:34:27 |  A           |  Mathematics    | 18                | dersler |



