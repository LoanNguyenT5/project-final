<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<html>
<body>
	<h2>How to fetch image from database using Spring MVC</h2>


	<table border="1">
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Age</th>
			<th>Photo</th>
		</tr>
		<c:forEach var="student" items="${listStu}">
			<tr>
				<td>${student.id}</td>
				<td>${student.name}</td>
				<td>${student.age}</td>
				<td><img width="100" height="100" src="getStudentPhoto/<c:out value='${student.id}'/>"></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>