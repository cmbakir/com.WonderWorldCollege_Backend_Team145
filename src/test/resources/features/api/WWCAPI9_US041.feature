Feature: WWCAPI-9 API_US041 As an administrator (admin), I want to be able to update the notice information registered in the system via API connection.

  Scenario Outline: WWC-112 TC_01 -> API_US041 Successful Update with Valid Authorization and Data

    * The api user constructs the base url with the "adminAhmetEmail" token.
    * The api user sets "api/updateNotice" path parameters.
    * The api user prepares a PATCH request to send to the api updateNotice endpoint containing the information <id>, "<type>", "<title>", "<slug>" and "<description>".
    * The api user sends a PATCH request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Success".
    * The api user verifies that the updateid information in the response body is the same as the id information in the request body.

    Examples:
      | id  | type   | title               | description   | slug   |
      | 589 | notice | notice deneme 12345 | notice deneme | wonder |


  Scenario Outline: WWC-113 TC_02 -> API_US041 Invalid or Missing ID in Update Request

    * The api user constructs the base url with the "adminAhmetEmail" token.
    * The api user sets "api/updateNotice" path parameters.
    * The api user prepares a PATCH request to send to the api updateNotice endpoint containing the information <id>, "<type>", "<title>", "<slug>" and "<description>".
    * The api user sends a PATCH request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".

    Examples:
      | id    | type   | title               | description   | slug   |
      | 99999 | notice | notice deneme 12345 | notice deneme | wonder |


  Scenario: WWC-114 TC_03 -> API_US041 Empty Data Submission Test

    * The api user constructs the base url with the "adminAhmetEmail" token.
    * The api user sets "api/updateNotice" path parameters.
    * The api user prepares a patch request that does not contain data to the api updateNotice endpoint.
    * The api user sends a PATCH request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".


  Scenario Outline: WWC-115 TC_04 -> API_US041 Response with Invalid Authorization

    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/updateNotice" path parameters.
    * The api user prepares a PATCH request to send to the api updateNotice endpoint containing the information <id>, "<type>", "<title>", "<slug>" and "<description>".
    * The api user sends a PATCH request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.

    Examples:
      | id  | type   | title               | description   | slug   |
      | 589 | notice | notice deneme 12345 | notice deneme | wonder |
