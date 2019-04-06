<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CADASTRO DE FORNECEDORES</title>
</head>
<body>
	<form method="post" action="fornecedorServlet">
		<input type="hidden" name="codigo" value="${fornecedor.codigo}">
		<label for="codigo">Código</label>
		<input type="text" disabled name="codigo" value="${fornecedor.codigo}"/>
		<br>
		<label for="nome">Nome fantasia: *</label>
		<input type="text" name="nome" value="${fornecedor.nome}"/>
		<br>
		<label for="razao">Razão social: *</label>
		<input type="text" name="razaoSocial" value="${fornecedor.razaoSocial}"/>
		<br>
		<label for="cnpj">CNPJ: *</label>
		<input type="text" name="cnpj" value="${fornecedor.cnpj}"/>
		<br>
		<label for="email">E-mail</label>
		<input type="text" name="email" value="${fornecedor.email}"/>
		<br>
		<input type="submit" value="Enviar">
	</form>

	<h2 style="color: red;">${mensagem}</h2>
	<h4>FORNECEDORES CADASTRADOS</h4>
	<table border="1">
	  <tr>
	    <th>Código</th>
	    <th>Nome fantasia</th>
	    <th>Razão social</th>
	    <th>CNPJ</th>
	    <th>E-mail</th>
	    <th></th>
	    <th></th>
	  </tr>
	  <c:forEach var="f" items="${fornecedores}">
	  	<tr>
	   		<td>${f.codigo}</td>
	   		<td>${f.nome}</td>
	   		<td>${f.razaoSocial}</td>
	   		<td>${f.cnpj}</td>
	   		<td>${f.email}</td>
	   		<td><a href="fornecedorServlet?acao=editar&codigo=${f.codigo}">Editar</a></td>
	   		<td><a href="fornecedorServlet?acao=excluir&codigo=${f.codigo}">Excluir</a></td>
	   	</tr>
      </c:forEach>
	</table>
</body>
</html>