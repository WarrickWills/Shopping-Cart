/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import beans.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
public class PaymentServlet extends HttpServlet {

    private Connection conn;
    private PreparedStatement stmt;
    private PreparedStatement stmtUpdate;

    public PaymentServlet()
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
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("users");

        boolean customerFound;
        try {
            synchronized (this) // synchronize access to stmt
            {
                stmt.setString(1, user.getUsername());
                stmt.setString(2, user.getPassword());
                ResultSet rs = stmt.executeQuery();
                customerFound = rs.next();//true if there is a record
                user.setOwing(rs.getDouble("owe"));
                user.setPaid(rs.getDouble("paid"));
                user.setTotal(rs.getDouble("total"));
                // Debug check of values
                System.out.println(user.getOwing() + " " + user.getPaid() + " " + user.getTotal());
                double payment;
                payment = Double.parseDouble(request.getParameter("payAmount"));
                user.setOwing(user.getOwing() - payment);
                user.setPaid(user.getPaid() + payment);
                user.setTotal(user.getTotal());
                // Debug check of values
                System.out.println(user.getOwing() + " " + user.getPaid() + " " + user.getTotal());

                // Update database
                stmtUpdate = conn.prepareStatement("UPDATE users"
                        + " SET owe=" + user.getOwing() + ",paid=" + user.getPaid() + ",total=" + user.getTotal()
                        + " WHERE ID = " + user.getId());
                stmtUpdate.executeUpdate();
            }
        } catch (SQLException e) {
            System.err.println("SQL Exception during query: " + e);
            customerFound = false;
        }

        // Display purchase confirmation with accounts information
        if (customerFound) {
            RequestDispatcher dispatcher = getServletContext().
                    getRequestDispatcher("/accountinfo.jsp");
            dispatcher.forward(request, response);
        } else {
            RequestDispatcher dispatcher = getServletContext().
                    getRequestDispatcher("/loginerror.jsp");
            dispatcher.forward(request, response);
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
