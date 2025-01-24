
  Feature:As an administrator (admin), I want to be able to access alumni events information (between the specified start date and end date) via API connection.
     @US
     Scenario Outline: Verify that a POST request to ` /api/alumniEventsByDateRange endpoint` with valid authorization and correct data

      * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
      * The api user sets "api/alumniEventsByDateRange" path parameters.
    # Api kullanicisi "api/vapi/alumniEventsByDateRange" path parametrelerini olusturur
      * The api user prepares a POST request to send to the api alumniEventsByDateRange endpoint containing the information "<start>", "<end>" .
    # Api kullanicisi api alumniEventsByDateRange endpointine gondermek icin "<start>","<end>"  bilgilerini iceren bir post request hazirlar
      * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
      * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
      * The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular

       Examples:
       |start              | end               |
       |2021-01-01 00:00:00|2021-05-01 23:59:00|




    @US
    Scenario: Verify that a POST request to `/api/alumniEventsByDateRange` without data and valid authorization returns a 203
    status code and a "No information or missing information. Please check your input data." message in the response body.

      * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
      * The api user sets "api/alumniEventsByDateRange" path parameters.
    # Api kullanicisi "api/visitorsPurposeAdd" path parametrelerini olusturur
      * The api user prepares a post request that does not contain data to the api alumniEventsByDateRange endpoint.
    # Api kullanicisi api visitorsPurposeAdd endpointine data icermeyen bir post request hazirlar
      * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
      * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
      * The api user verifies that the "message" information in the response body is "No information or missing information. Please check your input data.".
    # Api kullanicisi response bodydeki message bilgisinin "No information or missing information. Please check your input data." oldugunu dogrular


    Scenario Outline: Verify that a POST request to `/api/alumniEventsByDateRange` with invalid authorization and data
    (`start`, `end`) returns a 403 status code and a "You do not have authorization or token error"
    message in the response body.

      * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
      * The api user sets "api/alumniEventsByDateRange" path parameters.
    # Api kullanicisi "api/alumniEventsByDateRange" path parametrelerini olusturur
      * The api user prepares a POST request to send to the api alumniEventsByDateRange endpoint containing the information "<start>" and "<end>".
    # Api kullanicisi api visitorsPurposeAdd endpointine gondermek icin "<start>" ve "<end>" bilgilerini iceren bir post request hazirlar
      * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
      * The api user verifies that the status code is 403.
    # Api kullanicisi status codeun 403 oldugunu dogrular
      * The api user verifies that the "message" information in the response body is "You do not have authorization or token error".
    # Api kullanicisi response bodydeki message bilgisinin "You do not have authorization or token error" oldugunu dogrular

      Examples:
        | start            | end|
        | 01-01-2021       |    |


      * The api user verifies the information in the response body for the entry with the specified <dataIndex> index, including "<title>", "<event_for>" , "<session_id>" , "<class_id>","<section>","<from_date>","<to_date>","<note>","<photo>","<is_active>","<event_notification_message>","<show_onwebsite>","<created_at>" .
    # Api kullanıcısı response body icindeki <dataIndex> indexe sahip olanin "<title>", "<event_for>" , "<session_id>" , "<class_id>","<section>","<from_date>","<to_date>","<note>","<photo>","<is_active>","<event_notification_message>","<show_onwebsite>","<created_at>"  bilgilerini doğrular.
