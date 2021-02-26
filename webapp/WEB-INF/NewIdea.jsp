<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Agregar</title>
		<link rel="stylesheet" type="text/css" href="/../CSS/Styles.css"> 
	</head>
	<body>
		<div class="container">
			<a class=back href="/home">Go back</a>
			<div class="top">
				<h1 class="title">Agregar nueva idea</h1>
				<form id="logoutForm" method="POST" action="/logout">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<input class="logout-boton" type="submit" value="Logout" />
				</form>
			</div>
			<form:form class="form" method="POST" action="/ideas/new" modelAttribute="ideas">	
	                <label for="fname">Titulo:</label><br>
	                <input class="title-space" type="text" name="title"
	                placeholder="Escribe tu idea aqui... "><br>
	                <input class="link"  type="submit" class="submit-boton" value="Agregar"/>
	            </form:form>	
		</div>
	
	</body>
</html>