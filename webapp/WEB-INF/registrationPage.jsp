<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Registrate!</title>
		<link rel="stylesheet" type="text/css" href="CSS/loginStyles.css"> 
	</head>
	<body>
		<div class="container">
			<form:form class="form" method="POST" action="/registration" modelAttribute="user">
				<h1 class="title">Register Here!</h1>
				        <p>
				            <form:label path="name">Nombre:</form:label><br>
				            <form:errors path="name"/>
				            <form:input class="text-space" type="text" path="name" name="name" placeholder="Inserta tu nombre aqui"/>
				        </p>
				        <p>
				            <form:label path="email">Correo:</form:label><br>
				            <form:errors path="email"/>
				            <form:input class="text-space" path="email" name="email" placeholder="example@correo.com"/>
				        </p>
				        <p>
				            <form:label path="password">Contraseña:</form:label><br>
				            <form:errors path="password"/>
				            <form:password class="text-space" path="password" name="password" placeholder="*******"/>
				        </p>
				        <p>
				            <form:label path="passwordConfirmation">Confirmar contraseña:</form:label><br>
				            <form:errors path="passwordConfirmation"/>
				            <form:password class="text-space" path="passwordConfirmation" name="passwordConfirmation" placeholder="*******"/>
				        </p>
				        <input type="submit" class="submit-boton" value="Registrarse"/>
			    </form:form>
			    <p class="log-register">Already a member? <a href="/">Log in</a></p>
		</div>
	
	</body>
</html>