<%-- 
    Document   : WorkerBooked
    Created on : Sep 18, 2021, 7:52:00 PM
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
        <style>
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: oldlace;
}

li {
  float: left;
}

li a, .dropbtn {
  display: inline-block;
  color: black;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover, .dropdown:hover .dropbtn {
  background-color: wheat;
}

li.dropdown {
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: oldlace;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {background-color: wheat;}

.dropdown:hover .dropdown-content {
  display: block;
}
</style>
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
                        <li class="dropdown">
                            <i class="bx bx-bookmark bx-md"></i>
                            <a href="Booking-Form.jsp" class="dropbtn">Booking</a>
                            <div class="dropdown-content">
                            <a href="Computer-Book.jsp">Computer Repairs</a>
                            <a href="Electrical-Book.jsp">Electrical Repairs</a>
                            </div>
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
                    <h1>Choose the Person you like the most</h1>
                </div>
                
                <div class="form">
                    <form action="Booking" method="post">
                        <div class="inpbox">
                            <i class="bx bx-car bx-md"></i>
                            <input value="Mechanic Repair"  name="service" readonly>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        </main>
    </body>
</html>
