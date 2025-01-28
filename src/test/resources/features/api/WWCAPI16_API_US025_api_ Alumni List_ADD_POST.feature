Feature: WWCAPI16 API_US025 As an administrator (admin) I want to be able to create a new Alumni record via API connection.

  Scenario Outline: WWCAPI160 TC_01 -> API_US025 Verify that a POST request to `/api/alumniAdd` with valid authorization and correct data
  (`visitors_purpose`, `description`) returns a 200 status code and a "Success" message in the response body.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/alumniAdd" path parameters.
    # Api kullanicisi "api/alumniAdd" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api visitorsPurposeAdd endpoint containing the information "<student_id>", "<current_email>", "<current_phone>", "<occupation>", "<address>" and "<photo>".
    # Api kullanicisi api api/alumniAdd  endpointine gondermek icin "<student_id>", "<current_email>" , "<current_phone>" , "<occupation>" , "<address>", "<photo>" bilgilerini iceren bir post request hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular

    Examples:
      | student_id  | current_email  | current_phone  | occupation | address |photo|
      | 29          |                | 9809967867     |            |         |     |


  Scenario: WWCAPI162 TC_02 -> API_US025 Verify that a POST request to `/api/alumniAdd` without data and valid authorization returns a 203
  status code and a "No information or missing information. Please check your input data." message in the response body.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/alumniAdd" path parameters.
    # Api kullanicisi "api/visitorsPurposeAdd" path parametrelerini olusturur
    * The api user prepares a post request that does not contain data to the api visitorsPurposeAdd endpoint.
    # Api kullanicisi api visitorsPurposeAdd endpointine data icermeyen bir post request hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "No information or missing information. Please check your input data.".
    # Api kullanicisi response bodydeki message bilgisinin "No information or missing information. Please check your input data." oldugunu dogrular


  Scenario Outline: WWCAPIXXX TC_03 -> API_US025 Verify that a POST request to `/api/alumniAdd` with valid authorization and incomplete data
  (`occupation`, address and photo) returns a 203 status code and a "No information or missing information. Please check your input data."
  message in the response body.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/alumniAdd" path parameters.
    # Api kullanicisi "api/visitorsPurposeAdd" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api visitorsPurposeAdd endpoint containing the information "<occupation>", "<address>" and "<photo>".
    # Api kullanicisi api visitorsPurposeAdd endpointine gondermek icin "<occupation>" , "<address>" ve "<photo>"bilgilerini iceren bir post request hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "No information or missing information. Please check your input data.".
    # Api kullanicisi response bodydeki message bilgisinin "No information or missing information. Please check your input data." oldugunu dogrular

    Examples:
      | occupation  |address | photo |
      |             |        |       |


  Scenario Outline: Verify that a POST request to `/api/alumniAdd` with invalid authorization and data
  (`student_id,`, `current_email`, current_phone, occupation, address, photo) returns a 403 status code and a "You do not have authorization or token error"
  message in the response body.

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/alumniAdd" path parameters.
    # Api kullanicisi "api/visitorsPurposeAdd" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api visitorsPurposeAdd endpoint containing the information "<student_id>" , "<current_email>","<current_phone>", "<occupation>", "<address>", "<photo>" .
    # Api kullanicisi api visitorsPurposeAdd endpointine gondermek icin "<visitors_purpose>" ve "<description>" bilgilerini iceren bir post request hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 403.
    # Api kullanicisi status codeun 403 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "You do not have authorization or token error".
    # Api kullanicisi response bodydeki message bilgisinin "You do not have authorization or token error" oldugunu dogrular

    Examples:
      | student_id |current_email | current_phone  |occupation|   address |photo|
      | 29         |              |9809967867      |          |           |     |


  Scenario Outline: Verify the creation of a new visitor purpose record by sending a POST request to `/api/alumniId `
  with the `addId` returned in the response body of the creation API.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/alumniId" path parameters.
    # Api kullanicisi "api/visitorsPurposeId" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api alumniId endpoint containing the information <id>.
    # Api kullanicisi api visitorsPurposeId endpointine gondermek icin <id> bilgisini iceren bir post request hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular

    Examples:
      | id   |
      | 479  |
