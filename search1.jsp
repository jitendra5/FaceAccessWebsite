<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
<div id="heading"><h3>SCALABLE IMAGE RETRIVAL USING ATTRIBUTE ENHANCED SPARSE KEYWORDS</h3></div>
<div id="links">
<ul>
<li><a href="index.jsp"><b>HOME</b></a></li>
<li><a href="upload.jsp"><b>IMAGEUPLOAD</b></a></li>
<li><a href="search.jsp"><b>SEARCH</a></b></li>
<li><a href="gallery.jsp"><b>GALLERY</a></b></li>
<li><a href="face.jsp"><b>ATTRIBUTE EMBEDED SEARCH</b></a></li>
<li><a href="att.jsp"><b>ATTRIBUTE BASED SEARCH</a></b></li>
</ul>
</div>
<br><br>
<div id="middle">
<div id="midleft">
<img src="123.jpg" width="300" height="300" alt="image" class="pic" />
</div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<div id="vline"></div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<div id="midright">
<%
	String a=request.getParameter("name");
	String s1=null,s2=null,s3=null,s4=null,s5=null,s6=null,s7=null,s8=null;
  try{      
   Connection con = databasecon.getconnection();
    Statement stmt=con.createStatement();
String strQuery = "select id,genders,hairs,races,personals,ages,names,count from fileupload where names like'"+'%'+a+'%'+ "' ORDER BY Rand()";
    ResultSet rs = stmt.executeQuery(strQuery);
    if(rs.next()){
	s1=rs.getString(2);
	s2=rs.getString(3);
	s3=rs.getString(4);
	s4=rs.getString(5);
	s5=rs.getString(6);
	s6=rs.getString(7);
	s7=rs.getString(8);
	s8=rs.getString(1);
	session.setAttribute("s8",s8);
	session.setAttribute("s7",s7);
       %>
     
     

<a href="search3.jsp?<%=s6%>"><input type="image" src="images.jsp?imgid=<%=rs.getInt(1)%>" width="100" height="100" alt="Submit"></a>&nbsp; <blink>Click An Image</blink>

 

      <%
	 
    }
    rs.close();
    con.close();
    stmt.close();
  }
  catch(Exception e)
  {
    e.getMessage();
  }
  %>
  <br>
  <font color="#009900" size="+2">Attribute Detection</font><br>
<font color="#009900" size="+1">Gender:</font> &nbsp;<font color="#000000" size="+1"><%=s1%></font><br>
<font color="#009900" size="+1">Hair:</font> &nbsp;<font color="#000000" size="+1"><%=s2%></font><br>
<font color="#009900" size="+1">Race:</font> &nbsp;<font color="#000000" size="+1"><%=s3%></font><br>
<font color="#009900" size="+1">Personal Features:</font> &nbsp;<font color="#000000" size="+1"><%=s4%></font><br>
<font color="#009900" size="+1">Age level:</font> &nbsp;<font color="#000000" size="+1"><%=s5%></font><br>
</div>
</div>
<br><br><br><br>
<div id="footer">
Copyright 2010-2014 iCopyright, Inc.
The iCopyright logo is a registered trademark.
Privacy Policy
Terms of Use.
</div>
</body>
</html>