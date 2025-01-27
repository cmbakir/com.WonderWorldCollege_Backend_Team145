

Feature: WWCAPI80  API US016 As an administrator (admin), I want to be able to update the Vehicle information registered in the system via API connection.

  Scenario Outline: WWCAPI244 TC_01 -> API_US016 When sending a PATCH body with valid authorization information and
  correct data to /api/vehicleUpdate endpoint, it should be verified that the status code
  returned is 200 and the message in the response body is “Success”.

    Given The api user constructs the baseUrl wit the "adminSuleyman" token.
    Then The api user sets "api/vehicleUpdate" path parameters.
    Then The api user prepares a PATCH request to send to the api visitorsPurposeAdd endpoint containing the information,"<id>", "<vehicle_no>", "<vehicle_model>", "<vehicle_photo>", "<manufacture_year>", "<registration_number>", "<chasis_number>", "<max_seating_capacity>", "<driver_name>", "<driver_licence>", "<driver_contact>", "<note>".
    Then The api user verifies that the status code is 200.
    Then The api user verifies that the "message" information in the response body is "Success".
    Given The api user constructs the baseUrl wit the "adminSuleyman" token.
    Then The api user sets "api/vehicleId" path parameters.
    Then The api user prepares a POST request to send to the api visitorsPurposeid endpoint containing the information id 658.
    Then The api user sends a POST request and saves the returned response.
    Then The api user verifies that the status code is 200.
    Then The api user verifies that the "message" information in the response body is "Success".

    Examples:
      | id  | vehicle_no | vehicle_model | vehicle_photo | manufacture_year | registration_number | chasis_number | max_seating_capacity | driver_name | driver_licence | driver_contact | note |
      | 658 | VH4594     | BUGATTI       | null          | 2024             | FFG-76575676787     | 523422        | 4                   | smanvar      | 258714545      | 8521479630     |      |


  Scenario Outline: WWCAPI252 TC_02 -> API_US016 Send a PATCH body with valid authorization
  information and invalid (id) and without (id) to the /api/vehicleUpdate endpoint, verify that the returned code
  is 203 and there is an error message in the body.

    Given The api user constructs the baseUrl wit the "adminSuleyman" token.
    Then The api user sets "api/vehicleUpdate" path parameters.
    Then The api user prepares a PATCH request to send to the api visitorsPurposeAdd endpoint containing the information,"<id>", "<vehicle_no>", "<vehicle_model>", "<vehicle_photo>", "<manufacture_year>", "<registration_number>", "<chasis_number>", "<max_seating_capacity>", "<driver_name>", "<driver_licence>", "<driver_contact>", "<note>".
    Then The api user verifies that the status code is 203.
    Then The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".
    Then The api user prepares a PATCH request to send to the api visitorsPurposeAdd endpoint containing the information,"<id>", "<vehicle_no>", "<vehicle_model>", "<vehicle_photo>", "<manufacture_year>", "<registration_number>", "<chasis_number>", "<max_seating_capacity>", "<driver_name>", "<driver_licence>", "<driver_contact>", "<note>".
    Then The api user verifies that the status code is 203.
    Then The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".
    Examples:
      | id  | vehicle_no | vehicle_model | vehicle_photo | manufacture_year | registration_number | chasis_number | max_seating_capacity | driver_name | driver_licence | driver_contact | note |
      | 958 | VH4594     | MACLAREN       | null          | 2024             | FFG-76575676787     | 523422        | 4                   | smanvar      | 258714545      | 8521479630     |      |
      |     | VH4594     | MACLAREN       | null          | 2021             | FFG-76575676787     | 523422        | 4                   | smanvar      | 258714545      | 8521479630     |      |


  Scenario:WWCAPI253 TC_03 -> API_US016 When a PATCH request is sent to the /api/vehicleUpdate
  endpoint without valid authorization information, the returned status code is 203 and the test to verify
  that an error message is received in the response body.

    Given The api user constructs the baseUrl wit the "adminSuleyman" token.
    Then The api user sets "api/vehicleUpdate" path parameters.
    Then The api user prepares a patch request that does not contain data to the api visitorsPurposeUpdate endpoint.
    Then The api user sends a PATCH request and saves the returned response.
    Then The api user verifies that the status code is 203.
    And The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".



  Scenario Outline: WWCAPI254 TC_04-> API_US016 Verification test that when a PATCH body is sent to the
  /api/vehicleUpdate endpoint with invalid authorization information, the returned status code
  is 403 and there is a message in the body.

    Given The api user constructs the baseUrl wit the "invalid" token.
    Then The api user sets "api/vehicleUpdate" path parameters.
    Then The api user prepares a PATCH request to send to the api visitorsPurposeAdd endpoint containing the information,"<id>", "<vehicle_no>", "<vehicle_model>", "<vehicle_photo>", "<manufacture_year>", "<registration_number>", "<chasis_number>", "<max_seating_capacity>", "<driver_name>", "<driver_licence>", "<driver_contact>", "<note>".
    Then The user verifies that the status code is 403.
    And The api user verifies that "message" information in the response body is "You do not have authorization or token error".

    Examples:
      | id  | vehicle_no | vehicle_model | vehicle_photo | manufacture_year | registration_number | chasis_number | max_seating_capacity | driver_name | driver_licence | driver_contact | note |
      | 658 | VH4594     | BUGATTI       | null          | 2024             | FFG-76575676787     | 523422        | 4                   | smanvar      | 258714545      | 8521479630     |      |


  Scenario Outline: WWCAPI255 TC_05-> API_US016 Verify that the updateId in the response body is the same as the id in the
  patch request body sent to the /api/vehicleUpdate endpoint.

    Given The api user constructs the baseUrl wit the "adminSuleyman" token.
    Then The api user sets "api/vehicleUpdate" path parameters.
    Then The api user prepares a PATCH request to send to the api visitorsPurposeAdd endpoint containing the information,"<id>", "<vehicle_no>", "<vehicle_model>".
    Then The api user sends a PATCH request and saves the returned response.
    And API user verifies that updateId in response body is the same as "<id>" in request body


    Examples:
      | id  | vehicle_no | vehicle_model |
      | 658 | VH4594     | BUGATTI  BUS  |

  Scenario Outline:  WWCAPI256 TC_06-> API_US016  It should be verified that the vehicle record requested
  to be updated via API has been updated via API.

    Given The api user constructs the baseUrl wit the "adminSuleyman" token.
    Then The api user sets "api/vehicleUpdate" path parameters.
    Then The api user prepares a PATCH request to send to the api visitorsPurposeAdd endpoint containing the information,"<id>", "<vehicle_no>", "<vehicle_model>", "<vehicle_photo>", "<manufacture_year>", "<registration_number>", "<chasis_number>", "<max_seating_capacity>", "<driver_name>", "<driver_licence>", "<driver_contact>", "<note>".
    Then The api user sends a PATCH request and saves the returned response.
    Given The api user constructs the baseUrl wit the "adminSuleyman" token.
    Then The api user sets "api/vehicleId" path parameters.
    Then The api user gets the updateId in the response body
    Then The api user prepares a POST request to send to the api visitorsPurposeid endpoint containing the information id updateId.
    Then The api user sends a POST request and saves the returned response.
    Then API user: "<id>", "<vehicle_no>", "<vehicle_model>", "<vehicle_photo>", "<manufacture_year>", "<registration_number>", " <chasis_number>", "<max_seating_capacity>", "<driver_name>", "<driver_licence>", "<driver_contact>", "<note>". confirms that it is the same.

    Examples:
      | id  | vehicle_no | vehicle_model | vehicle_photo | manufacture_year | registration_number | chasis_number | max_seating_capacity | driver_name | driver_licence | driver_contact | note |
      | 658 | VH4594     | BUGATTI BUS   | null          | 2026             | FFG-76575676787     | 523422        | 45                   | smanvr      | 258714545      | 8521479639     |      |




