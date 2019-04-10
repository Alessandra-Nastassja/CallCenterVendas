<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>CADASTRO DE CLIENTES</title>
	
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
		<h4>CADASTRE NOVOS CLIENTES</h4>
		
		<p class="text-danger">${mensagem}</p>
		
		<form method="POST" action="clienteServlet">
			
			 <input type="hidden" name="acao" value="CREATE"/>
			 <input type="hidden" name="codigo" value="${cliente.codigo}"/>
			 
			 <div class="form-group">
				 <label for="codigo">Código: </label>
			     <input type="text" class="form-control" disabled name="codigo" value="${cliente.codigo}"/>
			 </div>
			 <div class="form-group">
			     <label for="nome">Nome: *</label>
			     <input type="text" class="form-control" name="nome" value="${cliente.nome}"/>
		     </div>
		     <div class="form-group">
		     	<label for="percentualDesconto">Desconto(%): *</label>
		     	<input type="text" class="form-control" name="percentualDesconto" value="${cliente.percentualDesconto}"/>
		     </div>
		     <div class="form-group">
		     	<label for="cpf">CPF: *</label>
		     	<input type="text" class="form-control" name="cpf" value="${cliente.cpf}"/>
		     </div>
		     <div class="form-group">
		     	<label for="email">E-mail: </label>
		     	<input type="text" class="form-control" name="email" value="${cliente.email}"/> <br>
		     </div>
		     <div class="form-group">
			 	<input type="submit" class="btn btn-primary btn-lg" value="Enviar" />
			 </div>
		</form>
		
		<h4>CLIENTES CADASTRADOS</h4>
		
		<table class="table table-striped">
			<tr>
				<!-- th>Código</th-->
				<th>Nome Fantasia</th>			
				<th>Desconto(%)</th>
				<th>CPF</th>
				<th>E-mail</th>
				<th></th>
				<th></th>
			</tr>
			<c:forEach var="c" items="${clientes}">
			<tr>
				<!-- td>${c.codigo}</td-->		
				<td>${c.nome}</td>
				<td>${c.percentualDesconto}</td>
				<td>${c.cpf}</td>
				<td>${c.email}</td>
				<td><a class="btn btn-info" href=clienteServlet?acao=RETRIEVE&codigo=${c.codigo}>Editar</a>
				<td><a class="btn btn-danger" href=clienteServlet?acao=DELETE&codigo=${c.codigo}>Excluir</a>
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