<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title><c:out value="${ ideas.title }"/></title>
		<link rel="stylesheet" type="text/css" href="/../CSS/Styles.css">
	</head>
	<body>
		<div class="container">
			<a class=back href="/home">Go back</a>
			<div class="top">
				<h1 class="title">Edit <c:out value="${ ideas.title }" /></h1>
				<form id="logoutForm" method="POST" action="/logout">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<input class="logout-boton" type="submit" value="Logout" />
				</form>
			</div>
			<p>
				<form:errors path="idea.*" />
			</p>
			<form:form method="POST" action="/ideas/${ideas.id}/edit"
				modelAttribute="ideas">
				<p>
					<form:label path="title">Title:</form:label>
					<form:input class="title-space" type="title" path="title" name="title" />
				</p>
				<input class="link" type="submit" value="Update" /> <br><br>
			</form:form>
			<form:form method="POST" action="/ideas/${ideas.id}/delete">
				<input class="delete" type="submit" value="Delete" />
			</form:form>
		</div>
	</body>
</html>