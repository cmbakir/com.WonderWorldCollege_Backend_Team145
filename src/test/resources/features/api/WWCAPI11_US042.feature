Feature: WWCAPI-11 API_US041 As an administrator (admin) I should be able to delete the notice record in the system via API connection.


  Scenario Outline: WWCAPI-119 TC_01 -> API_US042 Successful Deletion with Valid Authorization and Data

    * The api user constructs the base url with the "adminAhmetEmail" token.
    * The api user sets "api/deleteNotice" path parameters.
    * The api user prepares a DELETE request to send to the api visitorsPurposeDelete endpoint containing the information <id>.
    * The api user sends a DELETE request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Success".
    * The api user verifies that the Deletedid information in the response body is the same as the id information in the request body.

    Examples:
      | id   |
      | 607 |


  Scenario: WWCAPI-121 TC_02 -> API_US042 Deletion Request with Missing or Invalid ID

    * The api user constructs the base url with the "adminAhmetEmail" token.
    * The api user sets "api/deleteNotice" path parameters.
    * The api user prepares a DELETE request that does not contain data to the api visitorsPurposeDelete endpoint.
    * The api user sends a DELETE request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id or wrong id. Please check your id number.".


  Scenario Outline: WWCAPI-122 TC_03 -> API_US042 Response with Invalid Authorization

    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/deleteNotice" path parameters.
    * The api user prepares a DELETE request to send to the api visitorsPurposeDelete endpoint containing the information <id>.
    * The api user sends a DELETE request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.

    Examples:
      | id   |
      | 607 |


  Scenario Outline: WWCAPI-123 TC_04 -> API_US042 Verification of Deleted Record

    * The api user constructs the base url with the "adminAhmetEmail" token.
    * The api user sets "api/deleteNotice" path parameters.
    * The api user prepares a POST request to send to the api visitorsPurposeid endpoint containing the information <id>.
    * The api user sends a POST request and saves the returned response.
    * The api user verifies that the status code is 203.

    Examples:
      | id   |
      | 607 |

