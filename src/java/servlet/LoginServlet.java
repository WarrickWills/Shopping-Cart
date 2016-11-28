/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import beans.Cart;
import beans.Product;
import beans.User;
import ejb.ListOfProducts;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Adam Frewen 0813664
 * @author Warrick Wills 13831575
 */
public class LoginServlet extends HttpServlet {

    @EJB
    private ListOfProducts listOfProducts;

    private Connection conn;
    private PreparedStatement stmt;

    public LoginServlet()
            throws SQLException, ClassNotFoundException, IOException {  // obtain database parameters from configuration file
        String dbDriver = "org.apache.derby.jdbc.ClientDriver";
        String dbUrl = "jdbc:derby://localhost:1527/ShoppingCart_DB";
        String dbTable = "users";
        String userName = "ass2dms";
        String password = "ass2dms";
        // connect to the database and create a prepared statement
        Class.forName(dbDriver);
        conn = DriverManager.getConnection(dbUrl, userName, password);
        stmt = conn.prepareStatement("SELECT * FROM " + dbTable + " WHERE username = ? AND password = ?");
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String client = request.getParameter("username");
        String password = request.getParameter("password");
        System.out.println(client);
        System.out.println(password);
        if (client == null || password == null
                || client.length() == 0 || password.length() == 0) {  // show page with form to obtain client name
            RequestDispatcher dispatcher = getServletContext().
                    getRequestDispatcher("/loginerror.jsp");
            dispatcher.forward(request, response);
        } else {  // put client name into a bean
            User user = new User();
            user.setUsername(client);
            user.setPassword(password);
            Cart cart = new Cart();
            // check database for name using an SQL command
            boolean customerFound;
            try {
                synchronized (this) // synchronize access to stmt
                {
                    stmt.setString(1, client);
                    stmt.setString(2, password);
                    ResultSet rs = stmt.executeQuery();
                    customerFound = rs.next();//true if there is a record
                    user.setFname(rs.getString("fname"));
                    user.setLname(rs.getString("lname"));
                    user.setId(rs.getInt("ID"));
                    user.setOwing(rs.getDouble("owe"));
                    user.setPaid(rs.getDouble("paid"));
                    user.setTotal(rs.getDouble("total"));
                }
            } catch (SQLException e) {
                System.err.println("SQL Exception during query: " + e);
                customerFound = false;
            }
            ArrayList<Product> products = new ArrayList<>();
            try {
                products = listOfProducts.getListOfProducts();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

            // Invalidate any existing session  -  Clears information if user manually goes back to login (eg: they would otherwise see previous logins cart)
            request.getSession().invalidate();
            // make user bean available for session
            HttpSession session = request.getSession(true);
            session.setAttribute("users", user);
            session.setAttribute("products", products);
            session.setAttribute("cart", cart);
            // pass bean to appropriate page for displaying response
            if (customerFound) {
                RequestDispatcher dispatcher = getServletContext().
                        getRequestDispatcher("/home.jsp");
                dispatcher.forward(request, response);
            } else {
                RequestDispatcher dispatcher = getServletContext().
                        getRequestDispatcher("/loginerror.jsp");
                dispatcher.forward(request, response);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
