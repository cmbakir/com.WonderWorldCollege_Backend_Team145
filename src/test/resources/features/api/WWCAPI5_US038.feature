Feature: As an administrator (admin) I want to be able to access the Notice List via API connection.
  @notice
  Scenario Outline: Verify that a GET request to the /api/getNotice endpoint with valid authorization
    * The api user constructs the base url with the "admin2" token.
    * The api user sets "api/getNotice" path parameters.
    * The api user sends a GET request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Success".
    * The api user verifies the information in the response body for the entry with the specified <dataIndex> index, including "<type>" "<slug>", "<url>", "<title>", "<date>", "<event_start>", "<event_end>", "<event_venue>", "<description>", "<is_active>" and "<created_at>".

    Examples:

      | type  | slug                    | url                         | title                   | date       | event_start | event_end | | event_venue   || description          | | is_active          | | created_at          | | dataIndex          |
      | notice| sports-day-announcement | read/sports-day-announcement| Sports Day Announcement | 2024-12-30 | null        | null      | | null          || Sports Day will be held on April 12th on the school grounds. Students are encouraged to participate in various events and cheer for their teams. This day aims to promote teamwork, healthy competition, and physical fitness. Please ensure your child wears comfortable sports attire and brings a water bottle. Let’s come together and make this day unforgettable!| | no | | 2025-01-01 10:02:03 | | 0 |


  Scenario: Verify that a GET request to /api/getNotice with invalid authorization
    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/getNotice" path parameters.
    * The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.