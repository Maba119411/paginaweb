<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Index</title>
<meta name="viewport" content="width=device-width", user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/indexA.css">
</head>

<body>

<header>
   <div class="container">
      <h1 align="center">Manolo PC Helpdesk</h1>
   </div>
</header>
</br></br>

<div align="right" class="container-fluid">

<table>
<tr>
<td>
<form  method="get" action="session3.jsp">
    <button class="btn btn-primary" type="submit">Miembro</button>
</form>
</td>
<td>&nbsp</td>
<td>
<form  action="session2.jsp" method="GET">
<button class="btn btn-primary" type="submit">Registrar</button>
</form>
</td>
</tr>
</table>

</div></br>

<div align="center">
	<table  cellpadding="5" width=50%>
	<tr>
	<th><p>Este sitio le ayudara a resolver los problemas que puedan ocurrir con nuestro producto, si es un usuario nuevo, 
	ingrese el numero de serie del producto y este se asociara a un email.</p> </th>
	</tr>
	</table>

</br></br>
<table border="0" cellpadding="5" >

<form action="session.jsp" method="GET">
<br/>
<tr> 
<th>Usuario / E-mail:</th> 
<th><input type="text" name="Username"><br /></th>
</tr>
<th>&nbsp</th>
<th>&nbsp</th>
<tr>
<th>Contraseña: </th>
<th><input type="password" name="Password" /><br /></th>
</tr>
<tr>
<td>&nbsp</td>
</tr>
<tr>
<td>&nbsp</td>

<td><button class="btn btn-primary" type="submit">Entrar</button> </td>
</tr>
</form>


</table>
</div>
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>