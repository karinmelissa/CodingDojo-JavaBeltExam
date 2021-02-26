<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Home</title>
		<link rel="stylesheet" type="text/css" href="../CSS/Styles.css"> 
		<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"> </script>
	</head>
	<body>
		<div class="container">
		<div class="top">
			<h1 class="title">Hello <c:out value="${user.name}" /></h1>
			<form id="logoutForm" method="POST" action="/logout">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input class="logout-boton" type="submit" value="Logout" />
			</form>
		</div>
		<div class="order">
			<a href="/ideas/highest"><i class="fas fa-arrow-up"></i></a>|
			<a href="/ideas/lowest"><i class="fas fa-arrow-down"></i></a>

		</div>
			<table class=table>
				<thead class=colums>
					<tr>
						<th>Name</th>
						<th>Created by</th>
						<th>Likes</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ideas}" var="ideas">
	        		<tr>
		            	<td><a href="/ideas/${ideas.id}"><c:out value="${ideas.title}"/></a></td>
		            	<td><c:out value="${ideas.createdBy}"/></td>
		            	<td><c:out value="${ideas.likes}"/></td>
		            	<c:if test="${! ideas.users.contains(user)}">
							<td><a href="/ideas/${ideas.id}/like"> Like</a></td>
						</c:if>
						<c:if test="${ideas.users.contains(user)}">
							<td><a href="/ideas/${ideas.id}/Unlike">Unlike</a></td>
						</c:if>
	        		</tr>
	        		</c:forEach>
				</tbody>
			</table>
			<a class="link" href="/ideas/new">Nueva idea</a>
		
		</div>
	</body>
</html>