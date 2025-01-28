Feature: WWCAPI18 API_US051 As a teacher (teacher), I want to be able to update the question information registered in the system via API connection.

  Scenario Outline: WWCAPI... TC_01 -> API_US051 Verify that a PATCH request to `/apiteacher/questionUpdate` with valid authorization and correct data
  (id, subject_id, question_type, level, class_id, section_id, class_section_id, question, opt_a, opt_b, opt_c, opt_d, opt_e, correct, descriptive_word_limit`)
  returns a 200 status code, a "Success" message, and that the `updateId` in the response matches the `id` in the request body.

    * The api user constructs the base url with the "teacher" token.
    # Api kullanicisi "teacher" token ile base urli olusturur
    * The api user sets "apiteacher/questionUpdate" path parameters.
    # Api kullanicisi "apiteacher/questionUpdate" path parametrelerini olusturur
    * The api user prepares a PATCH request to send to the api questionUpdate endpoint containing the information <id>, "<subject_id>", "<question_type>", "<level>", "<class_id>", "<section_id>", "<class_section_id>", "<question>", "<opt_a>",  "<opt_b>", "<opt_c>", "<opt_d>", "<opt_e>", "<correct>", "<descriptive_word_limit>"
    # Api kullanicisi api questionUpdate endpointine gondermek icin <id>, id, subject_id, question_type, level, class_id, section_id, class_section_id, question, opt_a, opt_b, opt_c, opt_d, opt_e, correct, descriptive_word_limit bilgilerini iceren bir post request hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular
    * The api user verifies that the updateid information in the response body is the same as the id information in the request body.
    # Api kullanıcısı response body icindeki updateId bilgisinin request body icindeki id bilgisi ile ayni oldugunu dogrular.

    Examples:

      | id  | subject_id | question_type  | level  | class_id | section_id | class_section_id | question                                   | opt_a   | opt_b  | opt_c  | opt_d  | opt_e     | correct | descriptive_word_limit |
      | 240 | 5          | singlechoice   | medium | 3        | 1          | null             | Which one of the following is biotic resource? | Soil.   | Water. | Plant. | Land. | Other .   | opt_c  | 0                    |

  Scenario Outline: WWCAPI... TC_02 -> API_US051 Verify that a PATCH request to `/apiteacher/questionUpdate` with valid authorization and invalid `id`
  returns a 203 status code and a "Wrong information or missing information. Please check your input data and id number."
  message in the response body.
    * The api user constructs the base url with the "teacher" token.
    # Api kullanicisi "teacher" token ile base urli olusturur
    * The api user sets "apiteacher/questionUpdate" path parameters.
    # Api kullanicisi "apiteacher/questionUpdate" path parametrelerini olusturur
    * The api user prepares a PATCH request to send to the api questionUpdate endpoint containing the information <id>, "<subject_id>", "<question_type>", "<level>", "<class_id>", "<section_id>", "<class_section_id>", "<question>", "<opt_a>",  "<opt_b>", "<opt_c>", "<opt_d>", "<opt_e>", "<correct>", "<descriptive_word_limit>"
    # Api kullanicisi api questionUpdate endpointine gondermek icin <id>, subject_id, question_type, level, class_id, section_id, class_section_id, question, opt_a, opt_b, opt_c, opt_d, opt_e, correct, descriptive_word_limit bilgilerini iceren bir post request hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".
    # Api kullanicisi response bodydeki message bilgisinin "Wrong information or missing information. Please check your input data and id number." oldugunu dogrular

    Examples:
      | id      | subject_id | question_type  | level  | class_id | section_id | class_section_id | question                                   | opt_a   | opt_b  | opt_c  | opt_d  | opt_e     | correct | descriptive_word_limit |
      | 1234578 | 5          | singlechoice   | medium | 3        | 1          | null             | Which one of the following is biotic resource? | Soil.   | Water. | Plant. | Land. | Other .   | opt_c  | 0                    |

  Scenario Outline: WWCAPI... TC_03 -> API_US051 Verify that a PATCH request to `/apiteacher/questionUpdate` without `id` and with valid authorization
  returns a 203 status code and a "Wrong information or missing information. Please check your input data and id number."
  message in the response body.

    * The api user constructs the base url with the "teacher" token.
    # Api kullanicisi "teacher" token ile base urli olusturur
    * The api user sets "apiteacher/questionUpdate" path parameters.
    # Api kullanicisi "apiteacher/questionUpdate" path parametrelerini olusturur
    * The api user prepares a PATCH request to send to the api questionUpdate endpoint containing the information "<subject_id>", "<question_type>", "<level>", "<class_id>", "<section_id>", "<class_section_id>", "<question>", "<opt_a>",  "<opt_b>", "<opt_c>", "<opt_d>", "<opt_e>", "<correct>", "<descriptive_word_limit>"
    # Api kullanicisi api questionUpdate endpointine gondermek icin "subject_id, question_type, level, class_id, section_id, class_section_id, question, opt_a, opt_b, opt_c, opt_d, opt_e, correct, descriptive_word_limit " bilgilerini iceren bir post request hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".
    # Api kullanicisi response bodydeki message bilgisinin "Wrong information or missing information. Please check your input data and id number." oldugunu dogrular

    Examples:
      | subject_id | question_type  | level  | class_id | section_id | class_section_id | question                                   | opt_a   | opt_b  | opt_c  | opt_d  | opt_e     | correct | descriptive_word_limit |
      | 5          | singlechoice   | medium | 3        | 1          | null             | Which one of the following is biotic resource? | Soil.   | Water. | Plant. | Land. | Other .   | opt_c  | 0                    |


  Scenario: WWCAPI... TC_04 -> API_US051 Verify that a PATCH request to `/apiteacher/questionUpdate` without valid authorization and data returns a
  203 status code and a "Wrong information or missing information. Please check your input data and id number." message
  in the response body.

    * The api user constructs the base url with the "teacher" token.
    # Api kullanicisi "teacher" token ile base urli olusturur
    * The api user sets "apiteacher/questionUpdate" path parameters.
    # Api kullanicisi "apiteacher/questionUpdate" path parametrelerini olusturur
    * The api user prepares a patch request that does not contain data to the api questionUpdate endpoint.
    # Api kullanicisi api questionUpdate endpointine data icermeyen bir patch request hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".
    # Api kullanicisi response bodydeki message bilgisinin "Wrong information or missing information. Please check your input data and id number." oldugunu dogrular



  Scenario Outline: WWCAPI... TC_05 -> API_US051 Verify that a PATCH request to `/apiteacher/questionUpdate` with invalid authorization and data (id, subject_id, question_type, level, class_id, section_id, class_section_id, question, opt_a, opt_b, opt_c, opt_d, opt_e, correct, descriptive_word_limit)
  returns a 403 status code and a "You do not have authorization or token error" message in the response body.

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "apiteacher/questionUpdate" path parameters.
    # Api kullanicisi "apiteacher/questionUpdate" path parametrelerini olusturur
    * The api user prepares a PATCH request to send to the api questionUpdate endpoint containing the information <id>, "<subject_id>", "<question_type>", "<level>", "<class_id>", "<section_id>", "<class_section_id>", "<question>", "<opt_a>",  "<opt_b>", "<opt_c>", "<opt_d>", "<opt_e>", "<correct>", "<descriptive_word_limit>"
    # Api kullanicisi api questionUpdate endpointine gondermek icin <id>,  subject_id, question_type, level, class_id, section_id, class_section_id, question, opt_a, opt_b, opt_c, opt_d, opt_e, correct, descriptive_word_limit bilgilerini iceren bir post request hazirlar
    * The api user sends a PATCH request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.
    # Api kullanicisi PATCH request gonderir, donen responsei kaydeder, status codeun '403' ve reason phrase bilgisinin Forbidden oldugunu dogrular


    Examples:
      | id  | subject_id | question_type  | level  | class_id | section_id | class_section_id | question                                   | opt_a   | opt_b  | opt_c  | opt_d  | opt_e     | correct | descriptive_word_limit |
      | 240 | 5          | singlechoice   | medium | 3        | 1          | null             | Which one of the following is biotic resource? | Soil.   | Water. | Plant. | Land. | Other .   | opt_c  | 0                    |


  Scenario Outline: WWCAPI... TC_06 -> API_US051 Verify that the questions record updated via API is successfully updated by sending a POST request to
  `/apiteacher/questionDetailsById` with the `updateId` returned in the response body.

    * The api user constructs the base url with the "teacher" token.
    # Api kullanicisi "teacher" token ile base urli olusturur
    * The api user sets "apiteacher/questionDetailsById" path parameters.
    # Api kullanicisi "apiteacher/questionDetailsById" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api questionDetailsById endpoint containing the information <id>.
    # Api kullanicisi api questionDetailsById endpointine gondermek icin <id> bilgisini iceren bir post request hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies level  as "medium"
    # Api kullanicisi question bilgisinin "question update" oldugunu dogrular


    Examples:
      | id   |
      | 240 |
