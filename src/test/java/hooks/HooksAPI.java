package hooks;

import config_Requirements.ConfigReader;
import io.restassured.builder.RequestSpecBuilder;
import io.restassured.specification.RequestSpecification;
import utilities.API_Utilities.Authentication;

public class HooksAPI {
    public static RequestSpecification spec;

    public static void setUpApi(String userType) {
        String token;

        if (userType.equals("admin") || userType.equals("teacher") || userType.equals("student") || userType.equals("adminAhmetEmail") || userType.equals("teacher2")) {


            token = Authentication.generateToken(userType);
        } else {
            token = ConfigReader.getProperty("invalidToken", "api");
        }

        spec = new RequestSpecBuilder()
                .setBaseUri(ConfigReader.getProperty("base_url", "api"))
                .addHeader("Accept", "application/json")
                .addHeader("Authorization", "Bearer " + token)
                .build();
    }
}

