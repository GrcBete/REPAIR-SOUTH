<%-- 
    Document   : Booking-Form
    Created on : Sep 7, 2021, 5:11:23 PM
    Author     : GSSB
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Mechanic Booking</title>
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
                    <a href="index.jsp" class="logo">
                        <h2>Repair South</h2>
                    </a>

                    
                    
                    <ul >
                        <li>
                            <i class="bx bx-home bx-md"></i>
                            <a href="index.jsp" >Home</a>
                        </li>
                        <%
                        session=request.getSession(false);
                        String name=(String)session.getAttribute("user_name"); 
                        if(name==null){%>
                        
                        <li>
                            <i class="bx bx-info-circle bx-md"></i>
                            <a href="" >About</a>
                        </li>
                        
                            <li class="dropdown">
                            <i class="bx bx-bookmark bx-md"></i>
                            <a class="dropbtn">Booking</a>
                            <div class="dropdown-content">
                            <a href="Mechanic-Book.jsp">Mechanic Repairs</a>
                            <a href="Computer-Book.jsp">Computer Repairs</a>
                            <a href="Electrical-Book.jsp">Electrical Repairs</a>
                            </div>
                            </li>
                            
                                                   
                        <li class="dropdown">
                            <i class="bx bx-user-circle bx-md"></i>
                            <a class="dropbtn">Sign-Up</a> 
                            <div class="dropdown-content">
                            <a href="Login-Form.jsp" >Sign-Up as a Client</a> 
                            <i class="bx bx-user-plus bx-md"></i>
                            <a href="Worker-Form.jsp" >Become a Worker</a>
                            </div>
                        </li>
                        
                        <%} else { 
                        %>
                        <li>
                            <i class="bx bx-user bx-md"></i>
                            <a href="" ><%=name%></a>
                        </li>
                        
                        <li class="dropdown">
                            <i class="bx bx-bookmark bx-md"></i>
                            <a class="dropbtn">Booking</a>
                            <div class="dropdown-content">
                            <a href="Mechanic-Book.jsp">Mechanic Repairs</a>
                            <a href="Computer-Book.jsp">Computer Repairs</a>
                            <a href="Electrical-Book.jsp">Electrical Repairs</a>
                            </div>
                            </li>
                        
                        <li>
                            <i class="bx bx-log-out-circle bx-md"></i>
                            <a href="SignOut">Logout</a>
                        </li>
                        
                        <%}%>
                    </ul>
                    
                </nav> 
            </div>
        </header>
        
        <main>
        <div class="contain">
            <div class="book">
                
                <div class="description">
                    <h1>Book your Mechanic Repair Service</h1>
                <p>We are here to provide you wit the best services and the best 
                prices.</p>
                    
                </div>
                <div class="form" >
                    <form action="GetValues" method="post">
                        
                        <div class="inpbox">
                            <i class="bx bx-car bx-md"></i>
                            <input value="Mechanic Repair"  name="service" readonly>
                        </div>
                        
                        
                        <div class="inpbox">
                            <i class="bx bx-current-location bx-md"></i>
                            <input type="text" placeholder="Select Location" name="location">
                        </div>
                        <div class="inpbox">
                            <i class="bx bx-calendar bx-md"></i>Date
                            <input type="date" placeholder="YYYY-MM-DD" name="date">
                        </div>
                        <div class="inpbox">
                            <i class="bx bx-email bx-md"></i>
                            <input type="email" placeholder="Enter Email" name="email">
                        </div>
                        
                        
                        <div class="inpbox full" >
                            <div class="inrbox">
                            <i class="bx bx-car bx-md">One-Time</i>
                            <input type="radio" name="price" value="250" id="priceOne">
                            <label for="priceOne">R250</label><br>
                            <i class="bx bx-car bx-md">Regular</i>
                            <input type="radio" name="price" value="200" id="priceRe">
                            <label for="priceRe">R200</label>
                            </div>
                        </div> 
                        <input name="booking" value="Mechanic-Book" hidden>  
                     <button type="submit" class="subtn btn" >Next</button>
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
