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
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author GSSB
 */
public class Booking extends HttpServlet {

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
            out.println("<title>Servlet Booking</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Booking at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session=request.getSession(false);
        String name = (String)session.getAttribute("user_name");
        String location = (String)session.getAttribute("location");
        String date = (String)session.getAttribute("date");
        String email = (String)session.getAttribute("email");
        String price = (String)session.getAttribute("price");
        String service = (String)session.getAttribute("service");
        String booking_type = (String)session.getAttribute("booking_type");
        String Worker_ID = (String)session.getAttribute("Worker_ID");
        
        String database = "jdbc:mysql://localhost:3306/Services?allowPublicKeyRetrieval=true&useSSL=false";
        String user = "root";
        String password = "Silvabeth12";
        
        try {
            if (name!=null){
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(database, user, password);
            PreparedStatement pst = con.prepareStatement("insert into Booking_Details (User_Name, Location, Date_of_Booking, Name_of_Service, Worker_Id,Email ) values(?,?,STR_TO_DATE(?, '%Y-%m-%d'),?,?,?)");
            pst.setString(1,name);
            pst.setString(2,location);
            pst.setString(3,date);
            pst.setString(4,service);
            pst.setInt(5,Integer.parseInt(Worker_ID));
            pst.setString(6,email);
            pst.executeUpdate();
            con.close();
            //session.removeAttribute("user_name");
            session.removeAttribute("location");
            session.removeAttribute("date");
            session.removeAttribute("email");
            session.removeAttribute("price");
            session.removeAttribute("service");
            session.removeAttribute("booking_type");
            //session.removeAttribute("Worker_ID");
            
            response.sendRedirect("ShowS.jsp");
            } 
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Booking.class.getName()).log(Level.SEVERE, null, ex);
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
