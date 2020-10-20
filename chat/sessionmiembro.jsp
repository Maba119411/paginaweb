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


String username=request.getParameter("username");
String password=request.getParameter("password");

Class.forName("com.mysql.jdbc.Driver");

Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto","root","1234");

Statement st=con.createStatement();
Statement stu=con.createStatement();
String query="select username, password, firstname, lastname, address,pincode, phonenumber "; 
query += "from info where username = '"+username+"' and password = '"+password+"'";

out.println(query);
ResultSet rs=st.executeQuery(query);
int encontrado = 0;
String name;
while(rs.next())
{
    encontrado=1;
    name = rs.getString(1);
    session.setAttribute( "theName", name );
 
	out.println("Bienvenido :" + rs.getString(1) );
	out.println("Bienvenido :" + rs.getString(6) );
	String sql = "insert into registro (usuario,fecha) values  ('" + username + "',now())";
	int flag=stu.executeUpdate(sql);
	//int flag=0;
	if(flag==1)
	
	{
	
	out.println("!");
	
	}
	
	else
	
	{
	
	out.println("Failed");
	
	}

}

if (encontrado==1)
{      
	  
	   
	   //String name = request.getParameter( "username" );
	   //session.setAttribute( "theName", name );
	
}
else
{
   out.println("Usuario No registrado...");	
}
response.sendRedirect("modificar.jsp");
%>
 
<br/><A HREF="select.jsp">CRUD BANCOS</A><br/>
<br/>
<br/>
<A HREF="close.jsp">Cerrar Sesion</A><br/>

</body>
</html>
