package stepdefinitions;

import config_Requirements.ConfigReader;
import hooks.HooksAPI;
import io.cucumber.java.en.Given;
import io.restassured.http.ContentType;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import org.hamcrest.Matchers;
import org.json.JSONObject;
import org.junit.Assert;
import pojos.VisitorsPurposeDeletePojo;
import utilities.API_Utilities.API_Methods;

import java.util.HashMap;

import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.delete;
import static io.restassured.RestAssured.given;
import static utilities.API_Utilities.API_Methods.fullPath;

public class API_Stepdefinitions {

    Response response;
    JsonPath jsonPath;
    String exceptionMesaj;
    JSONObject jsonObjectRequestBody;
    HashMap<String, Object> hashMapRequestBody;
    VisitorsPurposeDeletePojo requestBody;

    @Given("The api user constructs the base url with the {string} token.")
    public void the_api_user_constructs_the_base_url_with_the_token(String userType) {
        HooksAPI.setUpApi(userType);
    }

    @Given("The api user sets {string} path parameters.")
    public void the_api_user_sets_path_parameters(String pathParam) {
        API_Methods.pathParam(pathParam);
    }

    @Given("The api user sends a GET request and saves the returned response.")
    public void the_api_user_sends_a_get_request_and_saves_the_returned_response() {
        response = given()
                .spec(spec)
                .when()
                .get(fullPath);

        response.prettyPrint();
    }

    @Given("The api user verifies that the status code is {int}.")
    public void the_api_user_verifies_that_the_status_code_is(int code) {
        response.then()
                .assertThat()
                .statusCode(code);
    }

    @Given("The api user verifies that the {string} information in the response body is {string}.")
    public void the_api_user_verifies_that_the_information_in_the_response_body_is(String key, String value) {
        response.then()
                .assertThat()
                .body(key, Matchers.equalTo(value));
    }

    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {string}, {string} and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(int dataIndex, String visitors_purpose, String description, String created_at) {
        jsonPath = response.jsonPath();

        Assert.assertEquals(visitors_purpose, jsonPath.getString("lists[" + dataIndex + "].visitors_purpose"));
        Assert.assertEquals(description, jsonPath.getString("lists[" + dataIndex + "].description"));
        Assert.assertEquals(created_at, jsonPath.getString("lists[" + dataIndex + "].created_at"));
    }

    @Given("The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.")
    public void the_api_user_sends_a_get_request_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_reason_phrase_forbidden() {
        try {
            response = given()
                    .spec(spec)
                    .when()
                    .get(fullPath);
        } catch (Exception e) {
            exceptionMesaj = e.getMessage();
        }

        System.out.println("exceptionMesaj : " + exceptionMesaj);
        Assert.assertEquals(ConfigReader.getProperty("unauthorizedExceptionMessage", "api"), exceptionMesaj);
    }

    @Given("The api user prepares a POST request to send to the api visitorsPurposeid endpoint containing the information {int}.")
    public void the_api_user_prepares_a_post_request_to_send_to_the_api_visitors_purposeid_endpoint_containing_the_information(int id) {
        jsonObjectRequestBody = new JSONObject();
        jsonObjectRequestBody.put("id", id);

        System.out.println("Post Body : " + jsonObjectRequestBody);
    }

    @Given("The api user sends a POST request and saves the returned response.")
    public void the_api_user_sends_a_post_request_and_saves_the_returned_response() {
        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(jsonObjectRequestBody.toString())
                .post(fullPath);

        response.prettyPrint();
    }

    @Given("The api user verifies that the data in the response body includes {string}, {string}, {string} and {string}.")
    public void the_api_user_verifies_that_the_data_in_the_response_body_includes_and(String id, String visitors_purpose, String description, String created_at) {
        response.then()
                .assertThat()
                .body("lists.id", Matchers.equalTo(id),
                        "lists.visitors_purpose", Matchers.equalTo(visitors_purpose),
                        "lists.description", Matchers.equalTo(description),
                        "lists.created_at", Matchers.equalTo(created_at));
    }

    @Given("The api user prepares a post request that does not contain data to the api visitorsPurposeid endpoint.")
    public void the_api_user_prepares_a_post_request_that_does_not_contain_data_to_the_api_visitors_purposeid_endpoint() {
        jsonObjectRequestBody = new JSONObject();
    }

