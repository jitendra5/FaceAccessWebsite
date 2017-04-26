<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style.css" />

<script language="javascript" type="text/javascript">



function valid()
{

if(document.s.ccc.selectedIndex==0)
{
alert("Select Gender");
return false;
}



var na3=document.s.name.value;
if(na3=="")

{
alert("please enter image name");
document.s.name.focus();
return false;
}

if(document.s.age.selectedIndex==0)
{
alert("Select age level");
return false;
}

if(document.s.hair.selectedIndex==0)
{
alert("Select hair color");
return false;
}
if(document.s.race.selectedIndex==0)
{
alert("Select race");
return false;
}
if(document.s.personal.selectedIndex==0)
{
alert("Select personal features");
return false;
}
var na4=document.s.image.value;
if(na4=="")

{
alert("please choose image");
document.s.image.focus();
return false;
}

}

</script>


<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<style>
article, aside, figure, footer, header, hgroup,
menu, nav, section { display: block; }
</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script>
function readURL(input) {
if (input.files && input.files[0]) {
var reader = new FileReader();

reader.onload = function (e) {
$('#img_prev')
.attr('src', e.target.result)
.width(150)
.height(200);
};

reader.readAsDataURL(input.files[0]);
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
<form name="s" method="post" enctype="multipart/form-data" action="upload2.jsp" onSubmit="return valid()">
<table align="center" width="80%" height="300px" id="tab1"> 
<tr>
	<td>
	<font color="black" size="+1">Gender:*</font>
	</td>
	<td>
	<select id="ccc" name="ccc" style="width:20%">
												<option value="0">select</option>
												<option>Male</option>
												<option>Female</option>
										</select>
	</td>
	</tr>
	<tr>
	<td>
	<font color="black" size="+1">Name:*</font>
	</td>
	<td>
	<input type="text" id="name" name="name" style="width:20%"> 
	</td>
	</tr>
	<tr>
	<td>
	<font color="black" size="+1">Age Level:*</font>
	</td>
	<td>
	<select id="age" name="age" style="width:20%">
												<option value="0">select</option>
												<option>Youth</option>
												<option>Senior</option>
										</select>
	</td>
	</tr>
	
	<tr>
	<td>
	<font color="black" size="+1">Hair Color:*</font>
	</td>
	<td>
	<select id="hair" name="hair" style="width:20%">
												<option value="0">select</option>
												<option>Blond hair</option>
												<option>Black hair</option>
												<option>Gray hair</option>
										</select>
	</td>
	</tr>
	<tr>
	<td>
	<font color="black" size="+1">Races:*</font>
	</td>
	<td>
	<select id="race" name="race" style="width:20%">
												<option value="0">select</option>
												<option>White</option>
												<option>Asian</option>
												<option>Indian</option>
										</select>
	</td>
	</tr>
	
	<tr>
	<td>
	<font color="black" size="+1">Personal Features:</font>
	</td>
	<td>
	<select name="personal" id="personal" style="width:20%">
	<option value="0">select</option>
<option>Receding hairline</option>
<option>Bald</option>
<option>Double chain</option>
<option>No mustache</option>
<option>No beard</option>
<option>No eyewear</option>
<option>Bushy eyebrows</option>
</select>
	</td>
	</tr>
	<tr>
	<td>
	<font color="black" size="+1">ChooseFile:*</font>
	</td>
	<td>
	<input type="file" id="userImage" name="image" style="width:35%" onchange="readURL(this);" > <img id="img_prev" src="#" alt="your image" width="50px" height="50px"/>
	
	
	</td>
	</tr>
	
	<tr>
	<td></td>
	<td><input type="submit" value="Upload" id="button1">&nbsp;&nbsp;<input type="reset" value="clear" id="button2"></td>
										</tr>
</table>
</form>

</div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<!--<div id="vline"></div>-->
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<div id="div2">
 <%
 try{      
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/face","root","admin");
    Statement stmt=con.createStatement();
    String strQuery = "select id from fileupload ORDER BY Rand()";
    ResultSet rs = stmt.executeQuery(strQuery);
    while(rs.next()){
       %>
     
     

<input type="image" src="images.jsp?imgid=<%=rs.getInt(1)%>" width="50" height="50" alt="Submit" >

 

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