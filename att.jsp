<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style.css" />
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
<div id="heading"><h3>SCALABLE IMAGE RETRIVAL USING ATTRIBUTE ENHANCED SPARSE CODEWORDS</h3></div>
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
<div id="div1">
<ul>
<li><form name="s" method="post"  action="gender.jsp" onSubmit="return valid()">
<table id="tab" align="left">
<tr><td><b>Gender:</b></td><td><select id="ccc" name="ccc" style="width:100%">
												<option value="0">select</option>
												<option>Male</option>
												<option>Female</option>
										</select></td></tr>
<tr><td></td><td><input type="submit" value="Search" id="button1">&nbsp;&nbsp;<input type="reset" value="clear" id="button2"></td></tr>
</table></form></li>
<form name="s" method="post"  action="hair.jsp" onSubmit="return valid()">
<li><table id="tab" align="center">
<tr><td><b>Haircolor:</b></td><td><select id="hair" name="hair" style="width:100%">
												<option value="0">select</option>
												<option>Blond hair</option>
												<option>Black hair</option>
												<option>Gray hair</option>
										</select></td></tr>
<tr><td></td><td><input type="submit" value="Search" id="button1">&nbsp;&nbsp;<input type="reset" value="clear" id="button2"></td></tr>
</table>
</form></li><li>
<form name="s" method="post"  action="race.jsp" onSubmit="return valid()">
<table id="tab" align="right">
<tr><td><b>Race:</b></td><td><select id="race" name="race" style="width:100%">
												<option value="0">select</option>
												<option>White</option>
												<option>Asian</option>
												<option>Indian</option>
										</select></td></tr>
<tr><td></td><td><input type="submit" value="Search" id="button1">&nbsp;&nbsp;<input type="reset" value="clear" id="button2"></td></tr>
</table>
</form></li></ul>
</div>
<!--<div id="vline"></div>-->
<br><br><br><br><br><br><br>
<div id="div2" style="float:right">
<%    
    int cn=0;
  try{      
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
<br><br>
<div id="footer">
Copyright 2010-2014 iCopyright, Inc.
The iCopyright logo is a registered trademark.
Privacy Policy
Terms of Use.
</div>
</body>
</html>