

Feature: As An Administrator (Admin) I Want To Be Able To Access The Books List Via Apı Connection.

  Scenario Outline: Wwcapı-206 [Tc_01 -> Apı_Us028] Verify That A Get Request To The `/Api/bookslist ` Endpoint With Valid Authorization Returns  A 200 Status Code, A "Success" Message

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/bookslist" path parameters.
    # Api kullanicisi "/api/visitorsPurposeList" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular
    * The Api User Verifies The İnformation İn The Response Body For The Entry With The Specified <Dataındex> İndex, İncluding "<Book_Title>", "<Book_No>", "<İsbn_No>",<Subject>,<Rack_No>,<Publish>,<Author>,<Qty>,<Perunitcost>,<Postdate>,<Description>,<Available>, <İs_Active>,<Created_At> And <Updated_At>.
    # Api Kullanıcısı Response Body İcindeki <Dataındex> İndexe Sahip Olanin "<Visitors_Purpose>", "<Description>" Ve "<Created_At>" Bilgilerini Doğrular.,<Visitors_Purpose>,<Visitors_Purpose>


    Examples:
      | Dataındex | Book_Title     | Book_No                | İsbn_No             | Subject | Rack_No | Publish | Author | Qty | Dataındex | Perunitcost | Postdate | Dataındex | Description | Available | İs_Active      | Created_At | Updated_At     |
      | 0         | purpose update | came for student visit | 2025-01-06 18:12:16 | 0       | 0       | 0       | 0      | 0   | 0         | 0           | 0        | 0         | 0           | 0         | purpose update | 0          | purpose update |


  Scenario: Wwcapı-208 [Tc_02 -> Apı_Us028]  Verify That A Get Request To `/Api/Bookslist ` With İnvalid Authorization Returns A 403 Status Code And A "Failed" Message.


    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/bookslist" path parameters.
    # Api kullanicisi "/api/visitorsPurposeList" path parametrelerini olusturur
    * The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '403' ve reason phrase bilgisinin Forbidden oldugunu dogrular

