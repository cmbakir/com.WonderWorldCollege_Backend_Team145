Feature: WWCAPI-6 API_US039 As an administrator (admin), I want to be able to access the Notice information of the user with the given id via API connection.

  Scenario Outline: WWC-106 TC_01 -> API_US039 Successful Response with Valid Authorization and ID
    * The api user constructs the base url with the "adminAhmetEmail" token.
    * The api user sets "api/getNoticeById" path parameters.
    * The api user prepares a POST request to send to the api getNoticeById endpoint containing the information <id>.
    * The api user sends a POST request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Success".
    * The api user verifies that the data in the response body includes "<id>" "<type>" "<slug>", "<url>", "<title>", "<date>", "<event_start>", "<event_end>", "<event_venue>", "<description>", "<is_active>" and "<created_at>".

    Examples:
      | id  | | type  | slug                    | url                         | title                   | date       | event_start | event_end | | event_venue   || description          | | is_active          | | created_at          |
      | 586 | | notice| sports-day-announcement | read/sports-day-announcement| Sports Day Announcement | 2024-12-30 | null        | null      | | null          || Sports Day will be held on April 12th on the school grounds. Students are encouraged to participate in various events and cheer for their teams. This day aims to promote teamwork, healthy competition, and physical fitness. Please ensure your child wears comfortable sports attire and brings a water bottle. Let’s come together and make this day unforgettable!| | no | | 2025-01-01 10:02:03 |


  Scenario: WWC-107 TC_02 -> API_US039 Missing or Invalid ID with Valid Authorization
    * The api user constructs the base url with the "adminAhmetEmail" token.
    * The api user sets "api/getNoticeById" path parameters.
    * The api user prepares a post request that does not contain data to the api getNoticeById endpoint.
    * The api user sends a POST request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id or wrong id.".

  Scenario Outline: WWC-108 TC_03 -> API_US039 Response with Invalid Authorization
    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/getNoticeById" path parameters.
    * The api user prepares a POST request to send to the api getNoticeById endpoint containing the information <id>.
    * The api user sends a POST request and saves the returned response.
    * The api user verifies that the status code is 403.
    * The api user verifies that the "message" information in the response body is "You do not have authorization or token error".

    Examples:
      | id   |
      | 589 |







