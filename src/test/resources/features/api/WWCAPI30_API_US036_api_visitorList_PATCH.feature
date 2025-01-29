Feature: WWCAPI30 API_US036 As an administrator (admin), I want to be able to update the visitors information registered in the system via API connection.


  Scenario Outline: WWCAPI188 TC_01 -> API_US036 Verify that a PATCH request to `/api/visitorsUpdate` with valid authorization and correct data
  (id, purpose, name, contact, id_proof, no_of_people, date, in_time, out_time, note) returns a 200 status code, a "Success" message, and that the `updateId` in the
  response matches the `id` in the request body.

    * The api user constructs the base url with the "adminPinar" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/visitorsUpdate" path parameters.
    # Api kullanicisi "api/visitorsUpdate" path parametrelerini olusturur
    * The api user prepares a PATCH request to send to the api visitorsUpdate endpoint containing the information <id>, "<purpose>", "<name>", "<contact>", "<id_proof>", "<no_of_people>", "<date>", "<in_time>", "<out_time>" and "<note>"
    # Api kullanicisi api visitorsUpdate endpointine gondermek icin "<id>", "<purpose>", "<name>", "<contact>", "<id_proof>", "<no_of_people>", "<date>", "<in_time>", "<out_time>" and "<note>" bilgilerini iceren bir post request hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular
    * The api user verifies that the updateid information in the response body is the same as the id information in the request body.
    # Api kullanıcısı response body icindeki updateId bilgisinin request body icindeki id bilgisi ile ayni oldugunu dogrular.

    Examples:
      |id | purpose       | name    | contact| id_proof| no_of_people| date     | in_time| out_time| note  |
      |300| Update Meeting|Pinar Cay| 5555555|10010    |3            |2025-01-24|03:00 PM|04:30 PM |Visitor|


  Scenario Outline: WWCAPI189 TC_02 -> API_US036 Verify that a PATCH request to `/api/visitorsUpdate` with valid authorization and invalid `id`
  returns a 203 status code and a "Wrong information or missing information. Please check your input data and id number."
  message in the response body.

    * The api user constructs the base url with the "adminPinar" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/visitorsUpdate" path parameters.
    # Api kullanicisi "api/visitorsUpdate" path parametrelerini olusturur
    * The api user prepares a PATCH request to send to the api visitorsUpdate endpoint containing the information <id>, "<purpose>", "<name>", "<contact>", "<id_proof>", "<no_of_people>", "<date>", "<in_time>", "<out_time>" and "<note>"
    # Api kullanicisi api visitorsUpdate endpointine gondermek icin <id>, "<purpose>", "<name>", "<contact>", "<id_proof>", "<no_of_people>", "<date>", "<in_time>", "<out_time>" and "<note>" bilgilerini iceren bir post request hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".
    # Api kullanicisi response bodydeki message bilgisinin "Wrong information or missing information. Please check your input data and id number." oldugunu dogrular

    Examples:
      |id   | purpose       | name    | contact| id_proof| no_of_people| date     | in_time| out_time| note  |
      |28888| Update Meeting|Pinar Cay| 5555555|10010    |3            |2025-01-24|03:00 PM|04:30 PM |Visitor|


  Scenario Outline: WWCAPI190 TC_03 -> API_US036 Verify that a PATCH request to `/api/visitorsUpdate` without `id` and with valid authorization
  returns a 203 status code and a "Wrong information or missing information. Please check your input data and id number."
  message in the response body.

    * The api user constructs the base url with the "adminPinar" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/visitorsUpdate" path parameters.
    # Api kullanicisi "api/visitorsUpdate" path parametrelerini olusturur
    * The api user prepares a PATCH request to send to the api visitorsUpdate endpoint containing the information "<purpose>", "<name>", "<contact>", "<id_proof>", "<no_of_people>", "<date>", "<in_time>", "<out_time>" and "<note>".
    # Api kullanicisi api visitorsPurposeUpdate endpointine gondermek icin "<purpose>", "<name>", "<contact>", "<id_proof>", "<no_of_people>", "<date>", "<in_time>", "<out_time>" and "<note>" bilgilerini iceren bir post request hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".
    # Api kullanicisi response bodydeki message bilgisinin "Wrong information or missing information. Please check your input data and id number." oldugunu dogrular

    Examples:
      | purpose       | name    | contact| id_proof| no_of_people| date     | in_time| out_time| note  |
      | Update Meeting|Pinar Cay| 5555555|10010    |3            |2025-01-24|03:00 PM|04:30 PM |Visitor|



  Scenario: WWCAPI192 TC_04 -> API_US036 Verify that a PATCH request to `/api/visitorsUpdate` without valid authorization and data returns a
  203 status code and a "Wrong information or missing information. Please check your input data and id number." message
  in the response body.

    * The api user constructs the base url with the "adminPinar" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/visitorsUpdate" path parameters.
    # Api kullanicisi "api/visitorsPurposeUpdate" path parametrelerini olusturur
    * The api user prepares a patch request that does not contain data to the api visitorsUpdate endpoint.
    # Api kullanicisi api visitorsPurposeUpdate endpointine data icermeyen bir patch request hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".
    # Api kullanicisi response bodydeki message bilgisinin "Wrong information or missing information. Please check your input data and id number." oldugunu dogrular


  Scenario Outline:WWCAPI195 TC_05 -> API_US036 Verify that a PATCH request to `/api/visitorsUpdate` with invalid authorization and data
  (id, purpose, name, contact, id_proof, no_of_people, date, in_time, out_time, note) returns a 403 status code and a "You do not have authorization or token error" message
  in the response body.

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/visitorsUpdate" path parameters.
    # Api kullanicisi "api/visitorsUpdate" path parametrelerini olusturur
    * The api user prepares a PATCH request to send to the api visitorsUpdate endpoint containing the information <id>, "<purpose>", "<name>", "<contact>", "<id_proof>", "<no_of_people>", "<date>", "<in_time>", "<out_time>" and "<note>"
    # Api kullanicisi api visitorsUpdate endpointine gondermek icin "<purpose>", "<name>", "<contact>", "<id_proof>", "<no_of_people>", "<date>", "<in_time>", "<out_time>" and "<note>" bilgilerini iceren bir post request hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 403.
    # Api kullanicisi status codeun 403 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "You do not have authorization or token error".
    # Api kullanicisi response bodydeki message bilgisinin "You do not have authorization or token error" oldugunu dogrular

    Examples:
      |id   | purpose       | name    | contact| id_proof| no_of_people| date     | in_time| out_time| note  |
      |300  | Update Meeting|Pinar Cay| 5555555|10010    |3            |2025-01-24|03:00 PM|04:30 PM |Visitor|


  @pin
  Scenario Outline: WWCAPI199 TC_06 -> API_US036 Verify that the visitor record updated via API is successfully updated by sending a POST request to
  `/api/visitorsId` with the `updatedId` returned in the response body.

    * The api user constructs the base url with the "adminPinar" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/visitorsId" path parameters.
    # Api kullanicisi "api/visitorsId" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api visitorsid endpoint containing the information <id>.
    # Api kullanicisi api visitorsId endpointine gondermek icin <id> bilgisini iceren bir post request hazirlar
    * The api user sends a POST requestt and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies purpose as "Update Meeting"
    # Api kullanicisi purpose bilgisinin "Update Meeting" oldugunu dogrular

    Examples:
      | id   |
      | 300  |