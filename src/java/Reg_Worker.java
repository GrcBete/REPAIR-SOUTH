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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author GSSB
 */
public class Reg_Worker extends HttpServlet {

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
            out.println("<title>Servlet Reg_Worker</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Reg_Worker at " + request.getContextPath() + "</h1>");
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
        String service = request.getParameter("service");
        String full_name = request.getParameter("full_name");
        String email = request.getParameter("email");
        String location = request.getParameter("location");
        String birth = request.getParameter("birth");
        String phone = request.getParameter("phone_number");        
        String database = "jdbc:mysql://localhost:3306/Services?allowPublicKeyRetrieval=true&useSSL=false";
        String user = "root";
        String password = "Silvabeth12";
        
        
        try {
            boolean very = Ver(name);
            //.out.println(very);
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(database, user, password);
            Connection con1 = DriverManager.getConnection(database, user, password);
            Connection con2 = DriverManager.getConnection(database, user, password);
            String mysql = "Select * from Worker_Info where User_Name = '"+name+"'";
            if (very==false){
            Add(name,pass);
            PreparedStatement pst = con.prepareStatement("insert into Worker_Info ( User_Name, Full_Name, Email, Location, Date_of_Birth, Phone_Number,Name_of_Service) values(?,?,?,?,STR_TO_DATE(?, '%Y-%m-%d'),?,?)");
            pst.setString(1,name);
            
            pst.setString(2,full_name);
            pst.setString(3,email);
            pst.setString(4,location);
            pst.setString(5,birth);
            pst.setString(6,phone);
            pst.setString(7,service);
            pst.executeUpdate();
            con.close();
            PreparedStatement pst1 = con1.prepareStatement(mysql);
            ResultSet result = pst1.executeQuery();
            if (result.next()){
            int id = result.getInt(1);
            PreparedStatement pst2 = con2.prepareStatement("insert into Rating ( Worker_Id, Rating) values(?,?)");
            pst2.setInt(1,id);
            pst2.setInt(2,0);
            pst2.executeUpdate();
            con2.close();
            }
            
            response.sendRedirect("Login-Form.jsp");
            }else{
                RequestDispatcher rd=request.getRequestDispatcher("/index.html");  
        rd.include(request, response);  
            out.println("<a>Your User Name is in already</a>");
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Reg_Worker.class.getName()).log(Level.SEVERE, null, ex);
            out.println("Nigga");
        }
        
        
        
    }
    
    public boolean Ver(String name) throws ClassNotFoundException, SQLException{
        String database = "jdbc:mysql://localhost:3306/Services";
        String user = "root";
        String password = "Silvabeth12";
        
        String mysql = "Select * from Worker_Info where User_Name = '"+name+"'";
        String mysql1 = "Select * from Login_Table where User_Name = '"+name+"'";
        Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(database, user, password);
            Statement stm = con.createStatement();
            Connection conn = DriverManager.getConnection(database, user, password);
            Statement stmt = conn.createStatement();
            ResultSet result = stm.executeQuery(mysql);
            ResultSet result1 = stmt.executeQuery(mysql1);
            boolean rst;
            
            if ((result.next()==true) && (result1.next()==true)){
            rst = true;
            conn.close();
            con.close();
            }else{
            rst = false;
            conn.close();
            con.close();
            }
            
        return rst;
    }
    
    public void Add(String Name, String PassWord) throws ClassNotFoundException, SQLException{
        String database = "jdbc:mysql://localhost:3306/Services";
        String user = "root";
        String password = "Silvabeth12";
        
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(database, user, password);
        PreparedStatement pst1 = conn.prepareStatement("insert into Login_Table (User_Name, Password, User_Type) values(?,?,?)");
            pst1.setString(1,Name);
            pst1.setString(2,PassWord);
            pst1.setString(3,"Worker");
            pst1.executeUpdate();
            conn.close();
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
