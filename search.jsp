<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script language="javascript" type="text/javascript">



function valid()
{


var na4=document.s.name.value;
if(na4=="")

{
alert("please er search image");
document.s.name.focus();
return false;
}

}

</script>

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
<h3>ImageSearch:</h3>
<form name="s" method="post"  action="search1.jsp" onSubmit="return valid()">
<table id="tab" align="center">
<tr><td><b>Name:</b></td>
<td><input type="text" name="name" id="name"></td></tr>
<tr><td></td><td><input type="submit" id="button1" value="Submit">&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" id="button2" value="Clear" ></td></tr>
</table>
</form>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<div id="midright">
<%
  try{  
  int cn=0;    
    Connection con = databasecon.getconnection();
    Statement stmt=con.createStatement();
    String strQuery = "select id from fileupload ORDER BY Rand()";
    ResultSet rs = stmt.executeQuery(strQuery);
    while(rs.next()){
	cn++;
       %>
     
     

<input type="image" src="images.jsp?imgid=<%=rs.getInt(1)%>" width="100" height="100" alt="Submit" >

 

      <%
	   if(cn==13)
	{
	break;
	}
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
</div>
</div>
<br><br><br>
<div id="footer">
Copyright 2010-2014 iCopyright, Inc.
The iCopyright logo is a registered trademark.
Privacy Policy
Terms of Use.
</div>
</body>
</html>