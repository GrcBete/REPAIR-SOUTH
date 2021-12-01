<%-- 
    Document   : BankPayment
    Created on : Sep 23, 2021, 9:27:55 PM
    Author     : GSSB
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@100&display=swap" rel="stylesheet">
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
        <div class="contain" >
            <div class="book" style="width:100%">
                
                <div class="description">
                    <h1>Payment</h1>
                </div>
                <div class="form">
                    <form action="Booking" method="post">
                        <div class="inpbox" style="width:50%; margin-left: 300px; margin-right: 300px">
                            Owner:
                            <input name="name" type="text" style="width:100%"><br>
                            CVV:
                            <input name="cvv" type="text" style="width:100%"><br>
                            Card No:
                            <input name="cardNo" type="text" style="width:100%"><br>
                            Expiry date:
                            <div>
                            <select name="months" id="months">
                                <option value="Jan">Jan</option>
                                <option value="Feb">Feb</option>
                                <option value="Mar">Mar</option>
                                <option value="Apr">Apr</option>
                                <option value="May">May</option>
                                <option value="Jun">Jun</option>
                                <option value="Jul">Jul</option>
                                <option value="Aug">Aug</option>
                                <option value="Sep">Sep</option>
                                <option value="Oct">Oct</option>
                                <option value="Nov">Nov</option>
                                <option value="Dec">Dec</option>    
                            </select>
                            <select name="years">
                                <option value="2030">2030</option>
                                <option value="2029">2029</option>
                                <option value="2028">2028</option>
                                <option value="2027">2027</option>
                                <option value="2026">2026</option>
                                <option value="2025">2025</option>
                                <option value="2024">2024</option>
                                <option value="2023">2023</option>
                                <option value="2022">2022</option>
                                <option value="2021">2021</option>
                                <option value="2020">2020</option>
                            </select>
                        </div><br>
                        <div class="cards">
                            <a href="https://www.mastercard.co.za/en-za/personal/find-a-card.html"> <img name="linkedImg" src="MasterCard_Logo.svg.png" alt="" style="width:150px;height:100px;"></a>
                            <a href="https://www.visa.co.za/"><img  name="" src="Visa_Logo.png" alt="" style="width:150px;height:100px;"></a>
                            <a href="https://paypal.com/"><img src="Paypal_Logo.png" alt="" style="width:150px;height:100px;"></a>         
                        </div><br>
                        </div>
                        
                     <button type="submit" class="subtn btn">Purchase</button>
                    </form>
                </div>
            </div>
        </div>
        </main>
    </body>
</html>
