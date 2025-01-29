package stepdefinitions;

import com.fasterxml.jackson.core.JsonProcessingException;
import config_Requirements.ConfigReader;
import hooks.HooksAPI;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;

import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;


import io.cucumber.java.en.*;

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

    int addId;
    int updateId;
    int DeletedId;
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

        //response.prettyPrint();
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
        Assert.assertEquals(hashMapRequestBody.get("id"), response.as(HashMap.class).get("updateId"));
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

    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_data_ındex_index_including(Integer dataIndex, String staff_id, String subject_id, String question_type, String level, String class_id, String section_id, String class_section_id, String question, String opt_a, String opt_b, String opt_c, String opt_d, String opt_e, String correct, String descriptive_word_limit, String created_at, String updated_at, String name, String code, String class_name, String section_name) {

        jsonPath = response.jsonPath();

        Assert.assertEquals(staff_id, jsonPath.getString("lists[" + dataIndex + "].staff_id"));
        Assert.assertEquals(subject_id, jsonPath.getString("lists[" + dataIndex + "].subject_id"));
        Assert.assertEquals(question_type, jsonPath.getString("lists[" + dataIndex + "].question_type"));
        Assert.assertEquals(level, jsonPath.getString("lists[" + dataIndex + "].level"));
        Assert.assertEquals(class_id, jsonPath.getString("lists[" + dataIndex + "].class_id"));
        Assert.assertEquals(section_id, jsonPath.getString("lists[" + dataIndex + "].section_id"));
        Assert.assertNull(jsonPath.get("lists[" + dataIndex + "].class_section_id"));
        Assert.assertEquals(question, jsonPath.getString("lists[" + dataIndex + "].question"));
        Assert.assertEquals(opt_a, jsonPath.getString("lists[" + dataIndex + "].opt_a"));
        Assert.assertEquals(opt_b, jsonPath.getString("lists[" + dataIndex + "].opt_b"));
        Assert.assertEquals(opt_c, jsonPath.getString("lists[" + dataIndex + "].opt_c"));
        Assert.assertEquals(opt_d, jsonPath.getString("lists[" + dataIndex + "].opt_d"));
        Assert.assertEquals(opt_e, jsonPath.getString("lists[" + dataIndex + "].opt_e"));
        Assert.assertEquals(correct, jsonPath.getString("lists[" + dataIndex + "].correct"));
        Assert.assertEquals(descriptive_word_limit, jsonPath.getString("lists[" + dataIndex + "].descriptive_word_limit"));
        Assert.assertEquals(created_at, jsonPath.getString("lists[" + dataIndex + "].created_at"));
        Assert.assertNull(jsonPath.get("lists[" + dataIndex + "].updated_at"));
        Assert.assertEquals(name, jsonPath.getString("lists[" + dataIndex + "].name"));
        Assert.assertEquals(code, jsonPath.getString("lists[" + dataIndex + "].code"));
        Assert.assertEquals(class_name, jsonPath.getString("lists[" + dataIndex + "].class_name"));
        Assert.assertEquals(section_name, jsonPath.getString("lists[" + dataIndex + "].section_name"));
    }

    @Given("The api user prepares a POST request to send to the api questionDetailsById endpoint containing the information {int}.")
    public void the_api_user_prepares_a_post_request_to_send_to_the_api_question_details_by_ıd_endpoint_containing_the_information(Integer id) {
        jsonObjectRequestBody = new JSONObject();
        jsonObjectRequestBody.put("id", id);
        System.out.println("Post Body : " + jsonObjectRequestBody);

    }

    @Given("The api user verifies that the data in the response body includes {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string},  {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}.")
    public void the_api_user_verifies_that_the_data_in_the_response_body_includes(String id, String staff_id, String subject_id, String question_type, String level, String class_id, String section_id, String class_section_id, String question, String opt_a, String opt_b, String opt_c, String opt_d, String opt_e, String correct, String descriptive_word_limit, String created_at, String updated_at, String name, String code, String class_name, String section_name) {
        response.then()
                .assertThat()
                .body("lists.id", Matchers.equalTo(id),
                        "lists.staff_id", Matchers.equalTo(staff_id),
                        "lists.subject_id", Matchers.equalTo(subject_id),
                        "lists.question_type", Matchers.equalTo(question_type),
                        "lists.level", Matchers.equalTo(level),
                        "lists.class_id", Matchers.equalTo(class_id),
                        "lists.section_id", Matchers.equalTo(section_id),
                        "lists.class_section_id", Matchers.nullValue(),
                        "lists.question", Matchers.equalTo(question),
                        "lists.opt_a", Matchers.equalTo(opt_a),
                        "lists.opt_b", Matchers.equalTo(opt_b),
                        "lists.opt_c", Matchers.equalTo(opt_c),
                        "lists.opt_d", Matchers.equalTo(opt_d),
                        "lists.opt_e", Matchers.equalTo(opt_e),
                        "lists.correct", Matchers.equalTo(correct),
                        "lists.descriptive_word_limit", Matchers.equalTo(descriptive_word_limit),
                        "lists.created_at", Matchers.equalTo(created_at),
                        "lists.updated_at", Matchers.nullValue(),
                        "lists.name", Matchers.equalTo(name),
                        "lists.code", Matchers.equalTo(code),
                        "lists.class_name", Matchers.equalTo(class_name),
                        "lists.section_name", Matchers.equalTo(section_name)
                );
    }

    @Given("The api user prepares a post request that does not contain data to the api questionDetailsById endpoint.")
    public void the_api_user_prepares_a_post_request_that_does_not_contain_data_to_the_api_question_details_by_ıd_endpoint() {
        jsonObjectRequestBody = new JSONObject();
    }

    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {string}, {string}, {string}, {string}, {string} and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(int dataIndex, String staff_id, String student_session_id, String source, String purpose, String name, String email) {

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

    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {string}, {string} , {string} and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(int dataIndex, String session, String is_active, String created_at, String updated_at) {
        jsonPath = response.jsonPath();

        Assert.assertEquals(session, jsonPath.getString("lists[" + dataIndex + "].session"));
        Assert.assertEquals(is_active, jsonPath.getString("lists[" + dataIndex + "].is_active"));
        Assert.assertEquals(created_at, jsonPath.getString("lists[" + dataIndex + "].created_at"));
        Assert.assertEquals(updated_at, jsonPath.getString("lists[" + dataIndex + "].updated_at"));
    }

    //Meltem
    @Given("The api user prepares a POST request to send to the api alumniEventsByDateRange endpoint containing the information {string}, {string} .")
    public void the_api_user_prepares_a_post_request_to_send_to_the_api_alumni_events_by_date_range_endpoint_containing_the_information(String start, String end) {
        jsonObjectRequestBody = new JSONObject();
        jsonObjectRequestBody.put("start", start);
        jsonObjectRequestBody.put("end", end);

        System.out.println("Post Body : " + jsonObjectRequestBody);
    }

    //Meltem
    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {string}, {string} , {string} , {string},{string},{string},{string},{string},{string},{string},{string},{string},{string} .")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including(int dataIndex, String title, String event_for, String session_id, String class_id, String section, String from_date, String to_date, String note, String photo, String is_active, String event_notification_message, String show_onwebsite, String created_at) {
        Assert.assertEquals(title, jsonPath.getString("lists[" + dataIndex + "].title"));
        Assert.assertEquals(event_for, jsonPath.getString("lists[" + dataIndex + "].event_for"));
        Assert.assertEquals(session_id, jsonPath.getString("lists[" + dataIndex + "].session_id"));
        Assert.assertEquals(class_id, jsonPath.getString("lists[" + dataIndex + "].class_id"));
        Assert.assertEquals(section, jsonPath.getString("lists[" + dataIndex + "].section"));
        Assert.assertEquals(from_date, jsonPath.getString("lists[" + dataIndex + "].from_date"));
        Assert.assertEquals(to_date, jsonPath.getString("lists[" + dataIndex + "].to_date"));
        Assert.assertEquals(note, jsonPath.getString("lists[" + dataIndex + "].note"));
        Assert.assertEquals(photo, jsonPath.getString("lists[" + dataIndex + "].photo"));
        Assert.assertEquals(is_active, jsonPath.getString("lists[" + dataIndex + "].is_active"));
        Assert.assertEquals(event_notification_message, jsonPath.getString("lists[" + dataIndex + "].event_notification_message"));
        Assert.assertEquals(show_onwebsite, jsonPath.getString("lists[" + dataIndex + "].show_onwebsite"));
        Assert.assertEquals(created_at, jsonPath.getString("lists[" + dataIndex + "].created_at"));
    }


    @Given("The api user prepares a post request that does not contain data to the api alumniEventsByDateRange endpoint.")
    public void the_api_user_prepares_a_post_request_that_does_not_contain_data_to_the_api_alumni_events_by_date_range_endpoint() {
        jsonObjectRequestBody = new JSONObject();
    }

    @Given("The api user prepares a POST request to send to the api alumniEventsByDateRange endpoint containing the information {string} and {string}.")
    public void the_api_user_prepares_a_post_request_to_send_to_the_api_alumni_events_by_date_range_endpoint_containing_the_information_and(String start, String end) {
        jsonObjectRequestBody = new JSONObject();
        jsonObjectRequestBody.put("start", start);
        jsonObjectRequestBody.put("end", end);

        System.out.println("Post Body : " + jsonObjectRequestBody);
    }


    @Given("The api user verifies that the data in the response body includes {string}, {string}, {string}, {string}, {string}, {string} and {string}.")
    public void the_api_user_verifies_that_the_data_in_the_response_body_includes_and(String id, String staff_id, String student_session_id, String source, String purpose, String name, String email) {
        response.then().assertThat()
                .body("lists.id", Matchers.equalTo(id),
                        "lists.staff_id", Matchers.equalTo(staff_id),
                        "lists.student_session_id", Matchers.blankOrNullString(),
                        "lists.source", Matchers.blankOrNullString(),
                        "lists.purpose", Matchers.equalTo((purpose) + " "),
                        "lists.name", Matchers.equalTo(name),
                        "lists.email", Matchers.blankOrNullString());
    }

    @Given("The api user prepares a POST request to send to the api visitorsAdd endpoint containing the information {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string} and {string}.")
    public void the_api_user_prepares_a_post_request_to_send_to_the_api_visitors_add_endpoint_containing_the_information_and(String purpose, String name, String contact, String id_proof, String no_of_people, String date, String in_time, String out_time, String note) {

        jsonObjectRequestBody = new JSONObject();
        jsonObjectRequestBody.put("purpose", purpose);
        jsonObjectRequestBody.put("name", name);
        jsonObjectRequestBody.put("contact", contact);
        jsonObjectRequestBody.put("id_proof", id_proof);
        jsonObjectRequestBody.put("no_of_people", no_of_people);
        jsonObjectRequestBody.put("date", date);
        jsonObjectRequestBody.put("in_time", in_time);
        jsonObjectRequestBody.put("out_time", out_time);
        jsonObjectRequestBody.put("note", note);

        System.out.println(jsonObjectRequestBody);

    }


    @Given("The api user prepares a POST request to send to the api visitorsAdd endpoint containing the information {string}, {string}, {string}, {string}, {string} and {string}.")
    public void the_api_user_prepares_a_post_request_to_send_to_the_api_visitors_add_endpoint_containing_the_information_and(String id_proof, String no_of_people, String date, String in_time, String out_time, String note) {
        jsonObjectRequestBody = new JSONObject();
        jsonObjectRequestBody.put("id_proof", id_proof);
        jsonObjectRequestBody.put("no_of_people", no_of_people);
        jsonObjectRequestBody.put("date", date);
        jsonObjectRequestBody.put("in_time", in_time);
        jsonObjectRequestBody.put("out_time", out_time);
        jsonObjectRequestBody.put("note", note);
    }

    @Given("The api user prepares a PATCH request to send to the api visitorsUpdate endpoint containing the information {int}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string} and {string}")
    public void the_api_user_prepares_a_patch_request_to_send_to_the_api_visitors_update_endpoint_containing_the_information_id_and(int id, String purpose, String name, String contact, String id_proof, String no_of_people, String date, String in_time, String out_time, String note) {
        hashMapRequestBody = new HashMap<>();
        hashMapRequestBody.put("id", id);
        hashMapRequestBody.put("purpose", purpose);
        hashMapRequestBody.put("name", name);
        hashMapRequestBody.put("contact", contact);
        hashMapRequestBody.put("id_proof", id_proof);
        hashMapRequestBody.put("no_of_people", no_of_people);
        hashMapRequestBody.put("date", date);
        hashMapRequestBody.put("in_time", in_time);
        hashMapRequestBody.put("out_time", out_time);
        hashMapRequestBody.put("note", note);

        System.out.println(hashMapRequestBody);
    }

    @Given("The api user prepares a PATCH request to send to the api visitorsUpdate endpoint containing the information {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string} and {string}.")
    public void the_api_user_prepares_a_patch_request_to_send_to_the_api_visitors_update_endpoint_containing_the_information_and(String purpose, String name, String contact, String id_proof, String no_of_people, String date, String in_time, String out_time, String note) {
        hashMapRequestBody = new HashMap<>();
        hashMapRequestBody.put("purpose", purpose);
        hashMapRequestBody.put("name", name);
        hashMapRequestBody.put("contact", contact);
        hashMapRequestBody.put("id_proof", id_proof);
        hashMapRequestBody.put("no_of_people", no_of_people);
        hashMapRequestBody.put("date", date);
        hashMapRequestBody.put("in_time", in_time);
        hashMapRequestBody.put("out_time", out_time);
        hashMapRequestBody.put("note", note);

        System.out.println(hashMapRequestBody);


    }

    @Given("The api user prepares a patch request that does not contain data to the api visitorsUpdate endpoint.")
    public void the_api_user_prepares_a_patch_request_that_does_not_contain_data_to_the_api_visitors_update_endpoint() {

        hashMapRequestBody = new HashMap<>();
    }

    @Given("The api user prepares a POST request to send to the api visitorsid endpoint containing the information {int}.")
    public void the_api_user_prepares_a_post_request_to_send_to_the_api_visitorsid_endpoint_containing_the_information(int id) {
        hashMapRequestBody = new HashMap<>();
        hashMapRequestBody.put("id", id);
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


    @Given("The api user prepares a POST request to send to the api questionAdd endpoint containing the information {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string},  {string}, {string}, {string}, {string}, {string}, {string}.")
    public void the_api_user_prepares_a_post_request_to_send_to_the_api_question_add_endpoint_containing_the_information(String subject_id, String question_type, String level, String class_id, String section_id, String class_section_id, String question, String opt_a, String opt_b, String opt_c, String opt_d, String opt_e, String correct, String descriptive_word_limit) {

        jsonObjectRequestBody = new JSONObject();

        jsonObjectRequestBody.put("subject_id", subject_id);
        jsonObjectRequestBody.put("question_type", question_type);
        jsonObjectRequestBody.put("level", level);
        jsonObjectRequestBody.put("class_id", class_id);
        jsonObjectRequestBody.put("section_id", section_id);
        jsonObjectRequestBody.put("class_section_id", class_section_id);
        jsonObjectRequestBody.put("question", question);
        jsonObjectRequestBody.put("opt_a", opt_a);
        jsonObjectRequestBody.put("opt_b", opt_b);
        jsonObjectRequestBody.put("opt_c", opt_c);
        jsonObjectRequestBody.put("opt_d", opt_d);
        jsonObjectRequestBody.put("opt_e", opt_e);
        jsonObjectRequestBody.put("correct", correct);
        jsonObjectRequestBody.put("descriptive_word_limit", descriptive_word_limit);

        System.out.println("Post Body : " + jsonObjectRequestBody);
    }

    @Given("The api user prepares a post request that does not contain data to the api questionAdd endpoint.")
    public void the_api_user_prepares_a_post_request_that_does_not_contain_data_to_the_api_question_add_endpoint() {
        jsonObjectRequestBody = new JSONObject();
    }

    @Given("The api user prepares a POST request to send to the api questionAdd endpoint containing the information {string}, {string}, {string}, {string}, {string},  {string}, {string}, {string}, {string}, {string}, {string}.")
    public void the_api_user_prepares_a_post_request_to_send_to_the_api_question_add_endpoint_containing_the_information(String class_id, String section_id, String class_section_id, String question, String opt_a, String opt_b, String opt_c, String opt_d, String opt_e, String correct, String descriptive_word_limit) {
        jsonObjectRequestBody = new JSONObject();

        jsonObjectRequestBody.put("class_id", class_id);
        jsonObjectRequestBody.put("section_id", section_id);
        jsonObjectRequestBody.put("class_section_id", class_section_id);
        jsonObjectRequestBody.put("question", question);
        jsonObjectRequestBody.put("opt_a", opt_a);
        jsonObjectRequestBody.put("opt_b", opt_b);
        jsonObjectRequestBody.put("opt_c", opt_c);
        jsonObjectRequestBody.put("opt_d", opt_d);
        jsonObjectRequestBody.put("opt_e", opt_e);
        jsonObjectRequestBody.put("correct", correct);
        jsonObjectRequestBody.put("descriptive_word_limit", descriptive_word_limit);

        System.out.println("Post Body : " + jsonObjectRequestBody);
    }


    @Given("The api user prepares a POST request to send to the api questionAdd endpoint containing the information {int}.")
    public void the_api_user_prepares_a_post_request_to_send_to_the_api_question_add_endpoint_containing_the_information(Integer id) {
        jsonObjectRequestBody = new JSONObject();
        jsonObjectRequestBody.put("id", id);

        System.out.println("Post Body : " + jsonObjectRequestBody);
    }


    @Given("The api user verifies the information in the response body for the entry with the specified <dataIndex> index, including {string}, {string}, {string}, {string},{string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, assignments.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_data_ındex_index_including_assignments(String dataIndex, String class_id, String section_id, String session_id, String staff_id, String subject_group_subject_id, String subject_id, String homework_date, String submit_date, String marks, String description, String create_date, String evaluation_date, String document, String created_by, String evaluated_by, String created_at, String section, String subject_name, String subject_groups_id, String name) {

        jsonPath = response.jsonPath();
        Assert.assertEquals(dataIndex, jsonPath.getString("lists[" + dataIndex + "].dataIndex"));
        Assert.assertEquals(class_id, jsonPath.getString("lists[" + dataIndex + "].class_id"));
        Assert.assertEquals(section_id, jsonPath.getString("lists[" + dataIndex + "].section_id"));


    }


    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {string},{string},{string},{string}, {string} , {string} , {string}, {string}   ,  {string}, {string}  , {string} ,{string} {string} , {string}")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including(Integer dataIndex, String student_session_id, String id, String clagits, String section_id, String section, String admission_no, String roll_no, String admission_date, String firstname, String middlename, String lastname, String image, String mobileno, String email) {

        jsonPath = response.jsonPath();

        Assert.assertEquals(student_session_id, jsonPath.getString("lists[" + dataIndex + "].student_session_id"));
        Assert.assertEquals(id, jsonPath.getString("lists[" + dataIndex + "].id"));
        // Assert.assertEquals(class, jsonPath.getString("lists[" + dataIndex + "].class"));
        Assert.assertEquals(section_id, jsonPath.getString("lists[" + dataIndex + "].section_id"));
        Assert.assertEquals(section, jsonPath.getString("lists[" + dataIndex + "].section"));
        Assert.assertEquals(admission_no, jsonPath.getString("lists[" + dataIndex + "].admission_no"));
        Assert.assertEquals(roll_no, jsonPath.getString("lists[" + dataIndex + "].roll_no"));
        Assert.assertEquals(admission_date, jsonPath.getString("lists[" + dataIndex + "].admission_date"));
        Assert.assertEquals(firstname, jsonPath.getString("lists[" + dataIndex + "].firstname"));
        Assert.assertEquals(lastname, jsonPath.getString("lists[" + dataIndex + "].lastname"));
        // Assert.assertEquals(image, jsonPath.getString("lists[" + dataIndex + "].image"));
        Assert.assertEquals(mobileno, jsonPath.getString("lists[" + dataIndex + "].mobileno"));
        Assert.assertEquals(email, jsonPath.getString("lists[" + dataIndex + "].email"));
        Assert.assertNull(jsonPath.get("lists[" + dataIndex + "].middlename"));


    }
    //WWCAPI204 TC_01 -> API_US013 suleyman
    @Given("The api user constructs the baseUrl wit the {string} token.")
    public void the_api_user_constructs_the_base_url_wit_the_token(String userType) {

        HooksAPI.setUpApi(userType);
    }



    @When("The api user prepares a POST request to send to the api booksid endpoint containing the information {int}.")
    public void theApiUserPreparesAPOSTRequestToSendToTheApiBooksidEndpointContainingTheInformation(int id) {
        jsonObjectRequestBody = new JSONObject();
        jsonObjectRequestBody.put("id", id);

        System.out.println("Post Body : " + jsonObjectRequestBody);


    }


    @When("The api user prepares a post request that does not contain data to the api booksId endpoint.")
    public void theApiUserPreparesAPostRequestThatDoesNotContainDataToTheApiBooksIdEndpoint() {
        jsonObjectRequestBody = new JSONObject();
    }

    @When("The api user prepares a POST request to send to the api booksId endpoint containing the information {int}.")
    public void theApiUserPreparesAPOSTRequestToSendToTheApiBooksIdEndpointContainingTheInformation(int id) {
        jsonObjectRequestBody = new JSONObject();
        jsonObjectRequestBody.put("id", id);

        System.out.println("Post Body : " + jsonObjectRequestBody);
    }


    @Given("The api user prepares a POST request to send to the api booksAdd endpoint containing the information {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}.")
    public void the_api_user_prepares_a_post_request_to_send_to_the_api_books_add_endpoint_containing_the_information(String book_title, String book_no, String isbn_no, String subject, String rack_no, String publish, String author, String qty, String perunitcost, String postdate, String description) {

        jsonObjectRequestBody = new JSONObject();

        jsonObjectRequestBody.put("book_title", book_title);
        jsonObjectRequestBody.put("book_no", book_no);
        jsonObjectRequestBody.put("isbn_no", isbn_no);
        jsonObjectRequestBody.put("subject", subject);
        jsonObjectRequestBody.put("rack_no", rack_no);
        jsonObjectRequestBody.put("publish", publish);
        jsonObjectRequestBody.put("author", author);
        jsonObjectRequestBody.put("qty", qty);
        jsonObjectRequestBody.put("opt_e", perunitcost);
        jsonObjectRequestBody.put("correct", postdate);
        jsonObjectRequestBody.put("description", description);

        System.out.println("Post Body : " + jsonObjectRequestBody);
    }


    @When("The api user prepares a post request that does not contain data to the api booksAdd endpoint.")
    public void theApiUserPreparesAPostRequestThatDoesNotContainDataToTheApiBooksAddEndpoint() {
        jsonObjectRequestBody = new JSONObject();
    }

    @When("The api user prepares a POST request to send to the api booksAdd endpoint containing the information {string}, {string}, {string}, {string}, {string}, {string}.")
    public void theApiUserPreparesAPOSTRequestToSendToTheApiBooksAddEndpointContainingTheInformation(String book_title, String book_no, String isbn_no, String subject, String rack_no, String publish) {

        jsonObjectRequestBody = new JSONObject();

        jsonObjectRequestBody.put("book_title", book_title);
        jsonObjectRequestBody.put("book_no", book_no);
        jsonObjectRequestBody.put("isbn_no", isbn_no);
        jsonObjectRequestBody.put("subject", subject);
        jsonObjectRequestBody.put("rack_no", rack_no);
        jsonObjectRequestBody.put("publish", publish);

        System.out.println("Post Body : " + jsonObjectRequestBody);

    }


    @When("The api user prepares a PATCH request to send to the api booksUpdate endpoint containing the information {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string} and {string}.")
    public void theApiUserPreparesAPATCHRequestToSendToTheApiBooksUpdateEndpointContainingTheInformationAnd(String id, String book_title, String book_no, String isbn_no, String subject, String rack_no, String publish, String author, String qty, String perunitcost, String postdate, String description, String available, String is_active) {

        hashMapRequestBody = new HashMap<>();
        hashMapRequestBody.put("id", id);
        hashMapRequestBody.put("book_title", book_title);
        hashMapRequestBody.put("book_no", book_no);
        hashMapRequestBody.put("isbn_no", isbn_no);
        hashMapRequestBody.put("subject", subject);
        hashMapRequestBody.put("rack_no", rack_no);
        hashMapRequestBody.put("publish", publish);
        hashMapRequestBody.put("author", author);
        hashMapRequestBody.put("qty", qty);
        hashMapRequestBody.put("perunitcost", perunitcost);
        hashMapRequestBody.put("postdate", postdate);
        hashMapRequestBody.put("description", description);
        hashMapRequestBody.put("available", available);
        hashMapRequestBody.put("is_active", is_active);

        System.out.println("Patch Body : " + hashMapRequestBody);


    }

    @When("The Api User Verifies The İnformation İn The Response Body For booklist The Entry With The Specified {int} İndex, İncluding {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {} And {}.")
    public void theApiUserVerifiesTheInformationInTheResponseBodyForBooklistTheEntryWithTheSpecifiedIndexIncludingAnd(int dataIndex, String book_title, String book_no, String isbn_no, String subject, String rack_no, String publish, String author, String qty, String perunitcost, String postdate, String description, String available, String is_active, String created_at, String updated_at) {

        jsonPath = response.jsonPath();

        Assert.assertEquals(dataIndex, jsonPath.getInt("lists[" + dataIndex + "].id"));
        //Assert.assertEquals(dataIndex, Integer.parseInt(jsonPath.getString("id")));
        //Assert.assertEquals(dataIndex, jsonPath.getString("lists[" + dataIndex + "].dataIndex"));
        Assert.assertEquals(book_title, jsonPath.getString("lists[" + dataIndex + "].book_title"));
        Assert.assertEquals(book_no, jsonPath.getString("lists[" + dataIndex + "].book_no"));
        Assert.assertEquals(isbn_no, jsonPath.getString("lists[" + dataIndex + "].isbn_no"));
        Assert.assertEquals(subject, jsonPath.getString("lists[" + dataIndex + "].subject"));
        Assert.assertEquals(rack_no, jsonPath.getString("lists[" + dataIndex + "].rack_no"));
        Assert.assertEquals(publish, jsonPath.getString("lists[" + dataIndex + "].publish"));
        Assert.assertEquals(author, jsonPath.getString("lists[" + dataIndex + "].author"));
        Assert.assertEquals(qty, jsonPath.getString("lists[" + dataIndex + "].qty"));
        Assert.assertEquals(perunitcost, jsonPath.getString("lists[" + dataIndex + "].perunitcost"));
        Assert.assertEquals(postdate, jsonPath.getString("lists[" + dataIndex + "].postdate"));
        Assert.assertEquals(description, jsonPath.getString("lists[" + dataIndex + "].description"));
        Assert.assertEquals(available, jsonPath.getString("lists[" + dataIndex + "].available"));
        Assert.assertEquals(is_active, jsonPath.getString("lists[" + dataIndex + "].is_active"));
        Assert.assertEquals(created_at, jsonPath.getString("lists[" + dataIndex + "].created_at"));
        Assert.assertEquals(updated_at, jsonPath.getString("lists[" + dataIndex + "].updated_at"));

    }

    @When("The book api user verifies that the updateid information in the response body is the same as the id information in the request body.")
    public void theBookApiUserVerifiesThatTheUpdateidInformationInTheResponseBodyIsTheSameAsTheIdInformationInTheRequestBody() {
        // Yanıt gövdesindeki 'updateId' değerini alıyoruz ve virgülle ayırarak ilk kısmı alıyoruz
        String responseId = response.as(HashMap.class).get("updateId").toString().split(",")[0].trim(); // Sadece ID kısmını alıyoruz
        Assert.assertEquals(hashMapRequestBody.get("id"), responseId); // İstek gövdesindeki "id" ile karşılaştırıyoruz
    }


    @When("The api user prepares a patch request that does not contain data to the api booksUpdate endpoint.")
    public void theApiUserPreparesAPatchRequestThatDoesNotContainDataToTheApiBooksUpdateEndpoint() {
        hashMapRequestBody = new HashMap<>();
    }





    @Given("The api user verifies that the data in the books response body includes {string}, {string}, {string} and {string}.")
    public void the_api_user_verifies_that_the_data_in_the_books_response_body_includes_and(String id, String book_title, String book_no, String isbn_no, String subject, String rack_no, String publish, String author, String qty, String perunitcost, String postdate, String description, String available, String is_active, String created_at, String updated_at) {
        response.then()
                .assertThat()
                .body("lists.id", Matchers.equalTo(id),
                        "lists.book_title", Matchers.equalTo(book_title),
                        "lists.book_no", Matchers.equalTo(book_no),
                        "lists.isbn_no", Matchers.equalTo(isbn_no),
                        "lists.subject", Matchers.equalTo(subject),
                        "lists.rack_no", Matchers.equalTo(rack_no),
                        "lists.publish", Matchers.equalTo(publish),
                        "lists.isbn_no", Matchers.equalTo(isbn_no),
                        "lists.author", Matchers.equalTo(author),
                        "lists.qty", Matchers.equalTo(qty),
                        "lists.perunitcost", Matchers.equalTo(perunitcost),
                        "lists.postdate", Matchers.equalTo(postdate),
                        "lists.description", Matchers.equalTo(description),
                        "lists.available", Matchers.equalTo(available),
                        "lists.is_active", Matchers.equalTo(is_active),
                        "lists.created_at", Matchers.equalTo(created_at),
                        "lists.updated_at", Matchers.equalTo(updated_at));


    }




    @When("The api user prepares a DELETE request to send to the api booksDelete endpoint containing the information {int}.")
    public void theApiUserPreparesADELETERequestToSendToTheApiBooksDeleteEndpointContainingTheInformation(int id) {

        requestBody = new VisitorsPurposeDeletePojo(id);

        System.out.println("Delete Body : " + requestBody);


    }


    @When("The api user prepares a DELETE request that does not contain data to the api booksDelete endpoint.")
    public void theApiUserPreparesADELETERequestThatDoesNotContainDataToTheApiBooksDeleteEndpoint() {
        hashMapRequestBody = new HashMap<>();
    }



    @When("The api user verifies books_title as {string}")
    public void theApiUserVerifiesBooks_titleAs(String book_title) {
        response.then()
                .assertThat()
                .body("lists.book_title", Matchers.equalTo(book_title));
    }














    @Given("The api user prepares a PATCH request to send to the api questionUpdate endpoint containing the information {int}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string},  {string}, {string}, {string}, {string}, {string}, {string}")
    public void the_api_user_prepares_a_patch_request_to_send_to_the_api_question_update_endpoint_containing_the_information(int id, String subject_id, String question_type, String level, String class_id, String section_id, String class_section_id, String question, String opt_a, String opt_b, String opt_c, String opt_d, String opt_e, String correct, String descriptive_word_limit) {

        hashMapRequestBody = new HashMap<>();
        hashMapRequestBody.put("id",id);
        hashMapRequestBody.put("subject_id",subject_id);
        hashMapRequestBody.put("question_type",question_type);
        hashMapRequestBody.put("level",level);
        hashMapRequestBody.put("class_id",class_id);
        hashMapRequestBody.put("section_id",section_id);
        hashMapRequestBody.put("class_section_id",class_section_id);
        hashMapRequestBody.put("question",question);
        hashMapRequestBody.put("opt_a",opt_a);
        hashMapRequestBody.put("opt_b",opt_b);
        hashMapRequestBody.put("opt_c",opt_c);
        hashMapRequestBody.put("opt_d",opt_d);
        hashMapRequestBody.put("opt_e",opt_e);
        hashMapRequestBody.put("correct",correct);
        hashMapRequestBody.put("descriptive_word_limit",descriptive_word_limit);

        System.out.println(hashMapRequestBody);
    }

    @Given("The api user prepares a PATCH request to send to the api questionUpdate endpoint containing the information {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string},  {string}, {string}, {string}, {string}, {string}, {string}")
    public void the_api_user_prepares_a_patch_request_to_send_to_the_api_question_update_endpoint_containing_the_information(String subject_id, String question_type, String level, String class_id, String section_id, String class_section_id, String question, String opt_a, String opt_b, String opt_c, String opt_d, String opt_e, String correct, String descriptive_word_limit) {

        hashMapRequestBody = new HashMap<>();

        hashMapRequestBody.put("subject_id",subject_id);
        hashMapRequestBody.put("question_type",question_type);
        hashMapRequestBody.put("level",level);
        hashMapRequestBody.put("class_id",class_id);
        hashMapRequestBody.put("section_id",section_id);
        hashMapRequestBody.put("class_section_id",class_section_id);
        hashMapRequestBody.put("question",question);
        hashMapRequestBody.put("opt_a",opt_a);
        hashMapRequestBody.put("opt_b",opt_b);
        hashMapRequestBody.put("opt_c",opt_c);
        hashMapRequestBody.put("opt_d",opt_d);
        hashMapRequestBody.put("opt_e",opt_e);
        hashMapRequestBody.put("correct",correct);
        hashMapRequestBody.put("descriptive_word_limit",descriptive_word_limit);

        System.out.println("Patch Body : " + hashMapRequestBody);
    }

    @Given("The api user prepares a patch request that does not contain data to the api questionUpdate endpoint.")
    public void the_api_user_prepares_a_patch_request_that_does_not_contain_data_to_the_api_question_update_endpoint() {
        hashMapRequestBody=new HashMap<>();
    }

    @Given("The api user verifies level  as {string}")
    public void the_api_user_verifies_level_as(String level) {
        response.then()
                .assertThat()
                .body("lists.level", Matchers.equalTo(level));
    }

    @Given("The api user prepares a DELETE request to send to the api questionDelete endpoint containing the information {int}.")
    public void the_api_user_prepares_a_delete_request_to_send_to_the_api_question_delete_endpoint_containing_the_information(Integer id) {

        requestBody = new VisitorsPurposeDeletePojo(id);

        System.out.println("Delete Body : " + requestBody);
    }

    @Given("The api user prepares a DELETE request that does not contain data to the api questionDelete endpoint.")
    public void the_api_user_prepares_a_delete_request_that_does_not_contain_data_to_the_api_question_delete_endpoint() {
        requestBody =new VisitorsPurposeDeletePojo();
    }




    @Then("The user verifies that the status code is {int}.")
    public void the_user_verifies_that_the_status_code_is(int code) {

        response.then().assertThat().statusCode(code);
    }
    @Then("The api user verifies that {string} information in the response body is {string}.")
    public void the_api_user_verifies_that_information_in_the_response_body_is(String key, String value) {
        response.then().body(key,Matchers.equalTo(value));
    }
    @Then("The api user verifies the information in the response body for the entry with the specified {int} index, including {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(int dataIndex, String id, String vehicle_no, String vehicle_model, String vehicle_photo, String manufacture_year, String registration_number, String chasis_number, String max_seating_capacity, String driver_name, String driver_licence, String driver_contact, String note, String created_at) throws JsonProcessingException {

        response.then().assertThat()
                .body("lists[" + dataIndex + "].id",Matchers.equalTo(id),
                        "lists[" + dataIndex + "].vehicle_no",Matchers.equalTo(vehicle_no),
                        "lists[" + dataIndex + "].vehicle_model",Matchers.equalTo(vehicle_model),
                        "lists[" + dataIndex + "].vehicle_photo",Matchers.nullValue(),
                        "lists[" + dataIndex + "].manufacture_year",Matchers.equalTo(manufacture_year),
                        "lists[" + dataIndex + "].registration_number",Matchers.equalTo(registration_number),
                        "lists[" + dataIndex + "].chasis_number",Matchers.equalTo(chasis_number),
                        "lists[" + dataIndex + "].max_seating_capacity",Matchers.equalTo(max_seating_capacity),
                        "lists[" + dataIndex + "].driver_name",Matchers.equalTo(driver_name),
                        "lists[" + dataIndex + "].driver_licence",Matchers.equalTo(driver_licence),
                        "lists[" + dataIndex + "].driver_contact",Matchers.equalTo(driver_contact),
                        "lists[" + dataIndex + "].note",Matchers.equalTo(note),
                        "lists[" + dataIndex + "].created_at",Matchers.equalTo(created_at));


    }

    @Then("The api user prepares a POST request to send to the api visitorsPurposeid endpoint containing the information id {int}.")
    public void the_api_user_prepares_a_post_request_to_send_to_the_api_visitors_purposeid_endpoint_containing_the_information_id(int id) {
        jsonObjectRequestBody=new JSONObject();
        jsonObjectRequestBody.put("id",id);
        System.out.println("post body :"+jsonObjectRequestBody);

        response=given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(jsonObjectRequestBody.toString())
                .post(API_Methods.fullPath);

    }

    @And("The api user verifies the information in the response body for the entry with the specified, including {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, and {string}.")
    public void theApiUserVerifiesTheInformationInTheResponseBodyForTheEntryWithTheSpecifiedIncludingAnd(String id, String vehicle_no, String vehicle_model, String vehicle_photo, String manufacture_year, String registration_number, String chasis_number, String max_seating_capacity, String driver_name, String driver_licence, String driver_contact, String note, String created_at) {

        response=given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(jsonObjectRequestBody.toString())
                .post(API_Methods.fullPath);

        response.then().assertThat().body(
                "lists.id",Matchers.equalTo(id),
                "lists.vehicle_no",Matchers.equalTo(vehicle_no),
                "lists.vehicle_model",Matchers.equalTo(vehicle_model),
                "lists.vehicle_photo",Matchers.nullValue(),
                "lists.manufacture_year",Matchers.equalTo(manufacture_year),
                "lists.registration_number",Matchers.equalTo(registration_number),
                "lists.chasis_number",Matchers.equalTo(chasis_number),
                "lists.max_seating_capacity",Matchers.equalTo(max_seating_capacity),
                "lists.driver_name",Matchers.equalTo(driver_name),
                "lists.driver_licence",Matchers.equalTo(driver_licence),
                "lists.driver_contact",Matchers.equalTo(driver_contact),
                "lists.note",Matchers.equalTo(note),
                "lists.created_at",Matchers.equalTo(created_at));


    }

    @Then("The api user prepares a POST request to send to the api visitorsPurposeid endpoint without the information id.")
    public void theApiUserPreparesAPOSTRequestToSendToTheApiVisitorsPurposeidEndpointWithoutTheInformationId() {
        jsonObjectRequestBody=new JSONObject();
        jsonObjectRequestBody.put("id","");
        System.out.println("post body :"+jsonObjectRequestBody);
    }

    @Then("The api user prepares a POST request to send to the api visitorsPurposeAdd endpoint containing the information, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, and {string}.")
    public void theApiUserPreparesAPOSTRequestToSendToTheApiVisitorsPurposeAddEndpointContainingTheInformationAnd(String vehicle_no, String vehicle_model, String vehicle_photo, String manufacture_year, String registration_number, String chasis_number, String max_seating_capacity, String driver_name, String driver_licence, String driver_contact, String note, String created_at) {
        jsonObjectRequestBody=new JSONObject();
        jsonObjectRequestBody.put("vehicle_no",vehicle_no);
        jsonObjectRequestBody.put("vehicle_model",vehicle_model);
        jsonObjectRequestBody.put("vehicle_photo",vehicle_photo);
        jsonObjectRequestBody.put("manufacture_year",manufacture_year);
        jsonObjectRequestBody.put("registration_number",registration_number);
        jsonObjectRequestBody.put("chasis_number",chasis_number);
        jsonObjectRequestBody.put("max_seating_capacity",max_seating_capacity);
        jsonObjectRequestBody.put("driver_name",driver_name);
        jsonObjectRequestBody.put("driver_licence",driver_licence);
        jsonObjectRequestBody.put("driver_contact",driver_contact);
        jsonObjectRequestBody.put("note",note);
        jsonObjectRequestBody.put("created_at",created_at);
        System.out.println("post body :"+jsonObjectRequestBody);

        response=given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(jsonObjectRequestBody.toString())
                .post(API_Methods.fullPath);
        response.prettyPrint();

    }

    @Then("The API user sends a dataless POST request to the API visitorsPurposeid endpoint without any information body.")
    public void theAPIUserSendsADatalessPOSTRequestToTheAPIVisitorsPurposeidEndpointWithoutAnyInformationBody() {
        jsonObjectRequestBody=new JSONObject();
        System.out.println("post body :"+jsonObjectRequestBody);
        response=given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(jsonObjectRequestBody.toString())
                .post(API_Methods.fullPath);
        response.prettyPrint();
    }

    @Then("API user sends a POST request with missing data to the API visitorsPurposeAdd endpoint,{string}, {string}, {string}, {string}, {string}, {string}, and {string}.")
    public void apiUserSendsAPOSTRequestWithMissingDataToTheAPIVisitorsPurposeAddEndpointAnd(String chasis_number, String max_seating_capacity, String driver_name, String driver_licence, String driver_contact, String note, String created_at) {
        jsonObjectRequestBody=new JSONObject();
        jsonObjectRequestBody.put("chasis_number",chasis_number);
        jsonObjectRequestBody.put("max_seating_capacity",max_seating_capacity);
        jsonObjectRequestBody.put("driver_name",driver_name);
        jsonObjectRequestBody.put("driver_licence",driver_licence);
        jsonObjectRequestBody.put("driver_contact",driver_contact);
        jsonObjectRequestBody.put("note",note);
        jsonObjectRequestBody.put("created_at",created_at);
        System.out.println("post body :"+jsonObjectRequestBody);

        response=given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(jsonObjectRequestBody.toString())
                .post(API_Methods.fullPath);
        response.prettyPrint();

    }

    @Then("The api user gets the addId in the response body")
    public void theApiUserGetsTheAddIdInTheResponseBody() {
        addId=response.jsonPath().getInt("addId");
        System.out.println(addId);

    }

    @Then("The api user prepares a POST request to send to the api visitorsPurposeid endpoint containing the information id addId.")
    public void theApiUserPreparesAPOSTRequestToSendToTheApiVisitorsPurposeidEndpointContainingTheInformationIdAddId() {
        jsonObjectRequestBody=new JSONObject();
        jsonObjectRequestBody.put("id",addId);
        System.out.println("post body :"+jsonObjectRequestBody);
        response=given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(jsonObjectRequestBody.toString())
                .post(API_Methods.fullPath);
        response.prettyPrint();
    }


    @Then("The api user prepares a PATCH request to send to the api visitorsPurposeAdd endpoint containing the information,{string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}.")
    public void theApiUserPreparesAPATCHRequestToSendToTheApiVisitorsPurposeAddEndpointContainingTheInformation(String id, String vehicle_no, String vehicle_model, String vehicle_photo, String manufacture_year, String registration_number, String chasis_number, String max_seating_capacity, String driver_name, String driver_licence, String driver_contact, String note) {

        jsonObjectRequestBody=new JSONObject();
        jsonObjectRequestBody.put("id",id);
        jsonObjectRequestBody.put("vehicle_no",vehicle_no);
        jsonObjectRequestBody.put("vehicle_model",vehicle_model);
        jsonObjectRequestBody.put("vehicle_photo",vehicle_photo);
        jsonObjectRequestBody.put("manufacture_year",manufacture_year);
        jsonObjectRequestBody.put("registration_number",registration_number);
        jsonObjectRequestBody.put("chasis_number",chasis_number);
        jsonObjectRequestBody.put("max_seating_capacity",max_seating_capacity);
        jsonObjectRequestBody.put("driver_name",driver_name);
        jsonObjectRequestBody.put("driver_licence",driver_licence);
        jsonObjectRequestBody.put("driver_contact",driver_contact);
        jsonObjectRequestBody.put("note",note);

        System.out.println("Patch body :"+jsonObjectRequestBody);

        response=given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(jsonObjectRequestBody.toString())
                .patch(API_Methods.fullPath);
        response.prettyPrint();
    }


    @Then("The api user prepares a patch request that does not contain data to the api visitorsPurposeUpdate endpoint.")
    public void theApiUserPreparesAPatchRequestThatDoesNotContainDataToTheApiVisitorsPurposeUpdateEndpoint() {
        jsonObjectRequestBody=new JSONObject();

    }

    @Then("The api user sends a PATCH request and saves the returned response..")
    public void theApiUserSendsAPATCHRequestAndSavesTheReturnedResponse() {
        response=given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(jsonObjectRequestBody.toString())
                .patch(API_Methods.fullPath);
        response.prettyPrint();
    }


    @Then("The api user prepares a PATCH request to send to the api visitorsPurposeAdd endpoint containing the information,{string}, {string}, {string}.")
    public void theApiUserPreparesAPATCHRequestToSendToTheApiVisitorsPurposeAddEndpointContainingTheInformation(String id, String vehicle_no, String vehicle_model) {
        jsonObjectRequestBody=new JSONObject();
        jsonObjectRequestBody.put("id",id);
        jsonObjectRequestBody.put("vehicle_no",vehicle_no);
        jsonObjectRequestBody.put("vehicle_model",vehicle_model);
        System.out.println("Patch body :"+jsonObjectRequestBody);
        response=given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(jsonObjectRequestBody.toString())
                .patch(API_Methods.fullPath);
        response.prettyPrint();
    }

    @And("API user verifies that updateId in response body is the same as {string} in request body")
    public void apiUserVerifiesThatInResponseBodyIsTheSameAsInRequestBody(String id) {
        String updateId=response.jsonPath().getString("updateId");
        System.out.println(updateId+id);

        Assert.assertEquals(id,updateId);

    }
    @Then("The api user gets the updateId in the response body")
    public void theApiUserGetsTheUpdateIdInTheResponseBody() {
        updateId=response.jsonPath().getInt("updateId");
        System.out.println(updateId);

    }

    @Then("The api user prepares a POST request to send to the api visitorsPurposeid endpoint containing the information id updateId.")
    public void theApiUserPreparesAPOSTRequestToSendToTheApiVisitorsPurposeidEndpointContainingTheInformationIdUpdateId() {
        jsonObjectRequestBody=new JSONObject();
        jsonObjectRequestBody.put("id",updateId);
        System.out.println("post body :"+jsonObjectRequestBody);
        response=given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(jsonObjectRequestBody.toString())
                .post(API_Methods.fullPath);
        response.prettyPrint();
    }

    @Then("API user: {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}. confirms that it is the same.")
    public void apiUserConfirmsThatItIsTheSame(String id, String vehicle_no, String vehicle_model, String vehicle_photo, String manufacture_year, String registration_number, String chasis_number, String max_seating_capacity, String driver_name, String driver_licence, String driver_contact, String note) {
        response=given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(jsonObjectRequestBody.toString())
                .post(API_Methods.fullPath);
        response.prettyPrint();

        response.then().assertThat().body(
                "lists.id",Matchers.equalTo(id),
                "lists.vehicle_no",Matchers.equalTo(vehicle_no),
                "lists.vehicle_model",Matchers.equalTo(vehicle_model),
                "lists.vehicle_photo",Matchers.nullValue(),
                "lists.manufacture_year",Matchers.equalTo(manufacture_year),
                "lists.registration_number",Matchers.equalTo(registration_number),
                "lists.chasis_number",Matchers.equalTo(chasis_number),
                "lists.max_seating_capacity",Matchers.equalTo(max_seating_capacity),
                "lists.driver_name",Matchers.equalTo(driver_name),
                "lists.driver_licence",Matchers.equalTo(driver_licence),
                "lists.driver_contact",Matchers.equalTo(driver_contact),
                "lists.note",Matchers.equalTo(note));

         //suleyman US016 son
    }



    @Given("The api user prepares a POST request to send to the api visitorsPurposeAdd endpoint containing the information {string}, {string},  {string} and {string}.")
    public void the_api_user_prepares_a_post_request_to_send_to_the_api_visitors_purpose_add_endpoint_containing_the_information_and(String type, String title, String description, String slug) {

        jsonObjectRequestBody = new JSONObject();
        jsonObjectRequestBody.put("type", type);
        jsonObjectRequestBody.put("title", title);
        jsonObjectRequestBody.put("description", description);
        jsonObjectRequestBody.put("slug", slug);
    }

    @Given("The api user prepares a post request that does not contain data to the api api/addNotice endpoint.")
    public void the_api_user_prepares_a_post_request_that_does_not_contain_data_to_the_api_api_add_notice_endpoint() {
        jsonObjectRequestBody = new JSONObject();
    }

    @Given("The api user prepares a PATCH request to send to the api updateNotice endpoint containing the information {int}, {string}, {string}, {string} and {string}.")
    public void the_api_user_prepares_a_patch_request_to_send_to_the_api_update_notice_update_endpoint_containing_the_information_and(Integer id, String type, String title, String description, String slug) {

        hashMapRequestBody = new HashMap<>();
        hashMapRequestBody.put("id", id);
        hashMapRequestBody.put("type", type);
        hashMapRequestBody.put("description", description);
        hashMapRequestBody.put("title", title);
        hashMapRequestBody.put("slug", slug);
    }

    @Given("The api user prepares a patch request that does not contain data to the api updateNotice endpoint.")
    public void the_api_user_prepares_a_patch_request_that_does_not_contain_data_to_the_api_update_notice_update_endpoint() {
        hashMapRequestBody = new HashMap<>();
    }



  
    @Given("The api user verifies purpose as {string}")
    public void the_api_user_verifies_visitors_as(String purpose) {
        response.then()
                .assertThat()
                .body("lists.purpose", Matchers.equalTo(purpose));
    }


    @Given("The api user prepares a DELETE request to send to the api visitorsDelete endpoint containing the information {int}.")
    public void the_api_user_prepares_a_delete_request_to_send_to_the_api_visitors_delete_endpoint_containing_the_information(int id) {

        requestBody = new VisitorsPurposeDeletePojo(id);

        System.out.println("Delete Body : " + requestBody);
    }

    @Given("The api user verifies that the deletedid information in the response body is the same as the id information in the request body.")
    public void the_api_user_verifies_that_the_deletedId_information_in_the_response_body_is_the_same_as_the_id_information_in_the_request_body() {
        jsonPath = response.jsonPath();

        Assert.assertEquals(requestBody.getId(), jsonPath.getInt("deletedId"));
    }
    @Given("The api user prepares a DELETE request that does not contain data to the api visitorsDelete endpoint.")
    public void the_api_user_prepares_a_delete_request_that_does_not_contain_data_to_the_api_visitors_delete_endpoint() {
        requestBody = new VisitorsPurposeDeletePojo();

    }





    @Given("The api user prepares a POST request to send to the api visitorsPurposeAdd endpoint containing the information {string}, {string}, {string}, {string}, {string} and {string}.")
    public void the_api_user_prepares_a_post_request_to_send_to_the_api_visitors_purpose_add_endpoint_containing_the_information_and(String student_id, String current_email, String current_phone, String occupation, String address, String photo) {
        jsonObjectRequestBody = new JSONObject();
        jsonObjectRequestBody.put("student_id", student_id);
        jsonObjectRequestBody.put("current_email", current_email);
        jsonObjectRequestBody.put("current_phone", current_phone);
        jsonObjectRequestBody.put("occupation", occupation);
        jsonObjectRequestBody.put("address", address);
        jsonObjectRequestBody.put("photo", photo);

        System.out.println("Post Body : " + jsonObjectRequestBody);

    }


    @Given("The api user prepares a POST request to send to the api visitorsPurposeAdd endpoint containing the information {string}, {string} and {string}.")
    public void the_api_user_prepares_a_post_request_to_send_to_the_api_visitors_purpose_add_endpoint_containing_the_information_and(String occupation, String address, String photo) {

        jsonObjectRequestBody = new JSONObject();
        jsonObjectRequestBody.put("occupation", occupation);
        jsonObjectRequestBody.put("address", address);
        jsonObjectRequestBody.put("photo", photo);

        System.out.println("Post Body : " + jsonObjectRequestBody);
    }

    @Given("The api user prepares a POST request to send to the api visitorsPurposeAdd endpoint containing the information {string} , {string},{string}, {string}, {string}, {string} .")
    public void the_api_user_prepares_a_post_request_to_send_to_the_api_visitors_purpose_add_endpoint_containing_the_information(String student_id, String current_email, String current_phone, String occupation, String address, String photo) {
        jsonObjectRequestBody = new JSONObject();
        jsonObjectRequestBody.put("student_id", student_id);
        jsonObjectRequestBody.put("current_email", current_email);
        jsonObjectRequestBody.put("current_phone", current_phone);
        jsonObjectRequestBody.put("occupation", occupation);
        jsonObjectRequestBody.put("address", address);
        jsonObjectRequestBody.put("photo", photo);

        System.out.println("Post Body : " + jsonObjectRequestBody);
    }


    @Given("The api user prepares a POST request to send to the api alumniId endpoint containing the information {int}.")
    public void the_api_user_prepares_a_post_request_to_send_to_the_api_api_alumni_id_endpoint_containing_the_information(Integer id) {

        jsonObjectRequestBody = new JSONObject();
        jsonObjectRequestBody.put("id", id);

        System.out.println("Post Body : " + jsonObjectRequestBody);
    }

    @Given("The api user prepares a PATCH request to send to the api visitorsPurposeUpdate endpoint containing the information {int}, {string}, {string}, {string}, {string}, {string} and {string}.")
    public void the_api_user_prepares_a_patch_request_to_send_to_the_api_visitors_purpose_update_endpoint_containing_the_information_and(Integer id, String student_id, String current_email, String current_phone, String occupation, String address, String photo) {
        hashMapRequestBody = new HashMap<>();
        hashMapRequestBody.put("id", id);
        hashMapRequestBody.put("student_id", student_id);
        hashMapRequestBody.put("current_email", current_email);
        hashMapRequestBody.put("current_phone", current_phone);
        hashMapRequestBody.put("occupation", occupation);
        hashMapRequestBody.put("address", address);
        hashMapRequestBody.put("photo", photo);

        System.out.println("Patch Body : " + hashMapRequestBody);
    }

    @Given("The api user prepares a PATCH request to send to the api alumniUpdate endpoint containing the information {int}, {string}, {string},  {string}, {string}, {string}  and {string}.")
    public void the_api_user_prepares_a_patch_request_to_send_to_the_api_alumni_update_endpoint_containing_the_information_and(Integer id, String student_id, String current_email, String current_phone, String occupation, String address, String photo) {

        hashMapRequestBody = new HashMap<>();
        hashMapRequestBody.put("id", id);
        hashMapRequestBody.put("student_id", student_id);
        hashMapRequestBody.put("current_email", current_email);
        hashMapRequestBody.put("current_phone", current_phone);
        hashMapRequestBody.put("occupation", occupation);
        hashMapRequestBody.put("address", address);
        hashMapRequestBody.put("photo", photo);

        System.out.println("Patch Body : " + hashMapRequestBody);

    }

    @Given("The api user prepares a PATCH request to send to the api alumniUpdate endpoint containing the information {string}, {string}, {string} , {string} , {string}  and {string}.")
    public void the_api_user_prepares_a_patch_request_to_send_to_the_api_alumniUpdate_endpoint_containing_the_information_and(String student_id, String current_email, String current_phone, String occupation, String address, String photo) {

        hashMapRequestBody = new HashMap<>();
        hashMapRequestBody.put("student_id", student_id);
        hashMapRequestBody.put("current_email", current_email);
        hashMapRequestBody.put("current_phone", current_phone);
        hashMapRequestBody.put("occupation", occupation);
        hashMapRequestBody.put("address", address);
        hashMapRequestBody.put("photo", photo);

        System.out.println("Patch Body : " + hashMapRequestBody);


    }


    @Given("The api user prepares a patch request that does not contain data to the alumniUpdate endpoint.")
    public void the_api_user_prepares_a_patch_request_that_does_not_contain_data_to_the_alumni_update_endpoint() {
        hashMapRequestBody = new HashMap<>();
    }

    @Given("The api user sends a PATCH request, saves the returned response, and verifies that the status code is {string} with You do not have authorization or token error.")
    public void the_api_user_sends_a_patch_request_saves_the_returned_response_and_verifies_that_the_status_code_is_with_you_do_not_have_authorization_or_token_error(String string) {
        hashMapRequestBody = new HashMap<>();
    }



    @Given("The api user verifies alumni as {string}")
    public void the_api_user_verifies_alumni_as(String occupation) {
        // Write code here that turns the phrase above into concrete actions
        response.then()
                .assertThat()
                .body("lists.occupation", Matchers.equalTo("cem"));
    }

    @Given("The api user prepares a DELETE request that does not contain data to the api alumniDelete endpoint.")
    public void the_api_user_prepares_a_delete_request_that_does_not_contain_data_to_the_api_alumni_delete_endpoint() {

        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(requestBody)
                .delete(fullPath);

        response.prettyPrint();
    }

    @Given("The api user prepares a DELETE request to send to the api alumniDelete endpoint containing the information {int}.")
    public void the_api_user_prepares_a_delete_request_to_send_to_the_api_alumni_delete_endpoint_containing_the_information(Integer id) {
        requestBody = new VisitorsPurposeDeletePojo(id);
       // jsonObjectRequestBody = new JSONObject(id);


        System.out.println("Delete Body : " + requestBody);
    }

    @Given("The api user prepares a POST request to send to the api alumniDeleteid endpoint containing the information {int}.")
    public void the_api_user_prepares_a_post_request_to_send_to_the_api_alumni_deleteid_endpoint_containing_the_information(Integer id) {
        jsonObjectRequestBody = new JSONObject();
        jsonObjectRequestBody.put("id", id);
        System.out.println("Post Body : " + jsonObjectRequestBody);
    }

    @Given("The api user prepares a DELETE request to send to the aip alumnıID endpoint does not containing any id")
    public void the_api_user_prepares_a_delete_request_to_send_to_the_aip_alumnı_id_endpoint_does_not_containing_any_id() {
     requestBody = new VisitorsPurposeDeletePojo();

    }


    // suleyman WWCAPI81_API_US0017_Get.feature
    @Then("The api user prepares a Delete request to send to the api visitorsPurposeid endpoint containing the information id {int}.")
    public void theApiUserPreparesADeleteRequestToSendToTheApiVisitorsPurposeidEndpointContainingTheInformationId(int id) {
        jsonObjectRequestBody=new JSONObject();
        jsonObjectRequestBody.put("id",id);
        System.out.println("Delete Body: " + jsonObjectRequestBody.toString());

    }


    @Then("The api user sends a DELETE request and saves the returned response")
    public void theApiUserSendsADELETERequestAndSavesTheReturnedResponse() {
        response=given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(jsonObjectRequestBody.toString())
                .delete(API_Methods.fullPath);
        response.prettyPrint();

    }


    @Then("The API user prepares to send a Delete request without id to the api visitorsPurposeid endpoint.")
    public void theAPIUserPreparesToSendADeleteRequestWithoutIdToTheApiVisitorsPurposeidEndpoint() {
        jsonObjectRequestBody=new JSONObject();
        System.out.println("Delete Body: " + jsonObjectRequestBody.toString());
        response=given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(jsonObjectRequestBody.toString())
                .delete(API_Methods.fullPath);
        response.prettyPrint();
    }


    @Then("Verifies that the DeletedId in the user response body is the same as the id {int} in the delete request body.")
    public void verifiesThatTheDeletedIdInTheUserResponseBodyIsTheSameAsTheIdInTheDeleteRequestBody(int id) {
        jsonPath=response.jsonPath();
        Assert.assertEquals(id,jsonPath.getInt("DeletedId"));
    }

    @Then("The api user gets the DeletedId in the response body")
    public void theApiUserGetsTheDeletedIdInTheResponseBody() {
        DeletedId=response.jsonPath().getInt("DeletedId");
        System.out.println(DeletedId);
    }

    @Then("The api user prepares a POST request to send to the api visitorsPurposeid endpoint containing the information id DeletedId.")
    public void theApiUserPreparesAPOSTRequestToSendToTheApiVisitorsPurposeidEndpointContainingTheInformationIdDeletedId() {
        jsonObjectRequestBody=new JSONObject();
        jsonObjectRequestBody.put("id",DeletedId);
        System.out.println("post body :"+jsonObjectRequestBody);
        response=given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(jsonObjectRequestBody.toString())
                .post(API_Methods.fullPath);
        response.prettyPrint();
    }

    @Then("Verifies the user deletion process from the status {int} and {string} information of the response returned by the request post boy created with Deleted Id.")
    public void verifiesTheUserDeletionProcessFromTheStatusAndInformationOfTheResponseReturnedByTheRequestPostBoyCreatedWithDeletedId(int code, String message) {

        response.then().assertThat().statusCode(code);
        jsonPath=response.jsonPath();
        System.out.println("Actual Response Message: " + jsonPath.getString("message"));

        Assert.assertEquals(message,jsonPath.getString("message"));

        // suleyman
    }



    @Given("The api user verifies that the DeletedId information in the response body is the same as the id information in the request body.")
    public void the_api_user_verifies_that_the_deleted_ıd_information_in_the_response_body_is_the_same_as_the_id_information_in_the_request_body() {
        jsonPath = response.jsonPath();
        Assert.assertEquals(requestBody.getId(), jsonPath.getInt("DeletedId"));
    }

    @Given("The api user sends a DELETE request and save the returned response.")
    public void the_api_user_sends_a_delete_request_and_save_the_returned_response() {
        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(jsonObjectRequestBody)
                .delete(fullPath);

        response.prettyPrint();
    }

}
