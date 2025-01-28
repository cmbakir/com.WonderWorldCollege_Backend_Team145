Feature: As an administrator I should be able to unregister books in the system via API connection.

  Scenario Outline: WWCAPI_241 [TC_01-> API_US032]  Verify that a DELETE request to  /api/booksDelete with valid authorization and correct `id`returns a 200 status code, a "Success" message,

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/booksDelete" path parameters.
    * The api user prepares a DELETE request to send to the api booksDelete endpoint containing the information <id>.
    * The api user sends a DELETE request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Success".
    * The api user verifies that the Deletedid information in the response body is the same as the id information in the request body.


    Examples:
      | id  |
      |746|

  Scenario:WWCAPI-243 [TC_02-> API_US032] Verify that a DELETE request to /api/booksDelete without `id` and with valid authorization returns a 203 status code and a "No id or wrong id. Please check your id number." message in the response body

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/booksDelete" path parameters.
    * The api user prepares a DELETE request that does not contain data to the api booksDelete endpoint.
    * The api user sends a DELETE request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id or wrong id. Please check your id number.".


  Scenario Outline: WWCAPI-245[TC_03-> API_US032]  Verify that a DELETE request to /api/booksDelete   with valid authorization and invalid `id` returns a 203 status code and a "No id or wrong id. Please check your id number." message in the response body.

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/booksDelete" path parameters.
    * The api user prepares a DELETE request to send to the api booksDelete endpoint containing the information <id>.
    * The api user sends a DELETE request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id or wrong id. Please check your id number.".


    Examples:
      | id  |
      | 999 |

  Scenario Outline: WWCAPI-247 [TC_04-> API_US032] Verify that a DELETE request to /api/booksDelete with invalid authorization and `id` returns a 403 status code and a "You do not have authorization or token error" message in the response body.

    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/booksDelete" path parameters.
    * The api user prepares a DELETE request to send to the api booksDelete endpoint containing the information <id>.
    * The api user sends a DELETE request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.

    Examples:
      | id  |
      |743|


  Scenario Outline: WWCAPI-249 [TC_05-> API_US032]  Verify that the visitor purpose record is successfully deleted by sending a POST request to api/booksDelete    with the `DeletedId` returned in the response body to confirm the deletion.

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/booksId" path parameters.
    * The api user prepares a POST request to send to the api booksid endpoint containing the information <id>.
    * The api user sends a POST request and saves the returned response.
    * The api user verifies that the status code is 203.

    Examples:
      | id  |
      |742|