    @Given("The api user prepares a POST request to send to the api visitorsPurposeAdd endpoint containing the information {string} and {string}.")
    public void the_api_user_prepares_a_post_request_to_send_to_the_api_visitors_purpose_add_endpoint_containing_the_information_and(String visitors_purpose, String description) {
        jsonObjectRequestBody = new JSONObject();
        jsonObjectRequestBody.put("visitors_purpose", visitors_purpose);
        jsonObjectRequestBody.put("description", description);

        System.out.println("Post Body : " + jsonObjectRequestBody);
    }

    @Given("The api user prepares a post request that does not contain data to the api visitorsPurposeAdd endpoint.")
    public void the_api_user_prepares_a_post_request_that_does_not_contain_data_to_the_api_visitors_purpose_add_endpoint() {
        jsonObjectRequestBody = new JSONObject();
    }

    @Given("The api user prepares a POST request to send to the api visitorsPurposeAdd endpoint containing the information {string}.")
    public void the_api_user_prepares_a_post_request_to_send_to_the_api_visitors_purpose_add_endpoint_containing_the_information(String description) {
        jsonObjectRequestBody = new JSONObject();
        jsonObjectRequestBody.put("description", description);

        System.out.println("Post Body : " + jsonObjectRequestBody);
    }

    @Given("The api user prepares a PATCH request to send to the api visitorsPurposeUpdate endpoint containing the information {int}, {string} and {string}.")
    public void the_api_user_prepares_a_patch_request_to_send_to_the_api_visitors_purpose_update_endpoint_containing_the_information_and(int id, String visitors_purpose, String description) {
        hashMapRequestBody = new HashMap<>();
        hashMapRequestBody.put("id", id);
        hashMapRequestBody.put("visitors_purpose", visitors_purpose);
        hashMapRequestBody.put("description", description);

        System.out.println("Patch Body : " + hashMapRequestBody);
    }

    @Given("The api user sends a PATCH request and saves the returned response.")
    public void the_api_user_sends_a_patch_request_and_saves_the_returned_response() {
        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(hashMapRequestBody)
                .patch(fullPath);

        response.prettyPrint();
    }

    @Given("The api user verifies that the updateid information in the response body is the same as the id information in the request body.")
    public void the_api_user_verifies_that_the_updateid_information_in_the_response_body_is_the_same_as_the_id_information_in_the_request_body() {
        Assert.assertEquals(hashMapRequestBody.get("id"), response.as(HashMap.class).get("updatedId"));
    }

    @Given("The api user prepares a PATCH request to send to the api visitorsPurposeUpdate endpoint containing the information {string} and {string}.")
    public void the_api_user_prepares_a_patch_request_to_send_to_the_api_visitors_purpose_update_endpoint_containing_the_information_and(String visitors_purpose, String description) {
        hashMapRequestBody = new HashMap<>();
        hashMapRequestBody.put("visitors_purpose", visitors_purpose);
        hashMapRequestBody.put("description", description);

        System.out.println("Patch Body : " + hashMapRequestBody);
    }

    @Given("The api user sends a PATCH request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.")
    public void the_api_user_sends_a_patch_request_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_reason_phrase_forbidden() {
        try {
            response = given()
                    .spec(spec)
                    .contentType(ContentType.JSON)
                    .when()
                    .body(hashMapRequestBody)
                    .patch(fullPath);
        } catch (Exception e) {
            exceptionMesaj = e.getMessage();
        }

        System.out.println("exceptionMesaj : " + exceptionMesaj);
        Assert.assertEquals(ConfigReader.getProperty("unauthorizedExceptionMessage", "api"), exceptionMesaj);
    }

    @Given("The api user verifies visitors_purpose as {string}")
    public void the_api_user_verifies_visitors_purpose_as(String visitors_purpose) {
        response.then()
                .assertThat()
                .body("lists.visitors_purpose", Matchers.equalTo(visitors_purpose));
    }

    @Given("The api user prepares a DELETE request to send to the api visitorsPurposeDelete endpoint containing the information {int}.")
    public void the_api_user_prepares_a_delete_request_to_send_to_the_api_visitors_purpose_delete_endpoint_containing_the_information(int id) {
        requestBody = new VisitorsPurposeDeletePojo(id);

        System.out.println("Delete Body : " + requestBody);
    }

