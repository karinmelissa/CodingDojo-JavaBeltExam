<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<h1 class="title"><c:out value="${ ideas.title }"/></h1>
				<form id="logoutForm" method="POST" action="/logout">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<input class="logout-boton" type="submit" value="Logout" />
				</form>
			</div>
			<div class=bod>
				<p>Created by: <c:out value="${ ideas.createdBy }"/></p>
				<table class="table">
					<thead class=colums>
						<tr>
							<th>People who liked your idea:</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ideas.users}" var="u">
							<tr>
								<td><c:out value="${u.name}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<c:if test="${ ideas.createdBy.equals(user.name)}">
					<a class="link" href="/ideas/${ideas.id}/edit" class="btn btn-sm btn-primary">Edit</a>
				</c:if>
			</div>
	</div>
	
	</body>
</html>