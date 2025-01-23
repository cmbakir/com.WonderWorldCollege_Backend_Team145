Feature: As a teacher (teacher), I want to be able to access the Questions information of the user whose id is
  given via API connection.

  Scenario Outline: Verify that a POST request to `/apiteacher/questionDetailsById` with valid authorization and correct data returns a
  200 status code, a "Success" message, and validates the response body contents (id, staff_id, subject_id, question_type, level, class_id, section_id, class_section_id, question, opt_a, opt_b, opt_c, opt_d, opt_e, correct, descriptive_word_limit, created_at, updated_at, name, code, class_name, section_name).

    * The api user constructs the base url with the "teacher" token.
    # Api kullanicisi "teacher" token ile base urli olusturur
    * The api user sets "apiteacher/questionDetailsById" path parameters.
    # Api kullanicisi "apiteacher/questionDetailsById" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api questionDetailsById endpoint containing the information <id>.
    # Api kullanicisi api questionDetailsById endpointine gondermek icin <id> bilgisini iceren bir post request hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular
    * The api user verifies that the data in the response body includes "<id>", "<staff_id>", "<subject_id>", "<question_type>", "<level>", "<class_id>", "<section_id>", "<class_section_id>", "<question>", "<opt_a>",  "<opt_b>", "<opt_c>", "<opt_d>", "<opt_e>", "<correct>", "<descriptive_word_limit>", "<created_at>", "<updated_at>", "<name>", "<code>", "<class_name>", "<section_name>".
    # Api kullanicisi response bodydeki data "<id>", "<staff_id>", "<subject_id>", "<question_type>", "<level>", "<class_id>", "<section_id>", "<class_section_id>", "<question>", "<opt_a>",  "<opt_b>", "<opt_c>", "<opt_d>", "<opt_e>", "<correct>", "<descriptive_word_limit>", "<created_at>", "<updated_at>", "<name, code>", "<class_name>", "<section_name>" içeriklerini doğrular.

    Examples:
      |id       |   staff_id | subject_id | question_type | level    | class_id | section_id | class_section_id | question                                       | opt_a   | opt_b   | opt_c   | opt_d   | opt_e     | correct | descriptive_word_limit | created_at          | updated_at | name    | code | class_name | section_name |
      | 70      | 5          | 5          | singlechoice  | medium   | 3        | 1          |null              | Which one of the following is biotic resource? | Soil.   | Water.  | Plant.  | Land.   | Other .    | opt_c   | 0                      | 2023-08-02 18:28:43 |null       | Science | 111  | Class 3    | A            |


  Scenario: Verify that a POST request to `/apiteacher/questionDetailsById` without `id` and valid authorization returns a 203 status
  code and a "No id or wrong id." message in the response body.

    * The api user constructs the base url with the "teacher" token.
    # Api kullanicisi "teacher" token ile base urli olusturur
    * The api user sets "apiteacher/questionDetailsById" path parameters.
    # Api kullanicisi "apiteacher/questionDetailsById" path parametrelerini olusturur
    * The api user prepares a post request that does not contain data to the api questionDetailsById endpoint.
    # Api kullanicisi api questionDetailsById endpointine data icermeyen bir post request hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "No id or wrong id.".
    # Api kullanicisi response bodydeki message bilgisinin "No id or wrong id." oldugunu dogrular


  Scenario Outline: Verify that a POST request to `/apiteacher/questionDetailsById` with invalid `id` and valid authorization returns a
  203 status code and a "No id or wrong id." message in the response body.

    * The api user constructs the base url with the "teacher" token.
    # Api kullanicisi "teacher" token ile base urli olusturur
    * The api user sets "apiteacher/questionDetailsById" path parameters.
    # Api kullanicisi "apiteacher/questionDetailsById" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api questionDetailsById endpoint containing the information <id>.
    # Api kullanicisi api questionDetailsById endpointine gondermek icin <id> bilgisini iceren bir post request hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "No id or wrong id.".
    # Api kullanicisi response bodydeki message bilgisinin "No id or wrong id." oldugunu dogrular

    Examples:
      | id    |
      | 220 |

  Scenario Outline: Verify that a POST request to `/apiteacher/questionDetailsById` with invalid authorization returns a 403
  status code and a "You do not have authorization or token error" message in the response body.

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "apiteacher/questionDetailsById" path parameters.
    # Api kullanicisi "apiteacher/questionDetailsById" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api questionDetailsById endpoint containing the information <id>.
    # Api kullanicisi api questionDetailsById endpointine gondermek icin <id> bilgisini iceren bir post request hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 403.
    # Api kullanicisi status codeun 403 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "You do not have authorization or token error".
    # Api kullanicisi response bodydeki message bilgisinin "You do not have authorization or token error" oldugunu dogrular

    Examples:
      | id   |
      | 70 |
