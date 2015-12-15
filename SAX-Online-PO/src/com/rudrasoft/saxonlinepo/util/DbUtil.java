package com.rudrasoft.saxonlinepo.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbUtil {

    public static void close(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                /*log or print or ignore*/
                System.err.println(e.getMessage());

            }
        }
    }

    public static void close(Statement statement) {
        if (statement != null) {
            try {
                statement.close();
            } catch (SQLException e) {
                /*log or print or ignore*/
                System.err.println(e.getMessage());

            }
        }
    }

    public static void close(PreparedStatement preparedStatement) {
        if (preparedStatement != null) {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                /*log or print or ignore*/
                System.err.println(e.getMessage());

            }
        }
    }

    public static void close(ResultSet resultSet) {
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                /*log or print or ignore*/
                System.err.println(e.getMessage());

            }
        }
    }
}