    @Given("The api user sends a DELETE request and saves the returned response.")
    public void the_api_user_sends_a_delete_request_and_saves_the_returned_response() {
        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(requestBody)
                .delete(fullPath);

        response.prettyPrint();
    }

    @Given("The api user verifies that the Deletedid information in the response body is the same as the id information in the request body.")
    public void the_api_user_verifies_that_the_deletedid_information_in_the_response_body_is_the_same_as_the_id_information_in_the_request_body() {
        jsonPath = response.jsonPath();

        Assert.assertEquals(requestBody.getId(), jsonPath.getInt("DeletedId"));
    }

    @Given("The api user sends a DELETE request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.")
    public void the_api_user_sends_a_delete_request_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_reason_phrase_forbidden() {
        try {
            response = given()
                    .spec(spec)
                    .contentType(ContentType.JSON)
                    .when()
                    .body(requestBody)
                    .delete(fullPath);
        } catch (Exception e) {
            exceptionMesaj = e.getMessage();
        }

        System.out.println("exceptionMesaj : " + exceptionMesaj);
        Assert.assertEquals(ConfigReader.getProperty("unauthorizedExceptionMessage", "api"), exceptionMesaj);
    }

    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {string}, {string}, {string}, {string}, {string} and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(int dataIndex, String staff_id , String student_session_id, String source, String purpose, String name, String email) {

        jsonPath = response.jsonPath();

        Assert.assertNull(jsonPath.get("lists[" + dataIndex + "].staff_id"));
        Assert.assertNull(jsonPath.get("lists[" + dataIndex + "].student_session_id"));
        Assert.assertNull(jsonPath.get("lists[" + dataIndex + "].source"));
        Assert.assertEquals(purpose, jsonPath.getString("lists[" + dataIndex + "].purpose"));
        Assert.assertEquals(name, jsonPath.getString("lists[" + dataIndex + "].name"));
        Assert.assertNull(jsonPath.get("lists[" + dataIndex + "].email"));
    }



    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {string}, {string},{string}, {string}, {string}, {string} and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(int dataIndex, String student_id, String current_email, String current_phone, String occupation, String address, String photo, String created_at) {

        jsonPath = response.jsonPath();

        Assert.assertEquals(student_id, jsonPath.getString("lists[" + dataIndex + "].student_id"));
        Assert.assertEquals(current_email, jsonPath.getString("lists[" + dataIndex + "].current_email"));
        Assert.assertEquals(current_phone, jsonPath.getString("lists[" + dataIndex + "].current_phone"));
        Assert.assertEquals(current_phone, jsonPath.getString("lists[" + dataIndex + "].current_phone"));
        Assert.assertEquals(occupation, jsonPath.getString("lists[" + dataIndex + "].occupation"));
        Assert.assertEquals(address, jsonPath.getString("lists[" + dataIndex + "].address"));
        Assert.assertNull(jsonPath.get("lists[" + dataIndex + "].photo"));
        Assert.assertEquals(created_at, jsonPath.getString("lists[" + dataIndex + "].created_at"));

    }

    @Given("The api user verifies that the data in the response body includes {string}, {string}, {string}, {string}, {string}, {string} and {string}.")
    public void the_api_user_verifies_that_the_data_in_the_response_body_includes_and(String id, String staff_id, String student_session_id, String source, String purpose, String name, String email) {
        response.then().assertThat()
                .body("lists.id", Matchers.equalTo(id),
                        "lists.staff_id", Matchers.equalTo(staff_id),
                        "lists.student_session_id", Matchers.blankOrNullString(),
                        "lists.source", Matchers.blankOrNullString(),
                        "lists.purpose", Matchers.equalTo((purpose)+" "),
                        "lists.name", Matchers.equalTo(name),
                        "lists.email", Matchers.blankOrNullString());
    }

