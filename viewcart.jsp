<%@page import="Controller.javaconnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
    <title>Orders</title>
 <meta charset="utf-8">
 
<!--CSS-->
<link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<link rel="stylesheet" type="text/css" href="css/responsive.css"/>
<link rel="stylesheet" type="text/css" href="css/res.css"/>
    
</head>
<body>
<section class="sec">
<header>
  <div class="container">
    <div class="row clearfix" id="home">
      <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
        <div class="logo">
          <h1> <a href="try.jsp"><img src="images/logo2.png" alt="" /></a> </h1>
        </div>
      </div>
      <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
        <div class="contact">
            <p>Call us At :<span class="number"><a href="#">+975-1733-7579</a></span>
        </div>
      </div>
    </div>
  </div>
</header>
    
<section class="saction1">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 col-md-12 col-sm-12">
        <div class="menu">
          <div class="mobile-nav-container"> </div>          
            <nav>
            <ul>
              <li><a href="try.jsp">Home</a></li>
              <li><a href="restaurant.jsp">Popular Restaurants </a></li>
              <li><a href="order.jsp">Order </a></li>
              <li><a href="#contact">Contact</a></li>
            </ul>
          
            </nav>
        </div>
        <div class="login">
          <ul>
            <li><a href="viewcart.jsp" ><img src="images/vc.png" alt="cart" style="width:150px; height: 30px;"></a></li>
            <li><a id="log" href="signup.jsp">Logout</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</section>
</section>    

<section id="vc">    
<div>
      <table id="tabb">
               <tr>
                   <th>Item Name</th>
                   <th>Quantity</th>
                   <th>Price</th>
               </tr>
              
       <% 
           PrintWriter pw=response.getWriter();
           double sum=0;
           Connection conn=javaconnect.connectDb();
           Statement st=conn.createStatement();
           ResultSet rs;
           String[] str;
           str=request.getParameterValues("chk1");
           /*for(int i=0;i<sports.length;i++){
               System.out.print(sports[i]+" ");
           }*/
           float count=0;
           if(str!=null){
               for(int i=0;i<str.length;i++){
                   //System.out.print(sports[i]+" ");
                   st.executeQuery("select Dishes,Price from orderCart where ID="+str[i]+"");
                   rs=st.getResultSet();
                   while(rs.next()){
                       String nameVal = rs.getString("Dishes");
                       //System.out.print(nameVal);
                       int c=rs.getInt("Price");
           
               sum+=c;
               System.out.print(sum);
               int q=1;
               count++;%>
               <tr><td><%= rs.getString("Dishes")%></td>
                   <td><%=q%></td>
                   <td><%= rs.getInt("Price")%></td>
               </tr>
               <%
              }}%>
              <tr style="font-size: 1.75vw;font-weight: bolder;">
                  <td>Total</td>
                  <td><%= count%></td>
                  <td><%= sum%></td>
              </tr>
              <% }%>
      </table>
      
      <a href="confirm.jsp">
          <input type="submit" value="Checkout" id="sb">
      </a>
      </div>
</section>
    
 <!-- Footer -->
<footer class="saction8">
  <div class="container" id="contact">
    <div class="row">
    
        <div class="col-lg-3 col-md-3 col-sm-3">
        <div class="site">
          <h3>Contact Us</h3>
        </div>
        <div class="sitelink">
          <ul>
            <li> <span>&#10152;</span><a>Bumthang,Bhutan</a></li>
            <li><span>&#10152;</span><a>Chumey,Bumthang</a></li>
            <li><span>&#10152;</span><a>+975-17337579</a></li>
          </ul>
        </div>
      </div>
        
      <div class="col-lg-3 col-md-3 col-sm-3">
        <div class="follow">
          <h3>Follow Us On...</h3>
        </div>
        <div class="social">
          <ul>
            <li> <i class="fa fa-facebook-square"></i><a href="#">Facebook</a></li>
            <li><i class="fa fa-twitter-square"></i><a href="#">Twitter</a></li>
            <li><i class="fa fa-linkedin-square"></i><a href="#">Linkedin</a></li>
            <li><i class="fa fa-google-plus-square"></i><a href="#">Google Plus</a></li>
          </ul>
        </div>
      </div>
      <div class="col-lg-3 col-md-3 col-sm-3">
        <div class="submit">
          <h3>Subscribe Newsletter</h3>
          <p>To get latest updates and food deals
            every week</p>
        </div>
        <div class="submitbox">
          <input type="text" />
          <div class="sub"> <a href="#">Submit</a> </div>
        </div>
      </div>
    </div>
  </div>
</footer>
<!-- Footer -->      
</body>
</html>