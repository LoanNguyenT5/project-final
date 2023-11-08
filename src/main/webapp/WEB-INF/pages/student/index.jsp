<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<body>
<h2>How to insert image in database using Spring MVC</h2>

<form action="insertImage" method="post" enctype="multipart/form-data">

<pre>
	Name: <input type="text" name="name">

	Age: <input type="number" name="age">

	Photo: <input type="file" name="photo">
				
	<input type="submit" value="Submit">

</pre>

</form>

<p>${msg}</p>

</body>
</html>
