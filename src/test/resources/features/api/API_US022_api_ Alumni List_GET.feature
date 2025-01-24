
Feature: As an administrator (admin) I want to be able to access Alumni List via API connection.


  Scenario Outline: Verify that a GET request to the `/api/alumniList` endpoint with valid authorization returns
  a 200 status code, a "Success" message, and the `student_id`, `current_email`, `current_phone`, `occupation`, `occupation`, `address`, `photo` and `created_at` fields for ID (x)
  in the response body.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/alumniList" path parameters.
    # Api kullanicisi "/api/alumniList" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular
    * The api user verifies the information in the response body for the entry with the specified <dataIndex> index, including "<student_id>", "<current_email>","<current_phone>", "<occupation>", "<address>", "<photo>" and "<created_at>".
    # Api kullanıcısı response body icindeki <dataIndex> indexe sahip olanin "<student_id>", "<current_email>", "<current_phone>", "<occupation>","<address>", "<photo>" ve "<created_at>" bilgilerini doğrular.

    Examples:
      | dataIndex | student_id       | current_email   | current_phone    | occupation     |   address         |  photo         |created_at |
      | 0         | 25               |                 | 015209847256   |                    |                 |    null        |2025-01-05 18:10:28 |

@US
  Scenario: Verify that a GET request to /api/alumniList with invalid authorization returns a 403 status code and a
  "failed" message.

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/alumniList" path parameters.
    # Api kullanicisi "api/alumniList" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
     * The api user verifies that the status code is 403.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "failed".