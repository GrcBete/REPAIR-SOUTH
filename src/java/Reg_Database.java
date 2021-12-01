/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author GSSB
 */
public class Reg_Database extends HttpServlet {

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
            out.println("<title>Servlet Reg_Database</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Reg_Database at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String name = request.getParameter("user_name");
        String pass = request.getParameter("password");
        String database = "jdbc:mysql://localhost:3306/Services?allowPublicKeyRetrieval=true&useSSL=false";
        String user = "root";
        String password = "Silvabeth12";
            try {
                 boolean very = Very(name);
                 System.out.println(very);
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(database, user, password);
            if (very==false){
            PreparedStatement pst = con.prepareStatement("insert into Login_Table (User_Name, Password, User_Type) values(?,?,?)");
            pst.setString(1,name);
            pst.setString(2,pass);
            pst.setString(3,"Client");
            pst.executeUpdate();
            con.close();
            response.sendRedirect("index.html");}
            else{
            out.println("Sorry You Registered Already");
            }
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(Reg_Database.class.getName()).log(Level.SEVERE, null, ex);
                out.println("Nigga");
            }
            
    }
    
    public boolean Very(String User) throws ClassNotFoundException, SQLException{
        String database = "jdbc:mysql://localhost:3306/Services";
        String user = "root";
        String password = "Silvabeth12";
        
        String mysql = "Select * from Login_Table where User_Name = '"+User+"'";
        Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(database, user, password);
            Statement stm = con.createStatement();
            ResultSet result = stm.executeQuery(mysql);
            boolean rst;
            if (result.next()==true){
            rst = true;
            con.close();
            }else {
            rst = false;
            con.close();
            }
            
        return rst;
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
