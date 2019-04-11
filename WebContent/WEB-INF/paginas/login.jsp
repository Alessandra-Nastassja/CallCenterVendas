<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LOGIN</title>
</head>
<body>
	<form action="loginServlet" method="post">
		Usuário: <br /><input type="text" name="usuario"><br />
		Senha: <br /><input type="text" name="senha"><br />
		<input type="submit" value="Logar" />
	</form>
</body>
