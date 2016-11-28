/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import beans.Product;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.ejb.Stateless;

/**
 *
 * @author Adam Frewen 0813664
 * @author Warrick Wills 13831575
 */
@Stateless
public class ListOfProducts {

    public ArrayList<Product> getListOfProducts() throws ClassNotFoundException, SQLException {
        ArrayList<Product> list = new ArrayList<>();
        String dbDriver = "org.apache.derby.jdbc.ClientDriver";
        String dbUrl = "jdbc:derby://localhost:1527/ShoppingCart_DB";
        String dbTable = "PRODUCTS";
        String userName = "ass2dms";
        String password = "ass2dms";
        // connect to the database and create a prepared statement
        Class.forName(dbDriver);
        Connection conn = DriverManager.getConnection(dbUrl, userName, password);
        Statement stmt = conn.createStatement();
        synchronized (this) // synchronize access to stmt
        {
            ResultSet rs = stmt.executeQuery("SELECT * FROM " + dbTable);
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt(1));
                p.setProduct(rs.getString(2));
                p.setDescription(rs.getString(3));
                p.setPrice(rs.getDouble(4));
                list.add(p);
            }
        }
        return list;
    }
}
