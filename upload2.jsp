<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>

<%@ page import="java.sql.*,databaseconnection.*"%>




<html>
<head>
</head>
<body>
<%

ArrayList list = new ArrayList();
		ServletContext context = getServletContext();

		String dirName =context.getRealPath("\\Gallery");
		String paramname=null;
		String file=null;
		String a=null,b=null,c=null,d=null,ee=null,fg=null,image=null;
	String bin = "";
		FileInputStream fs=null;
 
		File file1 = null;
			
		
		try {
			
			MultipartRequest multi = new MultipartRequest(request, dirName,	10 * 1024 * 1024); // 10MB

			Enumeration params = multi.getParameterNames();
			while (params.hasMoreElements()) 
			{
				paramname = (String) params.nextElement();
				if(paramname.equalsIgnoreCase("ccc"))
				{
					a=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("name"))
				{
					b=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("age"))
				{
					c=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("hair"))
				{
					d=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("race"))
				{
					ee=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("personal"))
				{
					fg=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("userImage"))
				{
					image=multi.getParameter(paramname);
				}
				
				}
					
			int f = 0;
	Enumeration files = multi.getFileNames();	
	while (files.hasMoreElements()) 
	{
		paramname = (String) files.nextElement();
		if(paramname.equals("d1"))
		{
			paramname = null;
		}
		
		if(paramname != null)
		{
			f = 1;
			image = multi.getFilesystemName(paramname);
			String fPath = context.getRealPath("\\Gallery\\"+image);
			file1 = new File(fPath);
			fs = new FileInputStream(file1);
			list.add(fs);
			
			
				
		String ss=fPath;
		FileInputStream fis = new FileInputStream(ss);
		StringBuffer sb1=new StringBuffer();
		 int i = 0;
         while ((i = fis.read()) != -1) {
                 if (i != -1) {
                       //System.out.println(i);
						 String hex = Integer.toHexString(i);
						// session.put("hex",hex);
						 sb1.append(hex);
						// sb1.append(",");
						
    String binFragment = "";
    int iHex;
 

    for(int i1= 0; i1 < hex.length(); i1++){
        iHex = Integer.parseInt(""+hex.charAt(i1),16);
        binFragment = Integer.toBinaryString(iHex);

        while(binFragment.length() < 4){
            binFragment = "0" + binFragment;
        }
        bin += binFragment;
		//System.out.print(bin);
		}
                 }
			
			
    }
			
			
			
			
			
			
		}		
	}
	
	        FileInputStream fs1 = null;
            //name=dirName+"\\Gallery\\"+image;
			int lyke=0;
			//String as="0";
			
 Connection con = databasecon.getconnection();
 PreparedStatement ps=con.prepareStatement("insert into fileupload(genders,names,ages,hairs,races,personals,imagess,count,binaryimage) values(?,?,?,?,?,?,?,?,?)");
				ps.setString(1,a);
               	ps.setString(2,b);
				ps.setString(3,c);	
       			ps.setString(4,d);
       			ps.setString(5,ee);
			    ps.setString(6,fg);
			 ps.setBinaryStream(7, (InputStream)fs, (int)(file1.length()));
				ps.setInt(8,lyke);
				ps.setString(9,bin);				
				
       if(f == 0)
			ps.setObject(7,null);
		else if(f ==7)
		{
			fs1 = (FileInputStream)list.get(0);
			ps.setBinaryStream(7,fs1,fs1.available());
		}	
			int x=ps.executeUpdate();
		
			response.sendRedirect("index.jsp?success");
			
				
		} 
		catch (Exception e) 
		{
			out.println(e.getMessage());
		}
	
 %>
</body>
</html>

