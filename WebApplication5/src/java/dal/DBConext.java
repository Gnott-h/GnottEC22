/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

/**
 *
 * @author phu
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author phu
 */
public class DBConext {
    protected Connection connection;
    public DBConext()
    {
        try {
            String url = "jdbc:sqlserver://localhost:1433;databaseName=GnottDTB";
        String username = "sa";
        String password = "123123";
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        connection = DriverManager.getConnection(url,username,password);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
            
        
    }
    
}