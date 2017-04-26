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
<div id="middle1">
<div id="div1">
<form name="s" method="post" enctype="multipart/form-data" action="face2.jsp" onSubmit="return valid()">
	<table align="center" width="80%"  id="tab1">
	
	
	
	<tr>
	<td>
	<font color="black" size="+1">Choose File:*</font>
	</td>
	<td>
	<input type="file" id="userImage" name="image" style="width:35%" onchange="readURL(this);" > 
	<!--<img id="img_prev" src="#" alt="your image" width="50px" height="50px" />-->
	
	
	</td>
	</tr>
	
	<tr>
	<td></td>
	<td><input type="submit" value="Search" id="button1"><input type="reset" value="clear" id="button2"></td>
										</tr>
	</table>
</form>
</div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
<br><br><br><br><br><br>
<div id="footer">
Copyright 2010-2014 iCopyright, Inc.
The iCopyright logo is a registered trademark.
Privacy Policy
Terms of Use.
</div>
</body>
</html>
