

Feature: WWCAPI77 API US013 As an administrator (admin) I want to be able to access the Vehicle List via API connection.

  Scenario: WWCAPI204 TC_01 -> API_US013 When a GET request is sent to /api/vehicleList endpointwith valid authorization information,it should be verified that the status codereturned is 200 and the response message is “Success”.

    Given The api user constructs the baseUrl wit the "adminSuleyman" token.
    Then The api user sets "api/vehicleList" path parameters.
    Then The api user sends a GET request and saves the returned response.
    Then The user verifies that the status code is 200.
    And The api user verifies that "message" information in the response body is "Success".


  Scenario: WWCAPI205 TC_02 -> API_US013 It should be verified that when a GET request is sent to the /api/vehicleList endpoint with invalid authorization information, the status code returned is 403 and the response message is “failed”.


    Given The api user constructs the baseUrl wit the "invalid" token.
    Then The api user sets "api/vehicleList" path parameters.
    Then The api user sends a GET request and saves the returned response.
    Then The user verifies that the status code is 403.
    And The api user verifies that "message" information in the response body is "failed".

  Scenario Outline:WWCAPI206 TC_03 -> API_US013 The information
  (vehicle_no, vehicle_model, vehicle_photo,manufacture_year, registration_number
  ,chasis_number, max_seating_capacity, driver_name, driver_licence, driver_contact
  , note, created_at)in the body of id(x) should be verified.


    Given The api user constructs the baseUrl wit the "adminSuleyman" token.
    Then The api user sets "api/vehicleList" path parameters.
    Then The api user sends a GET request and saves the returned response.
    Then The user verifies that the status code is 200.
    Then The api user verifies that "message" information in the response body is "Success".
    And The api user verifies the information in the response body for the entry with the specified <dataIndex> index, including "<id>", "<vehicle_no>", "<vehicle_model>", "<vehicle_photo>", "<manufacture_year>", "<registration_number>", "<chasis_number>", "<max_seating_capacity>", "<driver_name>", "<driver_licence>", "<driver_contact>", "<note>", and "<created_at>".

    Examples:
      | dataIndex | id  | vehicle_no | vehicle_model | vehicle_photo | manufacture_year | registration_number | chasis_number | max_seating_capacity | driver_name | driver_licence | driver_contact | note | created_at         |
      |    0      | 647 | VH4584     | Ford CAB      | null          | 2015             | FFG-76575676787     | 523422        | 50                   | Jasper      | 258714545      | 8521479630     |      | 2025-01-09 10:26:37|







