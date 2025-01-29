Feature: WWCAPI-11 API_US041 As an administrator (admin) I should be able to delete the notice record in the system via API connection.


  Scenario Outline: WWCAPI-119 TC_01 -> API_US042 Successful Deletion with Valid Authorization and Data

    * The api user constructs the base url with the "adminAhmetEmail" token.
    * The api user sets "api/getNotice" path parameters.
    * The api user prepares a DELETE request to send to the api visitorsPurposeDelete endpoint containing the information <id>.
    * The api user sends a DELETE request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Success".
    * The api user verifies that the Deletedid information in the response body is the same as the id information in the request body.

    Examples:
      | id   |
      | 1277 |


  Scenario: Verify that a DELETE request to `/api/visitorsPurposeDelete` without `id` and with valid authorization returns a
  203 status code and a "No id or wrong id. Please check your id number." message in the response body.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/visitorsPurposeDelete" path parameters.
    # Api kullanicisi "api/visitorsPurposeDelete" path parametrelerini olusturur
    * The api user prepares a DELETE request that does not contain data to the api visitorsPurposeDelete endpoint.
    # Api kullanicisi api visitorsPurposeDelete endpointine data icermeyen bir delete request hazirlar
    * The api user sends a DELETE request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "No id or wrong id. Please check your id number.".
    # Api kullanicisi response bodydeki message bilgisinin "No id or wrong id. Please check your id number." oldugunu dogrular


  Scenario Outline: Verify that a DELETE request to `/api/visitorsPurposeDelete` with invalid authorization and `id` returns a
  403 status code and a "You do not have authorization or token error" message in the response body.

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/visitorsPurposeDelete" path parameters.
    # Api kullanicisi "api/visitorsPurposeDelete" path parametrelerini olusturur
    * The api user prepares a DELETE request to send to the api visitorsPurposeDelete endpoint containing the information <id>.
    # Api kullanicisi api visitorsPurposeDelete endpointine gondermek icin <id> bilgisini iceren bir delete request hazirlar
    * The api user sends a DELETE request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.
    # Api kullanicisi DELETE request gonderir, donen responsei kaydeder, status codeun '403' ve reason phrase bilgisinin Forbidden oldugunu dogrular

    Examples:
      | id   |
      | 1278 |



  Scenario Outline: Verify that the visitor purpose record is successfully deleted by sending a POST request to
  `/api/visitorsPurposeId` with the `DeletedId` returned in the response body to confirm the deletion.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/visitorsPurposeId" path parameters.
    # Api kullanicisi "api/visitorsPurposeId" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api visitorsPurposeid endpoint containing the information <id>.
    # Api kullanicisi api visitorsPurposeId endpointine gondermek icin <id> bilgisini iceren bir post request hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular

    Examples:
      | id   |
      | 1277 |

