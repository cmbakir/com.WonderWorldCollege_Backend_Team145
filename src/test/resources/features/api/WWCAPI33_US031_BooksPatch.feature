Feature: As an administrator (admin), I want to be able to update the Books information registered in the system via API connection.

  Scenario Outline:WWCAPI_230 [TC_01-> API_US031] verify that a PATCH request to /api/booksUpdate with valid authorization and correct data returns a 200 status code, a "success" message.

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/booksUpdate" path parameters.
    * The api user prepares a PATCH request to send to the api booksUpdate endpoint containing the information "<id>", "<book_title>", "<book_no>", "<isbn_no>", "<subject>", "<rack_no>", "<publish>", "<author>", "<qty>", "<perunitcost>", "<postdate>", "<description>", "<available>" and "<is_active>".
    * The api user sends a PATCH request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Success".
    *  The api user verifies that the updateid information in the response body is the same as the id information in the request body.


    Examples:
      | id  | book_title                                   | book_no | isbn_no | subject | rack_no | publish       | author        | qty | perunitcost | postdate   | description                                                                                                                                 | available | is_active |
      | 725 | Multiplication and Division Grades 3-4 23456 | 788789  |         |         | 111     | Barbara Bando | Barbara Bando | 100 | 12.00       | 2022-05-04 | The duo dump her in a nearby river after a failed attempt to hang her. Tonya survives, and the two men are arrested by Sheriff Ozzie Walls. | yes       | no        |


  Scenario Outline:WWCAPI_232  [TC_02-> API_US031] verify that a patch request to /api/booksUpdate ` with valid authorization and invalid `id returns a 203 status code...message in the response body.

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/booksUpdate" path parameters.
    * The api user prepares a PATCH request to send to the api booksUpdate endpoint containing the information "<id>", "<book_title>", "<book_no>", "<isbn_no>", "<subject>", "<rack_no>", "<publish>", "<author>", "<qty>", "<perunitcost>", "<postdate>", "<description>", "<available>" and "<is_active>".
    * The api user sends a PATCH request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".


    Examples:
      | id  | book_title                                   | book_no | isbn_no | subject | rack_no | publish       | author        | qty | perunitcost | postdate   | description                                                                                                                                 | available | is_active |
      | 888 | Multiplication and Division Grades 3-4 23456 | 788789  |         |         | 110     | Barbara Bando | Barbara Bando | 100 | 12.00       | 2022-05-04 | The duo dump her in a nearby river after a failed attempt to hang her. Tonya survives, and the two men are arrested by Sheriff Ozzie Walls. | yes       | no        |


  Scenario Outline:WWCAPI_232   [TC_03-> API_US031] verify that a patch request to /api/booksUpdate without `id` and with valid authorization returns a 203 status code and a "wrong information or missing information..." message in the response body.

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/booksUpdate" path parameters.
    * The api user prepares a PATCH request to send to the api booksUpdate endpoint containing the information "<id>", "<book_title>", "<book_no>", "<isbn_no>", "<subject>", "<rack_no>", "<publish>", "<author>", "<qty>", "<perunitcost>", "<postdate>", "<description>", "<available>" and "<is_active>".
    * The api user sends a PATCH request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".


    Examples:
      | book_title                                   | book_no | isbn_no | subject | rack_no | publish       | author        | qty | perunitcost | postdate   | description                                                                                                                                 | available | is_active |
      | Multiplication and Division Grades 3-4 23456 | 788789  |         |         | 110     | Barbara Bando | Barbara Bando | 100 | 12.00       | 2022-05-04 | The duo dump her in a nearby river after a failed attempt to hang her. Tonya survives, and the two men are arrested by Sheriff Ozzie Walls. | yes       | no        |

  Scenario:WWCAPI_234  [TC_04-> API_US031] verify that a patch request to /api/booksUpdate ` with valid authorization and without data returns a 203 status code and a "wrong information..." message in the response body.

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/booksUpdate" path parameters.
    * The api user prepares a patch request that does not contain data to the api booksUpdate endpoint.
    * The api user sends a PATCH request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".


  Scenario Outline:WWCAPI_236 [TC_05-> API_US031] verify that a patch request to /api/booksUpdate with invalid authorization and data returns a 403 status code and a "you do not have authorization or token error" message in the response body.

    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/booksUpdate" path parameters.
    * The api user prepares a PATCH request to send to the api booksUpdate endpoint containing the information "<id>", "<book_title>", "<book_no>", "<isbn_no>", "<subject>", "<rack_no>", "<publish>", "<author>", "<qty>", "<perunitcost>", "<postdate>", "<description>", "<available>" and "<is_active>".
    * The api user sends a PATCH request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.


    Examples:
      | id  | book_title                                   | book_no | isbn_no | subject | rack_no | publish       | author        | qty | perunitcost | postdate   | description                                                                                                                                 | available | is_active |
      | 725 | Multiplication and Division Grades 3-4 23456 | 788789  |         |         | 110     | Barbara Bando | Barbara Bando | 100 | 12.00       | 2022-05-04 | The duo dump her in a nearby river after a failed attempt to hang her. Tonya survives, and the two men are arrested by Sheriff Ozzie Walls. | yes       | no        |

  Scenario Outline:WWCAPI_239  [TC_06-> API_US031]  verify that the book purpose record updated via apı is successfully updated by sending a post request to /api/booksUpdate with the `updateıd` returned in the response body.

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/booksId" path parameters.
    * The api user prepares a POST request to send to the api booksid endpoint containing the information <id>.
    * The api user sends a POST request and saves the returned response.
    * The api user verifies books_title as "Multiplication and Division Grades 3-4 23456"

    Examples:
      | id  |
      | 725 |
