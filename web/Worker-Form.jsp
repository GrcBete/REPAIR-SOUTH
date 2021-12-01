<%-- 
    Document   : Worker-Form
    Created on : Sep 10, 2021, 2:03:14 PM
    Author     : GSSB
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                        <h2>Repair South</h2>
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
                            <i class="bx bx-bookmark bx-md"></i>
                            <a href="Booking-Form.jsp" >Booking</a>
                        </li>
                    </ul>
                    
                </nav> 
            </div>
        </header>
        <main>
        <div class="contain">
            <div class="book">
                
                <div class="description">
                    <h1><i class="bx bx-detail bx-md"></i>Workers Registration</h1>
                <p>We will need your personal information.</p>
                </div>
                <div class="form">
                    <form action="Reg_Worker" method="post">
                        
                        <div class="inpbox full">
                            <i class="bx bx-book-open bx-md"></i>
                            <select name="service">
                                <option>Select Service You will be providing</option>
                                <option>Mechanic Repair</option>
                                <option>Computer Repair</option>
                                <option>Electrical Repair</option>
                            </select>
                        </div>
                        <div class="inpbox">
                            <i class="bx bx-user-circle bx-md"></i>
                            User Name:
                            <input type="text" placeholder="Select a User Name" name="user_name">
                        </div>
                        <div class="inpbox">
                            <i class="bx bx-lock bx-md"></i>
                            <input type="text" placeholder="Select Password" name="password">
                        </div>
                        <div class="inpbox">
                            <i class="bx bx-user bx-md"></i>
                            <input type="text" placeholder="Full Name" name="full_name">
                        </div>
                        <div class="inpbox">
                            <i class="bx bx-mail-send bx-md"></i>
                            <input type="email" placeholder="Enter Email" name="email">
                        </div>
                        <div class="inpbox">
                            <i class="bx bx-current-location bx-md"></i>
                            <input type="text" placeholder="Select Location" name="location">
                        </div>
                        <div class="inpbox">
                            <i class="bx bx-calendar bx-md"></i>
                            <input type="date"  name="birth">
                        </div>
                        <div class="inpbox">
                            <i class="bx bx-phone bx-md"></i>
                            <input type="text" placeholder="Enter your cell phone number" name="phone_number">
                        </div>
                        
                        <button type="submit" class="subtn btn">Submit</button>
                    </form>
                    <form>
                     <button class="rst btn">Reset</button>   
                    </form>
                    
                </div>
            </div>
        </div>
        </main>
    </body>
</html>
