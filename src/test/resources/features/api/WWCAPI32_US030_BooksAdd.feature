Feature: As an administrator (admin) I want to be able to create a new Books record via API connection.

  Scenario Outline:WWCAPI_216 [TC_01 -> API_US030] Verify that a POST request to  /api/booksAdd with valid authorization and correct data   returns a 200 status code and a "Success" message in the response body.

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/booksAdd" path parameters.
    * The api user prepares a POST request to send to the api booksAdd endpoint containing the information "<book_title>", "<book_no>", "<isbn_no>", "<subject>", "<rack_no>", "<publish>", "<author>", "<qty>", "<perunitcost>", "<postdate>", "<description>".
    * The api user sends a POST request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Success".

    Examples:
      | book_title                                | book_no | isbn_no | subject | rack_no | publish       | author        | qty | perunitcost | postdate   | description                                                                                                                                 |
      | Multiplication and Division Grades 3-4 23 | 788789  |         |         | 110     | Barbara Bando | Barbara Bando | 100 | 12.00       | 2022-05-04 | The duo dump her in a nearby river after a failed attempt to hang her. Tonya survives, and the two men are arrested by Sheriff Ozzie Walls. |


  Scenario: WWCAPI_217 [TC_02 -> API_US030] Verify that a POST request to api/booksAdd without data and valid authorization returns a 203 status code and a "No information or missing information. Please check your input data." message in the response body.

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/booksAdd" path parameters.
    * The api user prepares a post request that does not contain data to the api booksAdd endpoint.
    * The api user sends a POST request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No information or missing information. Please check your input data.".


  Scenario Outline: WWCAPI_217 [TC_03 -> API_US030] Verify that a POST request to api/booksAdd with valid authorization and incomplete data returns a 203 status code and a "No information or missing information. Please check your input data." message in the response body.

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/booksAdd" path parameters.
    * The api user prepares a POST request to send to the api booksAdd endpoint containing the information "<book_title>", "<book_no>", "<isbn_no>", "<subject>", "<rack_no>", "<publish>".
    * The api user sends a POST request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No information or missing information. Please check your input data.".



      Examples:
        | book_title | book_no | isbn_no | subject | rack_no | publish       |
        |            | 788789  |         |         | 110     | Barbara Bando |


  Scenario Outline: WWCAPI_226 [TC_04 -> API_US030] Verify that a POST request to api/booksAdd with invalid authorization and returns a 403 status code and a "You do not have authorization or token error" message in the response body.

    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/booksAdd" path parameters.
    * The api user prepares a POST request to send to the api booksAdd endpoint containing the information "<book_title>", "<book_no>", "<isbn_no>", "<subject>", "<rack_no>", "<publish>", "<author>", "<qty>", "<perunitcost>", "<postdate>", "<description>".
    * The api user sends a POST request and saves the returned response.
    * The api user verifies that the status code is 403.
    * The api user verifies that the "message" information in the response body is "You do not have authorization or token error".


    Examples:
      | book_title                                | book_no | isbn_no | subject | rack_no | publish       | author        | qty | perunitcost | postdate   | description                                                                                                                                 |
      | Multiplication and Division Grades 3-4 23 | 788789  |         |         | 110     | Barbara Bando | Barbara Bando | 100 | 12.00       | 2022-05-04 | The duo dump her in a nearby river after a failed attempt to hang her. Tonya survives, and the two men are arrested by Sheriff Ozzie Walls. |

  Scenario Outline: WWCAPI_228 [TC_05 -> API_US030] Verify the creation of a new visitor purpose record by sending a POST request to api/booksAdd with the `addId` returned in the response body of the creation API.

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/booksId" path parameters.
    * The api user prepares a POST request to send to the api booksid endpoint containing the information <id>.
    * The api user sends a POST request and saves the returned response.
    * The api user verifies that the status code is 200.

    Examples:
      | id  |
      |730|