    @Given("The api user prepares a POST request to send to the api visitorsAdd endpoint containing the information {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string} and {string}.")
    public void the_api_user_prepares_a_post_request_to_send_to_the_api_visitors_add_endpoint_containing_the_information_and(String purpose, String name, String contact, String id_proof, String no_of_people, String date, String in_time, String out_time, String note) {

        jsonObjectRequestBody=new JSONObject();
        jsonObjectRequestBody.put("purpose",purpose);
        jsonObjectRequestBody.put("name",name);
        jsonObjectRequestBody.put("contact",contact);
        jsonObjectRequestBody.put("id_proof",id_proof);
        jsonObjectRequestBody.put("no_of_people",no_of_people);
        jsonObjectRequestBody.put("date",date);
        jsonObjectRequestBody.put("in_time",in_time);
        jsonObjectRequestBody.put("out_time",out_time);
        jsonObjectRequestBody.put("note",note);

        System.out.println(jsonObjectRequestBody);

    }

    @Given("The api user prepares a POST request to send to the api visitorsAdd endpoint containing the information {string}, {string} and {string}.")
    public void the_api_user_prepares_a_post_request_to_send_to_the_api_visitors_add_endpoint_containing_the_information_and(String purpose, String name, String contact) {
        jsonObjectRequestBody=new JSONObject();
        jsonObjectRequestBody.put("purpose",purpose);
        jsonObjectRequestBody.put("name",name);
        jsonObjectRequestBody.put("contact",contact);
    }

    @Given("The api user prepares a PATCH request to send to the api visitorsUpdate endpoint containing the information {int}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string} and {string}")
    public void the_api_user_prepares_a_patch_request_to_send_to_the_api_visitors_update_endpoint_containing_the_information_id_and(int id, String purpose, String name, String contact, String id_proof, String no_of_people, String date, String in_time, String out_time, String note) {
        hashMapRequestBody = new HashMap<>();
        hashMapRequestBody.put("id",id);
        hashMapRequestBody.put("purpose",purpose);
        hashMapRequestBody.put("name",name);
        hashMapRequestBody.put("contact",contact);
        hashMapRequestBody.put("id_proof",id_proof);
        hashMapRequestBody.put("no_of_people",no_of_people);
        hashMapRequestBody.put("date",date);
        hashMapRequestBody.put("in_time",in_time);
        hashMapRequestBody.put("out_time",out_time);
        hashMapRequestBody.put("note",note);

        System.out.println(hashMapRequestBody);
    }

    @Given("The api user prepares a PATCH request to send to the api visitorsUpdate endpoint containing the information {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string} and {string}.")
    public void the_api_user_prepares_a_patch_request_to_send_to_the_api_visitors_update_endpoint_containing_the_information_and(String purpose, String name, String contact, String id_proof, String no_of_people, String date, String in_time, String out_time, String note) {
        hashMapRequestBody = new HashMap<>();
        hashMapRequestBody.put("purpose",purpose);
        hashMapRequestBody.put("name",name);
        hashMapRequestBody.put("contact",contact);
        hashMapRequestBody.put("id_proof",id_proof);
        hashMapRequestBody.put("no_of_people",no_of_people);
        hashMapRequestBody.put("date",date);
        hashMapRequestBody.put("in_time",in_time);
        hashMapRequestBody.put("out_time",out_time);
        hashMapRequestBody.put("note",note);

        System.out.println(hashMapRequestBody);


    }

    @Given("The api user prepares a patch request that does not contain data to the api visitorsUpdate endpoint.")
    public void the_api_user_prepares_a_patch_request_that_does_not_contain_data_to_the_api_visitors_update_endpoint() {

        hashMapRequestBody=new HashMap<>();
    }

    @Given("The api user prepares a POST request to send to the api visitorsid endpoint containing the information {int}.")
    public void the_api_user_prepares_a_post_request_to_send_to_the_api_visitorsid_endpoint_containing_the_information(int id) {
        hashMapRequestBody = new HashMap<>();
        hashMapRequestBody.put("id",id);
    }
    @Given("The api user verifies visitorsId as {string}")
    public void the_api_user_verifies_visitors_id_as(String updatedId) {

        Assert.assertEquals(hashMapRequestBody.get("id"), response.as(HashMap.class).get("updatedId"));

    }

    @Given("The api user sends a POST requestt and saves the returned response.")
    public void the_api_user_sends_a_post_requestt_and_saves_the_returned_response() {
        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(hashMapRequestBody)
                .post(fullPath);

        response.prettyPrint();
    }








}


