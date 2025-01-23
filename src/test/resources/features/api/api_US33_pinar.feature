Feature: API_US33 As an administrator (admin), I want to be able to access the Visitor List via API connection.

@US
  Scenario Outline: TC_01 -> API_US33 Verify that a GET request to `/api/visitorsList` with valid authorization returns a 200 status code and a "Success" message and the staff_id, student_session_id, source, purpose, name and email fields for id (x) in the response body.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/visitorsList" path parameters.
    # Api kullanicisi "/api/visitorsList" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular
    * The api user verifies the information in the response body for the entry with the specified <dataIndex> index, including "<staff_id>", "<student_session_id>", "<source>", "<purpose>", "<name>" and "<email>".
    # Api kullanıcısı response body icindeki <dataIndex> indexe sahip olanin <staff_id>, "<student_session_id>", "<source>", "<purpose>", "<name>" and "<email>" bilgilerini doğrular.

    Examples:

      | dataIndex | staff_id | student_session_id | source  | purpose         | name  | email          |
      |0          |  null    |        null        | Online  |Kayıt            |ozlem  | ozlem@gmail.com|



  Scenario: TC_02 -> API_US33 Verify that a GET request to /api/visitorsList with invalid authorization returns a 403 status code and a
  "failed" message.

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/visitorsList" path parameters.
    # Api kullanicisi "/api/visitorsList" path parametrelerini olusturur
    * The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '403' ve reason phrase bilgisinin Forbidden oldugunu dogrular
