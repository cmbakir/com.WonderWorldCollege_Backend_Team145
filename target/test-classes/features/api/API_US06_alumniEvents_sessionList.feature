
Feature:As an administrator (admin) I want to be able to access Session List via API connection.
 @US
  Scenario Outline: Verify that a GET request to the `/api/sessionList` endpoint with valid authorization returns
  a 200 status code, a "Success" message, and the `session`, `is_active`, and `created_at`,and `updated_at` fields for ID (x)
  in the response body.

   * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
   * The api user sets "api/sessionList" path parameters.
    # Api kullanicisi "/api/visitorsPurposeList" path parametrelerini olusturur
   * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
   * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
   * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular
   * The api user verifies the information in the response body for the entry with the specified <dataIndex> index, including "<session>", "<is_active>" , "<created_at>" and "<updated_at>".
    # Api kullanıcısı response body icindeki <dataIndex> indexe sahip olanin "<session>", "<is_active>" ,"<created_at>" ve "<updated_at>" bilgilerini doğrular.

   Examples:
     | dataIndex | session | is_active| created_at          | updated_at |
     | 1         | 2017-18 | no       | 2017-04-20 06:41:37 | 0000-00-00 |

 @US
 Scenario: Verify that a GET request to /api/sessionList with invalid authorization returns a 403 status code and a
 "failed" message.

  * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
  * The api user sets "api/sessionList" path parameters.
    # Api kullanicisi "api/sessionList" path parametrelerini olusturur
  * The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '403' ve reason phrase bilgisinin Forbidden oldugunu dogrular


  # Examples:
   | dataIndex| title                    |event_for|session_id|class_id|section            |from_date          |to_date            |note|photo|is_active|event_notification_message|show_onwebsite|created_at           |
   | 1        | Reunion For 2020-21 Batch| class   |15        |1       |[\"1\",\"2\",\"3\"]|2021-03-07 00:00:00|2021-03-10 00:00:00|null|null   | 0     |  null                    |   0          | 2021-03-23 06:53:47 |