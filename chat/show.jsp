<%@page import="java.sql.*" %>

<%@page import="javax.sql.*" %>

<%@page import="java.sql.Connection" %>

<%


String username=request.getParameter("username");

Class.forName("com.mysql.jdbc.Driver");

Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lab","root","1234");

Statement st=con.createStatement();

String query="select username, password, firstname, lastname, address,pincode, phonenumber "; 
query += "from info where username like '%"+username+"%'";

ResultSet rs=st.executeQuery(query);

if (rs.next())
{
	 rs=st.executeQuery(query);

%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Busqueda Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="dashboard.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>




<body>
DATOS LOCALIZADOS ... <br>
<div class="table-responsive">
<table class="table table-striped" border="2" bordercolor="#2494b7">
<thead>
<tr>

<th>UserName</th>

<th>Password</th>

<th>First Name</th>

<th>Last Name</th>

<th>Address</th>

<th>Pin code</th>

<th>Mobile Phone</th>

</tr>
<thead>
<%

while(rs.next())

{

%>


<tr>

<td><%=rs.getString(1)%></td>

<td><%=rs.getString(2)%></td>

<td><%=rs.getString(3)%></td>

<td><%=rs.getString(4)%></td>

<td><%=rs.getString(5)%></td>

<td><%=rs.getString(6)%></td>

<td><%=rs.getString(7)%></td>

</tr>



<%

}

%>
</table>
<%

}
else
{
	out.println("No existen registros con este Criterio de Búsqueda ");
}
	

%>


<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- "W:/Users/alexisflores/Documents/UTP 2013/Desarrollo IV/ejemplos/Oct19"Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="../../assets/js/vendor/holder.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>>