
Feature: WWCAPI78  API US014 As an administrator (admin), I want to be able to access the Vehicle information given the id via API connection.

  Scenario: WWCAPI211 TC_01 -> API_US014 When a POST body with valid authorization information and
  correct data (id) is sent to /api/vehicleId endpoint, it should be verified that the status code
  returned is 200 and the message information in the response body is “Success”.


    Given The api user constructs the baseUrl wit the "adminSuleyman" token.
    Then The api user sets "api/vehicleId" path parameters.
    Then The api user prepares a POST request to send to the api visitorsPurposeid endpoint containing the information id 7.
    Then The api user sends a POST request and saves the returned response.
    Then The api user verifies that the status code is 200.
    Then The api user verifies that the "message" information in the response body is "Success".


  Scenario Outline: WWCAPI215 TC_02 -> API_US014 The contents of the list data
  (id,vehicle_no,vehicle_model,vehicle_photo,manufacture_year,registration_number,chasis_number,
  max_seating_capacity,driver_name,driver_licence,driver_contact,note, created_at)in the body must be verified.

    Given The api user constructs the baseUrl wit the "adminSuleyman" token.
    Then The api user sets "api/vehicleId" path parameters.
    Then The api user prepares a POST request to send to the api visitorsPurposeid endpoint containing the information id 7.
    And The api user verifies the information in the response body for the entry with the specified, including "<id>", "<vehicle_no>", "<vehicle_model>", "<vehicle_photo>", "<manufacture_year>", "<registration_number>", "<chasis_number>", "<max_seating_capacity>", "<driver_name>", "<driver_licence>", "<driver_contact>", "<note>", and "<created_at>".

    Examples:
      | id  | vehicle_no | vehicle_model | vehicle_photo | manufacture_year | registration_number | chasis_number | max_seating_capacity | driver_name | driver_licence | driver_contact | note | created_at         |
      | 7   | VH4584     | Ford CAB      | null          | 2015             | FFG-76575676787     | 523422        | 50                   | Jasper      | 258714545      | 8521479630     |      | 2023-08-06 14:31:17|


  Scenario:WWCAPI220 TC_03 -> API_US014 Send two separate POST requests to /api/vehicleId with valid authorization
  credentials,one without data (id) and one with an incorrect one,
  test to verify that the returned status code is 203 and the body message is "No ID or incorrect ID".

    Given The api user constructs the baseUrl wit the "adminSuleyman" token.
    Then The api user sets "api/vehicleId" path parameters.
    Then The api user prepares a POST request to send to the api visitorsPurposeid endpoint containing the information id 47.
    Then The api user verifies that the status code is 203.
    Then The api user verifies that the "message" information in the response body is "No id or wrong id.".
    Then The api user prepares a POST request to send to the api visitorsPurposeid endpoint without the information id.
    Then The api user verifies that the status code is 203.
    Then The api user verifies that the "message" information in the response body is "No id or wrong id.".

  Scenario: Verification test that when a POST body is sent to the /api/vehicleId endpoint with
  invalid authorization information, the returned status code is 403 and the message
  in the body is "You do not have authorization or token error".

    Given The api user constructs the baseUrl wit the "invalid" token.
    Then The api user sets "api/vehicleId" path parameters.
    Then The api user prepares a POST request to send to the api visitorsPurposeid endpoint containing the information id 7.
    Then The user verifies that the status code is 403.
    And The api user verifies that "message" information in the response body is "You do not have authorization or token error".