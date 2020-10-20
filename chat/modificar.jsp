<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Lista de Usuarios</title>
</head>
<body>
    <sql:setDataSource
        var="myDS"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/proyecto"
        user="root" password="1234"
    />
     
    <sql:query var="listregistro"   dataSource="${myDS}">
        SELECT distinct(usuario) FROM registro where usuario != '<%= session.getAttribute("theName")%>' and date(fecha) = date(now()) ;
    </sql:query>
    <%
    if(request.getParameter("destino")!= null)
    {%>
      <%
     String destino=request.getParameter("destino");
    session.setAttribute( "destino", destino );
    %> 
    <%}%>
     
    <div align="center">
    <h2>Lista de Usuarios</h2>
            
        <table border="1" cellpadding="5">
            
            <c:forEach var="registro" items="${listregistro.rows}">
                <form action="update.jsp" method="POST">
                   <table>
                     <tr>
                   <td>
                   Usuario:</td> 
                   <td> <c:out value="${registro.usuario}" /></td>
                    <td> <a href=modificar.jsp?destino=<c:out value="${registro.usuario}" /> ><c:out value="${registro.usuario}" /> </a> </td>
                   </tr>
                    
                  
                   </table> 
                </form>
            </c:forEach>
        </table>
    </div>
    <% out.println(session.getAttribute("destino"));
       out.println(session.getAttribute("theName"));
    %>
    
    <c:set var="destino" value='<%= session.getAttribute("destino") %>'/>
    <c:set var="origen" value='<%= session.getAttribute("thename") %>'/>
    
 
	

     <sql:query var="chats"   dataSource="${myDS}">
        SELECT *   FROM chats where (usuario1 = ? or usuario2= ? )
         <sql:param value="${destino}" />
          <sql:param value="${destino}" />
        
         
     </sql:query>
     
   
    <div align="center">
    <h2>CHAT</h2>
            
        <table border="1" cellpadding="5">
            
            <c:forEach var="michat" items="${chats.rows}">
                <form action="updatechat.jsp" method="POST">
                   <table>
                     <tr>
                   <td>
                   </td> 
                   <td> <c:out value="${michat.usuario1}" /> ->> </td>
                    <td> <c:out value="${michat.usuario2}" />: </td>
                     <td> <c:out value="${michat.fecha}" /></td> 
                      <td> <c:out value="${michat.mensaje}" /></td>
                   </tr>
                    
                  
                   </table> 
                </form>
            </c:forEach>
        </table>
    </div>


     <div align="center">
    <h2>Lista de Usuarios</h2>
            
        <table border="1" cellpadding="5">
            
            <c:forEach var="registro" items="${listregistro.rows}">
                <form action="modificar.jsp" method="POST">
                   <table>
                     <tr>
                   <td>
                   Mensaje:</td> 
                   <td><input type="text" name="mensaje" > </td>
                   
                   <td><input type="submit" value="Submit" /></td>
                   <td> <input type="hidden" name="aquien" value="<%= session.getAttribute("destino")%>"> </td>
                   </tr>
                  
                   </table> 
                </form>
            </c:forEach>
        </table>
    </div>
   <%
   String mensaje = request.getParameter("mensaje");
   String aquien = request.getParameter("aquien");
  if(mensaje != null & aquien != null & mensaje != "")
   {
   %>
   
	
   <sql:update dataSource="${myDS}" var="LisUsers">
   insert into chats (usuario1, usuario2, mensaje, fecha) values ('<%= session.getAttribute("theName") %>','<%= request.getParameter("aquien") %>','<%= mensaje %>',now());
   </sql:update>
   <% response.sendRedirect("modificar.jsp");%>
   <%
   } //
   %>
   
</body>
</html>