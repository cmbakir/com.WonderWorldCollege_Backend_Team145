
Feature: WWCAPI81  API US017 As an administrator I should be able to delete the Vehicle record in the system via API connection.

  Scenario:WWCAPI257 TC_01 -> API_US017 When a DELETE body with valid authorization information and correct
  data (id)is sent to the /api/vehicleDelete endpoint, it should be verified that the status code returned is
  200 and the message information in the body is “Success”.

    Given The api user constructs the baseUrl wit the "adminSuleyman" token.
    Then The api user sets "api/vehicleDelete" path parameters.
    Then The api user prepares a Delete request to send to the api visitorsPurposeid endpoint containing the information id 678.
    Then The api user sends a DELETE request and saves the returned response
    Then The api user verifies that the status code is 200.
    Then The api user verifies that the "message" information in the response body is "Success".

  Scenario: WWCAPI259 TC_02 -> API_US017 Test to verify that when a DELETE request with
  valid authorization information, no data (id) and invalid data (id) is sent to the /api/vehicleDelete endpoint,
  the returned status code is 203 and there is an error message in the body.

    Given The api user constructs the baseUrl wit the "adminSuleyman" token.
    Then The api user sets "api/vehicleDelete" path parameters.
    Then The API user prepares to send a Delete request without id to the api visitorsPurposeid endpoint.
    Then The api user verifies that the status code is 203.
    Then The api user verifies that the "message" information in the response body is "No id or wrong id. Please check your id number.".
    Then The api user sends a DELETE request and saves the returned response
    Then The api user prepares a Delete request to send to the api visitorsPurposeid endpoint containing the information id 1672.
    Then The api user verifies that the status code is 203.
    Then The api user verifies that the "message" information in the response body is "No id or wrong id. Please check your id number.".


  Scenario:WWCAPI260 TC_03 -> API_US017 Test to verify that when a DELETE body (id) is sent to the /api/vehicleDelete
  endpoint with invalid authorization credentials, the returned status code is 403 and
  the error message in the body is correct.

    Given The api user constructs the baseUrl wit the "invalid" token.
    Then The api user sets "api/vehicleDelete" path parameters.
    Then The api user prepares a Delete request to send to the api visitorsPurposeid endpoint containing the information id 681.
    Then The api user sends a DELETE request and saves the returned response
    Then The user verifies that the status code is 403.
    And The api user verifies that "message" information in the response body is "You do not have authorization or token error".

  Scenario: WWCAPI261 TC_04 -> API_US017 It must be verified that the DeletedId in the response body is the same as
  the id in the delete request body sent to the /api/vehicleDelete endpoint.

    Given The api user constructs the baseUrl wit the "adminSuleyman" token.
    Then The api user sets "api/vehicleDelete" path parameters.
    Then The api user prepares a Delete request to send to the api visitorsPurposeid endpoint containing the information id 687.
    Then The api user sends a DELETE request and saves the returned response
    Then Verifies that the DeletedId in the user response body is the same as the id 687 in the delete request body.

  Scenario Outline: WWCAPI264 TC_05 -> API_US017 The deletion of the vehicle record to be deleted from the API must be verified from the API.

    Given The api user constructs the baseUrl wit the "adminSuleyman" token.
    Then The api user sets "api/vehicleDelete" path parameters.
    Then The api user prepares a Delete request to send to the api visitorsPurposeid endpoint containing the information id 692.
    Then The api user sends a DELETE request and saves the returned response
    Given The api user constructs the baseUrl wit the "adminSuleyman" token.
    Then The api user sets "api/vehicleId" path parameters.
    Then The api user gets the DeletedId in the response body
    Then The api user prepares a POST request to send to the api visitorsPurposeid endpoint containing the information id DeletedId.
    Then The api user sends a POST request and saves the returned response.
    Then Verifies the user deletion process from the status <code> and "<message>" information of the response returned by the request post boy created with Deleted Id.

    Examples:
      |code | message               |
      | 203 | No id or wrong id.    |
