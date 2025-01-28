Feature: WWCAPI27 API_US034 As an administrator (admin), I want to be able to access the visitor information given id via API connection.


  Scenario Outline: WWCAPI105 TC_01 -> API_US034 Verify that a POST request to `/api/visitorsId` with valid authorization and correct data
  (id, staff_id, student_session_id, source, purpose, name and email) returns a 200 status code and a "Success" message in the response body.

    * The api user constructs the base url with the "adminPinar" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/visitorsId" path parameters.
    # Api kullanicisi "api/visitorsAdd" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api visitorsPurposeid endpoint containing the information <id>.
    # Api kullanicisi api visitorsId endpointine gondermek icin <id> bilgisini iceren bir post request hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular
    * The api user verifies that the data in the response body includes "<id>", "<staff_id>", "<student_session_id>", "<source>", "<purpose>", "<name>" and "<email>".
    # Api kullanicisi response bodydeki data "<id>", "<staff_id>", "<student_session_id>", "<source>", "<purpose>", "<name>" and "<email>" içeriklerini doğrular.

    Examples:
      | id  |  staff_id | student_session_id |  source|  purpose |  name       | email|
      | 175 | 2         | null               | null   | Marketing| Rozer Henry | null|


  Scenario: WWCAPI117 TC_02 -> API_US034 Verify that a POST request to `/api/visitorsId` without `id` and valid authorization returns a 203 status
  code and a "No id or wrong id." message in the response body.

    * The api user constructs the base url with the "adminPinar" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/visitorsId" path parameters.
    # Api kullanicisi "api/visitorsPurposeId" path parametrelerini olusturur
    * The api user prepares a post request that does not contain data to the api visitorsPurposeid endpoint.
    # Api kullanicisi api visitorsPurposeId endpointine data icermeyen bir post request hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "No id or wrong id.".
    # Api kullanicisi response bodydeki message bilgisinin "No id or wrong id." oldugunu dogrular


  Scenario Outline: WWCAPI118 TC_03 -> API_US034 Verify that a POST request to `/api/visitorsId` with invalid `id` and valid authorization returns a
  203 status code and a "No id or wrong id." message in the response body.

    * The api user constructs the base url with the "adminPinar" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/visitorsId" path parameters.
    # Api kullanicisi "api/visitorsPurposeId" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api visitorsPurposeid endpoint containing the information <id>.
    # Api kullanicisi api visitorsPurposeId endpointine gondermek icin <id> bilgisini iceren bir post request hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "No id or wrong id.".
    # Api kullanicisi response bodydeki message bilgisinin "No id or wrong id." oldugunu dogrular

    Examples:
      | id    |
      | 98564 |


  Scenario Outline: WWCAPI120 TC_04 -> API_US034 Verify that a POST request to `/api/visitorsId` with invalid authorization returns a 403
  status code and a "You do not have authorization or token error" message in the response body.

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/visitorsId" path parameters.
    # Api kullanicisi "api/visitorsPurposeId" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api visitorsPurposeid endpoint containing the information <id>.
    # Api kullanicisi api visitorsPurposeId endpointine gondermek icin <id> bilgisini iceren bir post request hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 403.
    # Api kullanicisi status codeun 403 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "You do not have authorization or token error".
    # Api kullanicisi response bodydeki message bilgisinin "You do not have authorization or token error" oldugunu dogrular

    Examples:
      | id   |
      | 1259 |

