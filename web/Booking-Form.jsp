<%-- 
    Document   : Booking-Form
    Created on : Sep 7, 2021, 5:11:23 PM
    Author     : GSSB
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
Class.forName("com.mysql.jdbc.Driver");   
Connection conn;
Statement smt;
PreparedStatement pst;
ResultSet result;
ResultSet result1;
%>
<!DOCTYPE html>
<html>
    <head>
        <title>All Products -Tech Jump</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="book.css" type="text/css"/>
        <link rel="stylesheet" href="style.css" type="text/css"/>
        <link rel="stylesheet" href="Design.css" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css">
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body>
        <header class="header">
            <div class="container">
                <nav class="nav">
                    <!--Logo-->
                    <a href="index.html" class="logo">
                        <img src="Image">
                    </a>

                    <!--Ancors from Nan Bar-->
                    <ul >
                        <li>
                            <i class="bx bx-home bx-md"></i>
                            <a href="index.html" >Home</a>
                        </li>
                        <li>
                            <i class="bx bx-info-circle bx-md"></i>
                            <a href="" >About</a>
                        </li>
                        <li>
                            <i class="bx bx-user-circle bx-md"></i>
                            <a href="Login-Form.jsp" >Sign-in</a>
                        </li>
                    </ul>
                    
                </nav> 
            </div>
            
            
        </header>
        
        <main>
        <div class="contain">
            <div class="book">
                
                <div class="description">
                    <h1>Book your Service</h1>
                <p>We are here to provide you wit the best services and the best 
                prices.</p>
                    <ul>
                        <li>Services</li>
                        <li>Hello</li>
                    </ul>
                </div>
                <div class="form">
                    <form>
                        <div class="inpbox">
                            <i class="bx bx-user bx-md"></i>
                            <input type="text" placeholder="Users Name" name="">
                        </div>
                        <div class="inpbox full">
                            <i class="bx bx-book-open bx-md"></i>
                            <select name="service">
                                <option>Select Service</option>
                                <option>Mechanic Services</option>
                                <option>Computer Repairs</option>
                                <option>Electrical Repairs</option>
                            </select>
                        </div>
                        <div class="inpbox">
                            <i class="bx bx-current-location bx-md"></i>
                            <input type="text" placeholder="Select Location" name="">
                        </div>
                        <div class="inpbox">
                            <i class="bx bx-calendar bx-md"></i>Date
                            <input type="type" placeholder="YYYY-MM-DD" name="date">
                        </div>
                        <div class="inpbox">
                            <i class="bx bx-email bx-md"></i>
                            <input type="email" placeholder="Enter Email" name="">
                        </div>
                        
                        <%
        String service = request.getParameter("service");
        String database = "jdbc:mysql://localhost:3306/Services";
        String user = "root";
        String password = "Silvabeth12";
        String mysql = "Select * from service where Name_Service = '"+service+"'";
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(database, user, password);
        smt = conn.createStatement();
        result = smt.executeQuery(mysql);
        if (result.next()){
            pst = conn.prepareStatement(mysql);
            result1 = pst.executeQuery();
            while (result1.next()){
            int price = result.getInt(2);
            
        %>
                        
                        <div class="inpbox full">
                            <div class="inrbox">
                            <i class="bx bx-car bx-md">One-Time</i>
                            <input type="radio" name="">
                            <h2>R300</h2>
                            </div>
                            <div class="inrbox">
                            <i class="bx bx-car bx-md">Regular</i>
                            <input type="radio" name="">
                            <h2>R250</h2>
                            </div>
                        </div> 
        <% }} %>
                        
                    </form>
                    <button class="subtn btn">Submit</button>
                    <button class="rst btn">Reset</button>
                </div>
            </div>
        </div>
        </main>
    </body>
</html>
