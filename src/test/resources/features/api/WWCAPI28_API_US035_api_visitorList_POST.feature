Feature: WWCAPI28 API_US035 As an administrator (admin) I want to be able to create a new visitor record via API connection.


  Scenario Outline: WWCAPI145 TC_01 -> API_US035 Verify that a POST request to `/api/visitorsAdd` with valid authorization and correct data
  (purpose, name, contact, id_proof, no_of_people, date, in_time, out_time, note) returns a 200 status code and a "Success" message in the response body.

    * The api user constructs the base url with the "adminPinar" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/visitorsAdd" path parameters.
    # Api kullanicisi "api/visitorsPurposeAdd" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api visitorsAdd endpoint containing the information "<purpose>", "<name>", "<contact>", "<id_proof>", "<no_of_people>", "<date>", "<in_time>", "<out_time>" and "<note>".
    # Api kullanicisi api visitorsPurposeAdd endpointine gondermek icin "<visitors_purpose>" ve "<description>" bilgilerini iceren bir post request hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular

    Examples:
      | purpose| name    | contact| id_proof| no_of_people| date     | in_time| out_time| note  |
      | Meeting|Pınar    | 5555555|10010    |3            |2025-01-24|03:00 PM|04:30 PM |Visitor|


  Scenario: WWCAPI146 TC_02 -> API_US035 Verify that a POST request to `/api/visitorsAdd` without data and valid authorization returns a 203
  status code and a "No information or missing information. Please check your input data." message in the response body.

    * The api user constructs the base url with the "adminPinar" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/visitorsAdd" path parameters.
    # Api kullanicisi "api/visitorsAdd" path parametrelerini olusturur
    * The api user prepares a post request that does not contain data to the api visitorsPurposeAdd endpoint.
    # Api kullanicisi api visitorsPurposeAdd endpointine data icermeyen bir post request hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "No information or missing information. Please check your input data.".
    # Api kullanicisi response bodydeki message bilgisinin "No information or missing information. Please check your input data." oldugunu dogrular


  Scenario Outline: WWCAPI147 TC_03 -> API_US035 Verify that a POST request to `/api/visitorsAdd` with valid authorization and incomplete data
  (purpose, name, contact) returns a 203 status code and a "No information or missing information. Please check your input data."
  message in the response body.

    * The api user constructs the base url with the "adminPinar" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/visitorsAdd" path parameters.
    # Api kullanicisi "api/visitorsAdd" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api visitorsAdd endpoint containing the information "<id_proof>", "<no_of_people>", "<date>", "<in_time>", "<out_time>" and "<note>".
    # Api kullanicisi api visitorsPurposeAdd endpointine gondermek icin "<id_proof>", "<no_of_people>", "<date>", "<in_time>", "<out_time>" and "<note>" bilgilerini iceren bir post request hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "No information or missing information. Please check your input data.".
    # Api kullanicisi response bodydeki message bilgisinin "No information or missing information. Please check your input data." oldugunu dogrular

    Examples:
      | id_proof| no_of_people| date     | in_time| out_time| note  |
      |10010    |3            |2025-01-24|03:00 PM|04:30 PM |Visitor|


  Scenario Outline: WWCAPI150 TC_04 -> API_US035 Verify that a POST request to `/api/visitorsAdd` with invalid authorization and data
  (purpose, name, contact, id_proof, no_of_people, date, in_time, out_time, note) returns a 403 status code and a "You do not have authorization or token error"
  message in the response body.

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/visitorsAdd" path parameters.
    # Api kullanicisi "api/visitorsPurposeAdd" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api visitorsAdd endpoint containing the information "<purpose>", "<name>", "<contact>", "<id_proof>", "<no_of_people>", "<date>", "<in_time>", "<out_time>" and "<note>".
    # Api kullanicisi api visitorsPurposeAdd endpointine gondermek icin "<visitors_purpose>" ve "<description>" bilgilerini iceren bir post request hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 403.
    # Api kullanicisi status codeun 403 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "You do not have authorization or token error".
    # Api kullanicisi response bodydeki message bilgisinin "You do not have authorization or token error" oldugunu dogrular

    Examples:
      | purpose| name    | contact| id_proof| no_of_people| date     | in_time| out_time| note  |
      | Meeting|Pinar Cay| 5555555|10010    |3            |2025-01-24|03:00 PM|04:30 PM |Visitor|


  Scenario Outline: WWCAPI151 TC_05 -> API_US035 Verify the creation of a new visitor purpose record by sending a POST request to `/api/visitorsId`
  with the `addId` returned in the response body of the creation API.

    * The api user constructs the base url with the "adminPinar" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/visitorsId" path parameters.
    # Api kullanicisi "api/visitorsPurposeId" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api visitorsPurposeid endpoint containing the information <id>.
    # Api kullanicisi api visitorsPurposeId endpointine gondermek icin <id> bilgisini iceren bir post request hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular

    Examples:
      | id   |
      | 288 |