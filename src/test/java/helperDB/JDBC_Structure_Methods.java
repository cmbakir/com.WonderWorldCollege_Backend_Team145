package helperDB;

import base.BaseTest;
import config_Requirements.ConfigLoader;


import com.github.javafaker.Faker;

import config_Requirements.ConfigLoader;


import java.sql.*;

public class JDBC_Structure_Methods extends BaseTest {
    public static Connection connection;
    public static Statement statement;
    public static PreparedStatement preparedStatement;
    public static ResultSet resultSet;
    public static String query;
    public static Faker faker = new Faker();

    public static void createConnection() {


        ConfigLoader configLoader = new ConfigLoader();


        if (configLoader == null) {
            configLoader = new ConfigLoader();  // Eğer null ise burada başlatılıyor

}




        String url = configLoader.getDatabaseConfig("URL");
        String username = configLoader.getDatabaseConfig("USERNAME");
        String password = configLoader.getDatabaseConfig("PASSWORD");
        try {
            connection = DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public static void closeConnection() {
        try {
            if (resultSet != null) {
                resultSet.close();
            }
            if (statement != null) {
                statement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static Statement getStatement() {
        try {
            statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return statement;
    }

    public static ResultSet getResultset() {
        try {
            statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return resultSet;
    }

    public static PreparedStatement getPraperedStatement(String sqlQuery) {

        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(sqlQuery);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return preparedStatement;
    }

    public static PreparedStatement getPraperedStatementGeneratedKeys(String sqlQuery, boolean returnGeneratedKeys) {
        PreparedStatement preparedStatement = null;
        try {
            if (returnGeneratedKeys) {
                preparedStatement = connection.prepareStatement(sqlQuery, Statement.RETURN_GENERATED_KEYS);
            } else {
                preparedStatement = connection.prepareStatement(sqlQuery);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return preparedStatement;


    }

    //ekleme
    public static Connection getConnection(){

        ConfigLoader configLoader = new ConfigLoader();

        String url = configLoader.getDatabaseConfig("URL");
        String username = configLoader.getDatabaseConfig("USERNAME");
        String password = configLoader.getDatabaseConfig("PASSWORD");

        try {
            connection = DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return connection;
    }





}