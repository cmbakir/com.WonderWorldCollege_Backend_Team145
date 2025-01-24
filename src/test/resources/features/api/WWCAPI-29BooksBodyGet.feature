Feature: As an administrator (admin), I want to be able to access the information of the books whose id is given via API connection.

  Scenario : WWCAPI_210 [TC_01 -> API_US029] Verify that a POST request to /api/booksId ` with valid authorization and correct data returns a 200 status code, a "Success" message,


    * The api user constructs the base url with the "adminCaner" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/booksId" path parameters.
    # Api kullanicisi "api/visitorsPurposeId" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api booksid endpoint containing the information <id2>.
    # Api kullanicisi api visitorsPurposeId endpointine gondermek icin <id> bilgisini iceren bir post request hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular




