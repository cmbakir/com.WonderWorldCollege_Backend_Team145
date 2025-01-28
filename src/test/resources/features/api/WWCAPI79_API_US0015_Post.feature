

Feature: WWCAPI79  API US015 As an administrator (admin) I want to be able to create a new vehicle record via API connection.

  Scenario Outline: WWCAPI229 TC_01 -> API_US015 Verification test that when POST body containing valid authorization
  information and correct data is sent to the /api/vehicleAdd endpoint, the returned status code is 200 and
  the message information in the response body is "Success".

    Given The api user constructs the baseUrl wit the "adminSuleyman" token.
    Then The api user sets "api/vehicleAdd" path parameters.
    Then The api user prepares a POST request to send to the api visitorsPurposeAdd endpoint containing the information, "<vehicle_no>", "<vehicle_model>", "<vehicle_photo>", "<manufacture_year>", "<registration_number>", "<chasis_number>", "<max_seating_capacity>", "<driver_name>", "<driver_licence>", "<driver_contact>", "<note>", and "<created_at>".
    Then The api user verifies that the status code is 200.
    Then The api user verifies that the "message" information in the response body is "Success".

    Examples:
      | vehicle_no | vehicle_model | vehicle_photo | manufacture_year | registration_number | chasis_number | max_seating_capacity | driver_name | driver_licence | driver_contact | note | created_at         |
      | VH4584     | Ford CAB      | null          | 2015             | FFG-76575676787     | 523422        | 50                   | Jasper      | 258714545      | 8521479630     |      | 2025-01-09 10:26:37|

  Scenario Outline: WWCAPI233 TC_02 -> API_US015 Verification test that when a POST request with valid
  authorization information and no data or incomplete data is sent to the /api/vehicleAdd endpoint,
  the returned status code is 203 and the error message information is in the body.

    Given The api user constructs the baseUrl wit the "adminSuleyman" token.
    Then The api user sets "api/vehicleAdd" path parameters.
    Then The API user sends a dataless POST request to the API visitorsPurposeid endpoint without any information body.
    Then The api user verifies that the status code is 203.
    Then The api user verifies that the "message" information in the response body is "No information or missing information. Please check your input data.".
    Then API user sends a POST request with missing data to the API visitorsPurposeAdd endpoint,"<chasis_number>", "<max_seating_capacity>", "<driver_name>", "<driver_licence>", "<driver_contact>", "<note>", and "<created_at>".
    Then The api user verifies that the status code is 203.
    Then The api user verifies that the "message" information in the response body is "No information or missing information. Please check your input data.".

    Examples:
      | chasis_number | max_seating_capacity | driver_name | driver_licence | driver_contact | note | created_at         |
      | 523422        | 50                   | Jasper      | 258714545      | 8521479630     |      | 2025-01-09 10:26:37|

  Scenario Outline: WWCAPI235 TC_03-> API_US015 [TC_03 -> API_US015]When a POST body with invalid authorization
  information is sent to /api/vehicleAdd endpoint, it should be verified that the status code
  returned is 403 and the message in the body is “You do not have authorization or token error”.

    Given The api user constructs the baseUrl wit the "invalid" token.
    Then The api user sets "api/vehicleAdd" path parameters.
    Then The api user prepares a POST request to send to the api visitorsPurposeAdd endpoint containing the information, "<vehicle_no>", "<vehicle_model>", "<vehicle_photo>", "<manufacture_year>", "<registration_number>", "<chasis_number>", "<max_seating_capacity>", "<driver_name>", "<driver_licence>", "<driver_contact>", "<note>", and "<created_at>".
    Then The user verifies that the status code is 403.
    And The api user verifies that "message" information in the response body is "You do not have authorization or token error".
    Examples:
      | vehicle_no | vehicle_model | vehicle_photo | manufacture_year | registration_number | chasis_number | max_seating_capacity | driver_name | driver_licence | driver_contact | note | created_at         |
      | VH4584     | Ford CAB      | null          | 2015             | FFG-76575676787     | 523422        | 50                   | Jasper      | 258714545      | 8521479630     |      | 2025-01-09 10:26:37|

  Scenario Outline:  WWCAPI237 TC_04-> API_US015 The new vehicle record to be created from the API must be verified from the API.

    Given The api user constructs the baseUrl wit the "adminSuleyman" token.
    Then The api user sets "api/vehicleAdd" path parameters.
    Then The api user prepares a POST request to send to the api visitorsPurposeAdd endpoint containing the information, "<vehicle_no>", "<vehicle_model>", "<vehicle_photo>", "<manufacture_year>", "<registration_number>", "<chasis_number>", "<max_seating_capacity>", "<driver_name>", "<driver_licence>", "<driver_contact>", "<note>", and "<created_at>".
    Then The api user sends a POST request and saves the returned response.
    Given The api user constructs the baseUrl wit the "adminSuleyman" token.
    Then The api user sets "api/vehicleId" path parameters.
    Then The api user gets the addId in the response body
    Then The api user prepares a POST request to send to the api visitorsPurposeid endpoint containing the information id addId.
    Then The api user verifies that the status code is 200.
    Then The api user verifies that the "message" information in the response body is "Success".
    Examples:
      | vehicle_no | vehicle_model | vehicle_photo | manufacture_year | registration_number | chasis_number | max_seating_capacity | driver_name | driver_licence | driver_contact | note | created_at         |
      | VH4975     | MAN CAB       | null          |  1975            | FFG-76575676787     | 523422        | 45                   | Varol      | 258714545      | 8521479630     |      | 2025-01-25 10:26:37 |