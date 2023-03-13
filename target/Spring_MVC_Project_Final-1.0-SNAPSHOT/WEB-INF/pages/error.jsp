<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
    <head>
        <title> Error Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Smooth Error Page template Responsive, Login form web template,Flat Pricing tables,Flat Drop downs  Sign up Web Templates, Flat Web forms, Login sign up Responsive web Forms, SmartPhone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- Custom Theme files -->
        <link href="<c:url value="/resources/css/style7.css"/>" rel="stylesheet" type="text/css" media="all" />
        <!-- //Custom Theme files -->
        <!-- web font -->
        <link href="//fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">
        <link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
        <!-- //web font -->
    </head>
    <body>
        <!--mian-content-->
        <h1>Oops !You must be return <a href="<c:url value="/home"/>">HOME</a> now</h1>
        <div class="main-wthree">
            <h2>404</h2>
            <p><span class="sub-agileinfo">Sorry! </span>The page you requested was not found!....</p>
            <!--form-->
            <form class="newsletter" action="#" method="post">
                <input style="position:relative"class="email" type="email" placeholder="Your email..." required=" ">
                <img style="position:absolute;z-index:5;width: 22px; top: 11px;right: 197px;"  src="<c:url value="/resources/img/email.png"/>">
                <input type="submit" class="submit" value="">
            </form>

            <!--//form-->
        </div>
        <!--//mian-content-->
        <!-- copyright -->
        <!-- <div class="copyright-w3-agile">
                <p> ©  All rights reserved | Design by <a href="#" target="_blank">Huynh Phi Han</a></p>
        </div> -->
        <!-- //copyright --> 

    </body>
</html>
