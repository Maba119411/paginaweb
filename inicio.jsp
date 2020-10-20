<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>

<%@page import="javax.sql.*" %>

<%@page import="java.sql.Connection" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%


String username=request.getParameter("Username");
String password=request.getParameter("Password");

Class.forName("com.mysql.jdbc.Driver");

Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto","root","1234");

Statement st=con.createStatement();

String query="select Username, Password, Email, Telephone "; 
query += "from Usuarios where Username = '"+username+"' and password = '"+password+"'";

//out.println(query);
ResultSet rs=st.executeQuery(query);
int encontrado = 0;
String name;
while(rs.next())
{
encontrado=1;
 name = rs.getString(1);
 session.setAttribute( "theName", name );
 
out.println("Bienvenido :" + rs.getString(1) );

}
	
if (encontrado==1)
{      	  
	response.sendRedirect("session.jsp?Username='<%request.getParameter('Username')%>'");
	   //session.setAttribute( "theName", name);
	
}
else
{
   out.println("Usuario No registrado...");
   response.sendRedirect("index.jsp");
}

%>


</body>
</html>
