<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Login</title>
		<link rel="stylesheet" type="text/css" href="CSS/loginStyles.css"> 
	</head>
	<body>
		<div class="container">
			<form class="loginform" method="POST" action="/login">
				<h1 class="title">Login</h1>
				<c:if test="${errorMessage != null}">
				<p class="error"><c:out value="${errorMessage}"></c:out></p>
				</c:if>
				<p>
					<label for="email">Correo:</label><br>
					<input class="text-space" type="text" id="email" name="username" placeholder="example@correo.com"/>
				</p>
				 <p>
					<label for="password">Contraseña:</label><br>
				    <input class="input" type="password" id="password" name="password" placeholder="*******"/>
			    </p>
		        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input class="submit-boton" type="submit" value="login"/>
			</form>
			<p class="log-register">Not a member?<a href="/registration">Register here</a></p>
		</div>
	</body>
</html>