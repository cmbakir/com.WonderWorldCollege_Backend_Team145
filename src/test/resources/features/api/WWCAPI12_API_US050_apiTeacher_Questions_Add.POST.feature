Feature: WWCAPI12 API_US050 As a teacher (teacher) I want to be able to create a new question record via API connection.

  Scenario Outline: WWCAPI... TC_01 -> API_US050 Verify that a POST request to `/apiteacher/questionAdd` with valid authorization and correct data
  (subject_id, question_type, level, class_id, section_id, class_section_id, question, opt_a, opt_b, opt_c, opt_d, opt_e, correct, descriptive_word_limit)
  returns a 200 status code and a "Success" message in the response body.

    * The api user constructs the base url with the "teacher" token.
    # Api kullanicisi "teacher" token ile base urli olusturur
    * The api user sets "apiteacher/questionAdd" path parameters.
    # Api kullanicisi "apiteacher/questionAdd" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api questionAdd endpoint containing the information "<subject_id>", "<question_type>", "<level>", "<class_id>", "<section_id>", "<class_section_id>", "<question>", "<opt_a>",  "<opt_b>", "<opt_c>", "<opt_d>", "<opt_e>", "<correct>", "<descriptive_word_limit>".
    # Api kullanicisi api questionAdd endpointine gondermek icin "<subject_id>", "<question_type>", "<level>", "<class_id>", "<section_id>", "<class_section_id>", "<question>", "<opt_a>",  "<opt_b>", "<opt_c>", "<opt_d>", "<opt_e>", "<correct>", "<descriptive_word_limit>" bilgilerini iceren bir post request hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular

    Examples:
      | subject_id | question_type | level    | class_id | section_id | class_section_id | question  | opt_a   | opt_b   | opt_c   | opt_d   | opt_e     | correct | descriptive_word_limit | created_at          | updated_at | name    | code | class_name | section_name |
      | 4          | true_false  | low      | 11         | 1           |null              | 1+4=5    |          |        |         |         |           |     true    | 0                      | 2025-01-06 09:53:32 |null       | Mathematics | 110  | Class 11    | A            |


  Scenario: WWCAPI... TC_02 -> API_US050 Verify that a POST request to `/apiteacher/questionAdd` without data and valid authorization returns a 203
  status code and a "No information or missing information. Please check your input data." message in the response body.

    * The api user constructs the base url with the "teacher" token.
    # Api kullanicisi "teacher" token ile base urli olusturur
    * The api user sets "apiteacher/questionAdd" path parameters.
    # Api kullanicisi "apiteacher/questionAdd" path parametrelerini olusturur
    * The api user prepares a post request that does not contain data to the api questionAdd endpoint.
    # Api kullanicisi api questionAdd endpointine data icermeyen bir post request hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "No information or missing information. Please check your input data.".
    # Api kullanicisi response bodydeki message bilgisinin "No information or missing information. Please check your input data." oldugunu dogrular


  Scenario Outline: WWCAPI... TC_03 -> API_US050 Verify that a POST request to `/apiteacher/questionAdd` with valid authorization and incomplete data
  (class_id, section_id, class_section_id, question, opt_a, opt_b, opt_c, opt_d, opt_e, correct, descriptive_word_limit) returns a 203 status code and a "No information or missing information. Please check your input data."
  message in the response body.

    * The api user constructs the base url with the "teacher" token.
    # Api kullanicisi "teacher" token ile base urli olusturur
    * The api user sets "apiteacher/questionAdd" path parameters.
    # Api kullanicisi "apiteacher/questionAdd" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api questionAdd endpoint containing the information "<class_id>", "<section_id>", "<class_section_id>", "<question>", "<opt_a>",  "<opt_b>", "<opt_c>", "<opt_d>", "<opt_e>", "<correct>", "<descriptive_word_limit>".
    # Api kullanicisi api questionAdd endpointine gondermek icin "<class_id>", "<section_id>", "<class_section_id>", "<question>", "<opt_a>",  "<opt_b>", "<opt_c>", "<opt_d>", "<opt_e>", "<correct>", "<descriptive_word_limit>" bilgilerini iceren bir post request hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "No information or missing information. Please check your input data.".
    # Api kullanicisi response bodydeki message bilgisinin "No information or missing information. Please check your input data." oldugunu dogrular

    Examples:
      | class_id | section_id | class_section_id | question  | opt_a   | opt_b   | opt_c   | opt_d   | opt_e     | correct | descriptive_word_limit | created_at          | updated_at | name    | code | class_name | section_name |
      | 11        | 1          |null              | 1+1=2    |          |        |         |         |           |     true    | 0                      | 2025-01-06 09:53:32 |null       | Mathematics | 110  | Class 11    | A            |



  Scenario Outline: WWCAPI... TC_04 -> API_US050 Verify that a POST request to `/apiteacher/questionAdd` with invalid authorization and data
  (subject_id, question_type, level, class_id, section_id, class_section_id, question, opt_a, opt_b, opt_c, opt_d, opt_e, correct, descriptive_word_limit)
  returns a 403 status code and a "You do not have authorization or token error"
  message in the response body.

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "apiteacher/questionAdd" path parameters.
    # Api kullanicisi "apiteacher/questionAdd" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api questionAdd endpoint containing the information "<subject_id>", "<question_type>", "<level>", "<class_id>", "<section_id>", "<class_section_id>", "<question>", "<opt_a>",  "<opt_b>", "<opt_c>", "<opt_d>", "<opt_e>", "<correct>", "<descriptive_word_limit>".
    # Api kullanicisi api questionAdd endpointine gondermek icin "<subject_id>", "<question_type>", "<level>", "<class_id>", "<section_id>", "<class_section_id>", "<question>", "<opt_a>",  "<opt_b>", "<opt_c>", "<opt_d>", "<opt_e>", "<correct>", "<descriptive_word_limit>" bilgilerini iceren bir post request hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 403.
    # Api kullanicisi status codeun 403 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "You do not have authorization or token error".
    # Api kullanicisi response bodydeki message bilgisinin "You do not have authorization or token error" oldugunu dogrular


    Examples:
      | subject_id | question_type | level    | class_id | section_id | class_section_id | question  | opt_a   | opt_b   | opt_c   | opt_d   | opt_e     | correct | descriptive_word_limit | created_at          | updated_at | name    | code | class_name | section_name |
      | 4          | true_false  | low      | 11        | 1          |null              | 1+1=2    |          |        |         |         |           |     true    | 0                      | 2025-01-06 09:53:32 |null       | Mathematics | 110  | Class 11    | A            |



  Scenario Outline: WWCAPI... TC_05 -> API_US050 Verify the creation of a new question record by sending a POST request to `/apiteacher/questionDetailsById`
  with the `addId` returned in the response body of the creation API.

    * The api user constructs the base url with the "teacher" token.
    # Api kullanicisi "teacher" token ile base urli olusturur
    * The api user sets "apiteacher/questionDetailsById" path parameters.
    # Api kullanicisi "apiteacher/questionDetailsById" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api questionAdd endpoint containing the information <id>.
    # Api kullanicisi api questionAdd endpointine gondermek icin <id> bilgisini iceren bir post request hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular

    Examples:
      | id   |
      | 238 |

