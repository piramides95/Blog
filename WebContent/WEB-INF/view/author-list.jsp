<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Blog Category list</title>
</head>
<body>

<div id="wrapper">

<h2>BLOG CMS - Author list table</h2>

</div>

<div id="data-container">

	<table>
	<tr>
		<th>ID</th>
		<th>AUTHOR NAME</th>
		<th>AUTHOR IMAGE</th>
	</tr>
	
	<c:forEach var="author" items="${authorList}">
	
	<tr>
		<th>${author.id}</th>
		<th>${author.name}</th>
		<th><a href="author-form-update?id=${author.id}">Update</a></th>
		<th><a href="author-delete?id=${author.id}" onclick="if(! (confirm('Do you want to delete blog author?') ) ) return false">Delete</a></th>
	</tr>
	
	</c:forEach>
		
		
	</table>

</div>

<br><br><br>
<a href="category-form">Create category</a>

</body>
</html>