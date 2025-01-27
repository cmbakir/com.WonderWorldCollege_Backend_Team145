Feature: WWCAPI31 API_US037 As an administrator I should be able to unregister visitors in the system via API connection.

  Scenario Outline: WWCAPI268 TC_01 -> API_US037 Verify that a DELETE request to `/api/visitorsDelete` with valid authorization and correct `id`
  returns a 200 status code, a "Success" message, and that the `DeletedId` in the response matches the `id` in the request body.

    * The api user constructs the base url with the "adminPinar" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/visitorsDelete" path parameters.
    # Api kullanicisi "api/visitorsPurposeDelete" path parametrelerini olusturur
    * The api user prepares a DELETE request to send to the api visitorsDelete endpoint containing the information <id>.
    # Api kullanicisi api visitorsPurposeDelete endpointine gondermek icin <id> bilgisini iceren bir delete request hazirlar
    * The api user sends a DELETE request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular
    * The api user verifies that the Deletedid information in the response body is the same as the id information in the request body.
    # Api kullanıcısı response body icindeki DeletedId bilgisinin request body icindeki id bilgisi ile ayni oldugunu dogrular.

    Examples:
      | id   |
      | 1267 |


  Scenario: WWCAPI269 TC_02 -> API_US037 Verify that a DELETE request to `/api/visitorsDelete` without `id` and with valid authorization returns a
  203 status code and a "No id or wrong id. Please check your id number." message in the response body.

    * The api user constructs the base url with the "adminPinar" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/visitorsDelete" path parameters.
    # Api kullanicisi "api/visitorsPurposeDelete" path parametrelerini olusturur
    * The api user prepares a DELETE request that does not contain data to the api visitorsDelete endpoint.
    # Api kullanicisi api visitorsPurposeDelete endpointine data icermeyen bir delete request hazirlar
    * The api user sends a DELETE request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "No id or wrong id. Please check your id number.".
    # Api kullanicisi response bodydeki message bilgisinin "No id or wrong id. Please check your id number." oldugunu dogrular


  Scenario Outline: WWCAPI271 TC_03 -> API_US037 Verify that a DELETE request to `/api/visitorsDelete` with valid authorization and invalid `id`
  returns a 203 status code and a "No id or wrong id. Please check your id number." message in the response body.

    * The api user constructs the base url with the "adminPinar" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/visitorsDelete" path parameters.
    # Api kullanicisi "api/visitorsPurposeDelete" path parametrelerini olusturur
    * The api user prepares a DELETE request to send to the api visitorsDelete endpoint containing the information <id>.
    # Api kullanicisi api visitorsPurposeDelete endpointine gondermek icin <id> bilgisini iceren bir delete request hazirlar
    * The api user sends a DELETE request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "No id or wrong id. Please check your id number.".
    # Api kullanicisi response bodydeki message bilgisinin "No id or wrong id. Please check your id number." oldugunu dogrular

    Examples:
      | id    |
      | 86594 |


  Scenario Outline: WWCAPI273 TC_04 -> API_US037 Verify that a DELETE request to `/api/visitorsDelete` with invalid authorization and `id` returns a
  403 status code and a "You do not have authorization or token error" message in the response body.

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/visitorsDelete" path parameters.
    # Api kullanicisi "api/visitorsPurposeDelete" path parametrelerini olusturur
    * The api user prepares a DELETE request to send to the api visitorsDelete endpoint containing the information <id>.
    # Api kullanicisi api visitorsPurposeDelete endpointine gondermek icin <id> bilgisini iceren bir delete request hazirlar
    * The api user sends a DELETE request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 403.
    # Api kullanicisi status codeun 403 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "You do not have authorization or token error".
    # Api kullanicisi response bodydeki message bilgisinin "You do not have authorization or token error" oldugunu dogrular

    Examples:
      | id   |
      | 1267 |

    # * The api user sends a DELETE request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.
    # Api kullanicisi DELETE request gonderir, donen responsei kaydeder, status codeun '403' ve reason phrase bilgisinin Forbidden oldugunu dogrular



  Scenario Outline: WWCAPI274 TC_05 -> API_US037 Verify that the visitor record is successfully deleted by sending a POST request to
  `/api/visitorsId` with the `DeletedId` returned in the response body to confirm the deletion.

    * The api user constructs the base url with the "adminPinar" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/visitorsId" path parameters.
    # Api kullanicisi "api/visitorsPurposeId" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api visitorsid endpoint containing the information <id>.
    # Api kullanicisi api visitorsPurposeId endpointine gondermek icin <id> bilgisini iceren bir post request hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular

    Examples:
      | id   |
      | 1267 |

