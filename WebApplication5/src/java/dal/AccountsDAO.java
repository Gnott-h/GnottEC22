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
import java.util.ArrayList;
import java.util.List;
import model.Accounts;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 *
 * @author phu
 */
public class AccountsDAO extends DBConext{
   public boolean checkAcc(String accountName, String password) {
    String sql = "SELECT * FROM Login WHERE accountName = ? AND password = ?";
    try (PreparedStatement statement = connection.prepareStatement(sql)) {
        statement.setString(1, accountName);
        statement.setString(2, password);
        ResultSet resultSet = statement.executeQuery();
        return resultSet.next();
    } catch (SQLException e) {
        System.out.println("Error: " + e.getMessage());
    }
    return false;
}
}
