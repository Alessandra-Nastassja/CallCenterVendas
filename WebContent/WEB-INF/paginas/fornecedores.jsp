<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>CADASTRO DE FORNECEDORES</title>
	
	<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    
    <!-- CSS custome -->
    <link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<div class="container-fluid">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <a class="navbar-brand" href="#">Navbar</a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
		    <div class="navbar-nav">
		      <a class="nav-item nav-link active" href="./">Home <span class="sr-only">(current)</span></a>
		      <a class="nav-item nav-link" href="fornecedorServlet">Fornecedores</a>
		      <a class="nav-item nav-link" href="clienteServlet">Clientes</a>
		    </div>
		  </div>
		</nav>
	</div>
	
	<div class="container">
	<h4>CADASTRE NOVOS FORNECEDORES</h4>
		
	<p class="text-danger">${mensagem}</p>
	
		<form method="post" action="fornecedorServlet">
		
			<input type="hidden" name="acao" value="create">
			<input type="hidden" name="codigo" value="${fornecedor.codigo}">
			
			<div class="form-group">
				<label for="codigo">Código</label>
				<input type="text" class="form-control" disabled name="codigo" value="${fornecedor.codigo}"/>
			</div>
			<div class="form-group">
				<label for="nome">Nome fantasia: *</label>
				<input type="text" class="form-control" name="nome" value="${fornecedor.nome}"/>
			</div>
			<div class="form-group">
				<label for="razao">Razão social: *</label>
				<input type="text" class="form-control" name="razaoSocial" value="${fornecedor.razaoSocial}"/>
			</div>
			<div class="form-group">
				<label for="cnpj">CNPJ: *</label>
				<input type="text" class="form-control" name="cnpj" value="${fornecedor.cnpj}"/>
			</div>
			<div class="form-group">
				<label for="email">E-mail: </label>
				<input type="text" class="form-control" name="email" value="${fornecedor.email}"/>
			</div>
			<div class="form-group">
				<input type="submit" class="btn btn-primary btn-lg" value="Enviar">
			</div>
		</form>
	
		<h4>FORNECEDORES CADASTRADOS</h4>

		<table class="table table-striped">
		  <tr>
		    <!-- th>Código</th-->
		    <th>Nome fantasia</th>
		    <th>Razão social</th>
		    <th>CNPJ</th>
		    <th>E-mail</th>
		    <th></th>
		    <th></th>
		  </tr>
		  <c:forEach var="f" items="${fornecedores}">
		  	<tr>
		   		<!-- td>${f.codigo}</td-->
		   		<td>${f.nome}</td>
		   		<td>${f.razaoSocial}</td>
		   		<td>${f.cnpj}</td>
		   		<td>${f.email}</td>
		   		<td><a class="btn btn-info" href="fornecedorServlet?acao=retrieve&codigo=${f.codigo}">Editar</a></td>
		   		<td><a class="btn btn-danger" href="fornecedorServlet?acao=delete&codigo=${f.codigo}">Excluir</a></td>
		   	</tr>
	      </c:forEach>
		</table>
	</div>
	<br>
	<br>
	<br>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>