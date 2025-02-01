Feature: WWCAPI-7 API_US040 As an administrator (admin) I want to be able to create a new notice record via API connection.

  @notice
  Scenario Outline: WWC-109 TC_01 -> API_US040 Successful Notice Creation with Valid Authorization and Data

    * The api user constructs the base url with the "adminAhmetEmail" token.
    * The api user sets "api/addNotice" path parameters.
    * The api user prepares a POST request to send to the api visitorsPurposeAdd endpoint containing the information "<type>", "<title>",  "<slug>" and "<description>".
    * The api user sends a POST request and saves the returned response.
    * The api user verifies that the status code is 206.
    * The api user verifies that the "message" information in the response body is "Success".

    Examples:
      | type   | title               |  description   |  slug         |
      | notice | notice deneme 12345 |  notice deneme |  noticedeneme |

  @notice
  Scenario: WWC-110 TC_02 -> API_US040 Verify that a POST request to `/api/visitorsPurposeAdd` without data and valid authorization returns a 203
  status code and a "No information or missing information. Please check your input data." message in the response body.

    * The api user constructs the base url with the "adminAhmetEmail" token.
    * The api user sets "api/addNotice" path parameters.
    * The api user prepares a post request that does not contain data to the api addNotice endpoint.
    * The api user sends a POST request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No information or missing information. Please check your input data.".

  @notice
  Scenario Outline: WWC-111 TC_03 -> API_US040 Response with Invalid Authorization

    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/addNotice" path parameters.
    * The api user prepares a POST request to send to the api visitorsPurposeAdd endpoint containing the information "<type>", "<title>",  "<slug>" and "<description>".
    * The api user sends a POST request and saves the returned response.
    * The api user verifies that the status code is 403.
    * The api user verifies that the "message" information in the response body is "You do not have authorization or token error".

    Examples:
      | type   | title               |  description   |  slug         |
      | notice | notice deneme 12345 |  notice deneme |  noticedeneme |
