/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

/**
 *
 * @author GSSB
 */
public class Sign extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Sign</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Sign at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        //processRequest(request, response)
        
        PrintWriter out = response.getWriter();
        String name = request.getParameter("user_name");
        String pass = request.getParameter("password");
        
        
        
        String database = "jdbc:mysql://localhost:3306/Services?allowPublicKeyRetrieval=true&useSSL=false";
        String user = "root";
        String password = "Silvabeth12";
        
       
        String mysql = "Select * from Login_Table where User_Name = '"+name+"' and Password = '"+pass+"'";
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(database, user, password);
            Statement stm = con.createStatement();
            ResultSet result = stm.executeQuery(mysql);
            if (result.next()){
                HttpSession session=request.getSession();  
            session.setAttribute("user_name", name);
            String role = result.getString("User_Type");
            if (role.equals("Worker")){
            response.sendRedirect("Worker-View.jsp");
            }
            else if (role.equals("Client")){
            response.sendRedirect("index.jsp");
            }
            }
            else{
            request.getRequestDispatcher("Login-Form.jsp").include(request, response); 
            out.println("<h3 style=\"color: red\">Incorrect Password</h3>");
            }
            con.close();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Sign.class.getName()).log(Level.SEVERE, null, ex);
            out.println("Nigga");
        }
            
        
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
