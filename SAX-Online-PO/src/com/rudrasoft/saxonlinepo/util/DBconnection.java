/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rudrasoft.saxonlinepo.util;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
/**
 * @author Swapnil
 *
 */
public class DBconnection {

    private static Connection connection = null;
    private static String driver = null;
    private static String url = null;
    private static String user = null;
    private static String password = null;

    static {
        try {
        	System.out.println("DB Static block............");
            Properties prop = new Properties();
            InputStream inputStream = DBconnection.class.getClassLoader().getResourceAsStream("com/rudrasoft/saxonlinepo/util/MySqlDataBase.properties");
            prop.load(inputStream);
            driver = prop.getProperty("driver");
            url = prop.getProperty("url");
            user = prop.getProperty("user");
            password = prop.getProperty("password");
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static Connection connect() {
       
            try {
            	System.out.println("connect method.............");
                Class.forName(driver);
                connection = DriverManager.getConnection(url, user, password);
                System.out.println("Connected Successfully:-" + connection);
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            }
            return connection;
    }
}
