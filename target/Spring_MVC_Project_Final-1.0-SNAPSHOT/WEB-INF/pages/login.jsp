
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Male_Fashion Template">
        <meta name="keywords" content="Male_Fashion, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Login Page</title>
        <link rel="stylesheet" href="<c:url value="/resources/css/login.css"/>">    
    </head>
    <body>

       <form action="<c:url value="j_spring_security_check"/>" method="post">
            <div class="login-box">
                <h1>Login</h1>
                 <!-- /login?error=true -->
                  <div class="textbox">
                        <c:if test="${message != null && message != ''}">
                            <p style="color: red">${message}</p>
                        </c:if>
                   </div>
                <div class="textbox">
                    <i class="fas fa-user"></i>
                    <input style="color:white;" type="email" name="username" placeholder="Username">
                </div>

                <div class="textbox">
                    <i class="fas fa-lock"></i>
                    <input style="color:white;"type="password" name="password"placeholder="Password">
                </div>

                <input type="submit" class="btn" value="Sign in">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </div>
        </form>
       
    </body>
</html>
