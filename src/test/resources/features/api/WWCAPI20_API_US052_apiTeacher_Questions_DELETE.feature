Feature: WWCAPI20 API_US052 As a teacher I should be able to delete the question record in the system via API connection.

  Scenario Outline: WWCAPI... TC_01 -> API_US052 Verify that a DELETE request to `/apiteacher/questionDelete` with valid authorization and correct `id`
  returns a 200 status code, a "Success" message, and that the `DeletedId` in the response matches the `id` in the request body.

    * The api user constructs the base url with the "teacher" token.
    # Api kullanicisi "teacher" token ile base urli olusturur
    * The api user sets "apiteacher/questionDelete" path parameters.
    # Api kullanicisi "apiteacher/questionDelete" path parametrelerini olusturur
    * The api user prepares a DELETE request to send to the api questionDelete endpoint containing the information <id>.
    # Api kullanicisi api questionDelete endpointine gondermek icin <id> bilgisini iceren bir delete request hazirlar
    * The api user sends a DELETE request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular
    * The api user verifies that the DeletedId information in the response body is the same as the id information in the request body.
    # Api kullanıcısı response body icindeki DeletedId bilgisinin request body icindeki id bilgisi ile ayni oldugunu dogrular.

    Examples:
      | id   |
      | 293  |


  Scenario: WWCAPI... TC_02 -> API_US052 Verify that a DELETE request to `/apiteacher/questionDelete` without `id` and with valid authorization returns a
  203 status code and a "No id or wrong id. Please check your id number." message in the response body.

    * The api user constructs the base url with the "teacher" token.
    # Api kullanicisi "teacher" token ile base urli olusturur
    * The api user sets "apiteacher/questionDelete" path parameters.
    # Api kullanicisi "apiteacher/questionDelete" path parametrelerini olusturur
    * The api user prepares a DELETE request that does not contain data to the api questionDelete endpoint.
    # Api kullanicisi api questionDelete endpointine data icermeyen bir delete request hazirlar
    * The api user sends a DELETE request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "No id or wrong id. Please check your id number.".
    # Api kullanicisi response bodydeki message bilgisinin "No id or wrong id. Please check your id number." oldugunu dogrular


  Scenario Outline: WWCAPI... TC_03-> API_US052  Verify that a DELETE request to `/apiteacher/questionDelete` with valid authorization and invalid `id`
  returns a 203 status code and a "No id or wrong id. Please check your id number." message in the response body.

    * The api user constructs the base url with the "teacher" token.
    # Api kullanicisi "teacher" token ile base urli olusturur
    * The api user sets "apiteacher/questionDelete" path parameters.
    # Api kullanicisi "apiteacher/questionDelete" path parametrelerini olusturur
    * The api user prepares a DELETE request to send to the api questionDelete endpoint containing the information <id>.
    # Api kullanicisi api questionDelete endpointine gondermek icin <id> bilgisini iceren bir delete request hazirlar
    * The api user sends a DELETE request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "No id or wrong id. Please check your id number.".
    # Api kullanicisi response bodydeki message bilgisinin "No id or wrong id. Please check your id number." oldugunu dogrular

    Examples:
      | id   |
      | 1245876 |

  Scenario Outline: WWCAPI... TC_04 -> API_US052 Verify that a DELETE request to `/apiteacher/questionDelete` with invalid authorization and `id` returns a
  403 status code and a "You do not have authorization or token error" message in the response body.

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "apiteacher/questionDelete" path parameters.
    # Api kullanicisi "apiteacher/questionDelete" path parametrelerini olusturur
    * The api user prepares a DELETE request to send to the api questionDelete endpoint containing the information <id>.
    # Api kullanicisi api questionDelete endpointine gondermek icin <id> bilgisini iceren bir delete request hazirlar
    #* The api user sends a DELETE request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    #* The api user verifies that the status code is 403.
    # Api kullanicisi status codeun 403 oldugunu dogrular
    #* The api user verifies that the "message" information in the response body is "You do not have authorization or token error".
    # Api kullanicisi response bodydeki message bilgisinin "You do not have authorization or token error" oldugunu dogrular

    * The api user sends a DELETE request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.
        # Api kullanicisi DELETE request gonderir, donen responsei kaydeder, status codeun '403' ve reason phrase bilgisinin Forbidden oldugunu dogrular

    Examples:
      | id   |
      | 293 |




  Scenario Outline: WWCAPI... TC_05 -> API_US052 Verify that the questions record is successfully deleted by sending a POST request to
  `/apiteacher/questionDetailsById` with the `DeletedId` returned in the response body to confirm the deletion.

    * The api user constructs the base url with the "teacher" token.
    # Api kullanicisi "teacher" token ile base urli olusturur
    * The api user sets "apiteacher/questionDetailsById" path parameters.
    # Api kullanicisi "apiteacher/questionDetailsById" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api questionDetailsById endpoint containing the information <id>.
    # Api kullanicisi api questionDetailsById endpointine gondermek icin <id> bilgisini iceren bir post request hazirlar
    * The api user sends a DELETE request and save the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular

    Examples:
      | id   |
      | 293  |
