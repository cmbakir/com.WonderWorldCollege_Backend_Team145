Feature: As an administrator (admin), I want to be able to access the information of the books whose id is given via API connection.

  Scenario Outline: WWCAPI_210 [TC_01 -> API_US029] Verify that a POST request to /api/booksId ` with valid authorization and correct data returns a 200 status code, a "Success" message,

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/booksId" path parameters.
    * The api user prepares a POST request to send to the api booksid endpoint containing the information <id>.
    * The api user sends a POST request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Success".


    Examples:
      | id |
      | 2  |

  Scenario: WWCAPI_212 [TC_01 -> API_US029] [TC_02 -> API_US029] Verify that a POST request to /api/booksId ` without `id` and valid authorization returns a 203 status code and a "No id or wrong id." message in the response body.

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/booksId" path parameters.
    * The api user prepares a post request that does not contain data to the api booksId endpoint.
    * The api user sends a POST request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id or wrong id.".



  Scenario Outline:WWCAPI_213 [TC_03 -> API_US029] Verify that a POST request to /api/booksId ` with invalid `id` and valid authorization returns a 203 status code and a "No id or wrong id." message in the response body.

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/booksId" path parameters.
    * The api user prepares a POST request to send to the api booksId endpoint containing the information <id>.
    * The api user sends a POST request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id or wrong id.".


    Examples:
      | id  |
      |999|

  Scenario Outline:WWCAPI_214 [TC_04 -> API_US029] Verify that a POST request to to /api/booksId ` with invalid authorization returns a 403 status code and a "You do not have authorization or token error" message in the response body.

    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/booksId" path parameters.
    * The api user prepares a POST request to send to the api booksId endpoint containing the information <id>.
    * The api user sends a POST request and saves the returned response.
    * The api user verifies that the status code is 403.
    * The api user verifies that the "message" information in the response body is "You do not have authorization or token error".

    Examples:
      | id   |
      |2|