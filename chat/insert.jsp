<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insertar</title>
</head>
<body>
 
<sql:setDataSource
        var="myDS"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/proyecto"
        user="root" password="1234"
    />

 

 <%
  
   
   String mensaje = request.getParameter("mensaje");
   String destino = request.getParameter("destino");
   String theName = request.getParameter("theName");
  //if (mensaje.compareTo("") != 0)
    {
  %>
   
    <sql:update dataSource="${myDS}" var="ListUsers">
insert into chats (usuario1,usuario2,mensaje, fecha) values  ('<%= session.getAttribute("theName") %>' ,'<%= request.getParameter("destino") %>', '<%=mensaje  %>', now());
</sql:update>
     <% 
     }
   %>
 

 <%
response.sendRedirect("chat.jsp");
%>
</body>
</html>