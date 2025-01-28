

Feature: As An Administrator (Admin) I Want To Be Able To Access The Books List Via Apı Connection.

  Scenario Outline: Wwcapı-206 [Tc_01 -> Apı_Us028] WWCAPI-213 [TC_03 -> API_US029] Verify That A Get Request To The `/Api/bookslist ` Endpoint With Valid Authorization Returns  A 200 Status Code, A "Success" Message

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/bookslist" path parameters.
    * The api user sends a GET request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Success".
    * The Api User Verifies The İnformation İn The Response Body For booklist The Entry With The Specified <dataIndex> İndex, İncluding <book_title>, <book_no>, <isbn_no>, <subject>, <rack_no>, <publish>, <author>, <qty>, <perunitcost>, <postdate>, <description>, <available>, <is_active>, <created_at> And <updated_at>.


    Examples:
      | dataIndex | book_title    | book_no | isbn_no | subject | rack_no | publish       | author        | qty | perunitcost | postdate   | description                                                                                                                                 | available | is_active | created_at          | updated_at |
      | 0         | The geography | 788789  |         |         | 119     | Barbara Bando | Barbara Bando | 75  | 12.00       | 2022-05-04 | The duo dump her in a nearby river after a failed attempt to hang her. Tonya survives, and the two men are arrested by Sheriff Ozzie Walls. | yes       | no        | 2023-10-03 01:42:32 | null       |


  Scenario: Wwcapı-208 [Tc_02 -> Apı_Us028]  Verify That A Get Request To `/Api/Bookslist ` With İnvalid Authorization Returns A 403 Status Code And A "Failed" Message.

    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/bookslist" path parameters.
    * The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.


