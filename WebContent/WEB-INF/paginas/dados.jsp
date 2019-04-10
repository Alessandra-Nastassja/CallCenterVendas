<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<% 
		String usuario = (String) session.getAttribute("usuario");
		if(usuario == null ){
			response.sendRedirect("loginServlet");
		}else{
			out.print("Bem vindo, " + usuario + "<br />");
		}
	%>
	Conta bancário: 123456789 <br />
	Senha do banco: abcde <br />
	Valor total: R$13.000 <br />
	<br /> <a href="loginServlet">Deslogar</a>
</body>
</html>