Feature: As a teacher I should be able to delete the question record in the system via API connection.


  Scenario Outline: Verify that a GET request to the `/apiteacher/questionList` endpoint with valid authorization returns a 200 status code, a "Success" message, and the  (staff_id, subject_id, question_type, level, class_id, section_id, class_section_id,
  question, opt_a, opt_b, opt_c, opt_d, opt_e, correct, descriptive_word_limit, created_at, updated_at, name, code, class_name, section_name) fields for ID (x)
  in the response body.

    * The api user constructs the base url with the "teacher" token.
    # Api kullanicisi "teacher" token ile baseUrli olusturur
    * The api user sets "apiteacher/questionList" path parameters.
    # Api kullanicisi "apiteacher/questionList" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular
    * The api user verifies the information in the response body for the entry with the specified <dataIndex> index, including "<staff_id>", "<subject_id>", "<question_type>", "<level>", "<class_id>", "<section_id>", "<class_section_id>", "<question>", "<opt_a>", "<opt_b>", "<opt_c>", "<opt_d>", "<opt_e>", "<correct>", "<descriptive_word_limit>", "<created_at>", "<updated_at>", "<name>", "<code>", "<class_name>", "<section_name>".
    # Api kullanıcısı response body icindeki <dataIndex> indexe sahip olanin "<staff_id>", "<subject_id>", "<question_type>", "<level>", "<class_id>", "<section_id>", "<class_section_id>", "<question>", "<opt_a>", "<opt_b>", "<opt_c>", "<opt_d>", "<opt_e>", "<correct>", "<descriptive_word_limit>", "<created_at>", "<updated_at>", "<name, code>", "<class_name>", "<section_name>" bilgilerini doğrular.

  Examples:
    |dataIndex|   staff_id | subject_id | question_type | level    | class_id | section_id | class_section_id | question                                       | opt_a   | opt_b   | opt_c   | opt_d   | opt_e     | correct | descriptive_word_limit | created_at          | updated_at | name    | code | class_name | section_name |
    | 0       | 5          | 5          | singlechoice  | medium   | 3        | 1          |null              | Which one of the following is biotic resource? | Soil.   | Water.  | Plant.  | Land.   | Other .    | opt_c   | 0                      | 2023-08-02 18:28:43 |null       | Science | 111  | Class 3    | A            |


  Scenario: Verify that a GET request to /apiteacher/questionList with invalid authorization returns a 403 status code and a
  "failed" message.

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "apiteacher/questionList" path parameters.
    # Api kullanicisi "apiteacher/questionList" path parametrelerini olusturur
    * The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '403' ve reason phrase bilgisinin Forbidden oldugunu dogrular
