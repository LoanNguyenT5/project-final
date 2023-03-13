
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>

<%@taglib  uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
      rel="stylesheet">
<!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">-->

<!-- Header Section Begin -->
<header style="position:fixed;width:100%;z-index: 100000;" class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-5 col-md-7">
                    <div class="header__top__left">
                        <p> <sec:authorize access="isAuthenticated()">
                                Authenticated as 
                                <sec:authentication property="principal.username"/>
                            </sec:authorize>
                        </p>
                        <!--<p>Free shipping, 30-day return or refund guarantee.</p>-->
                    </div>
                </div>
                <div class="col-lg-7 col-md-5">
                    <div style=""class="header__top__right">
                        <div class="header__top__links">
                            <sec:authorize access="isAuthenticated()">
                                <sec:authorize access="hasRole('ROLE_ADMIN')">
                                    <a href="<c:url value="/admin/home" />">Admin Home</a>
                                </sec:authorize>
                                <a href="<c:url value="/logout" />">Logout</a>
                            </sec:authorize>
                            <sec:authorize access="!isAuthenticated()">
                                <a href="<c:url value="/login" />">Login</a>
                            </sec:authorize>
                            <sec:authorize access="!isAuthenticated()">
                                <a href="<c:url value="/sign-in"/>">Sign in</a>
                            </sec:authorize>
                            <a href="#">FAQs</a>

                        </div>
                        <div class="header__top__hover">
                            <span>Usd <i class="arrow_carrot-down"></i></span>
                            <ul>
                                <li>USD</li>
                                <li>EUR</li>
                                <li>USD</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-3">
                <div class="header__logo">


                    <a href="<c:url value="/home"/>"><img src="<c:url value="/resources/img/logo.png"/>" alt=""></a>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <nav class="header__menu mobile-menu">
                    <ul>
                        <li class="active"> 
                            <sec:authorize access="hasRole('ROLE_USER')">
                                <a href="<c:url value="/user/home"/>"> Home</a>
                            </sec:authorize>
                            <sec:authorize access="!isAuthenticated()">
                                <a href="<c:url value="/home" />">Home</a>
                            </sec:authorize>
                        </li>
                        <li class="">
                            <sec:authorize access="hasRole('ROLE_USER')">
                                <a href="<c:url value="/user/reset-shop"/>"> Shop</a>
                            </sec:authorize>
                            <sec:authorize access="!isAuthenticated()">
                                <a href="<c:url value="/reset-shop" />">Shop</a>
                            </sec:authorize>
                        </li>
                        <li class=""><a href="#">Pages</a>
                            <ul class="dropdown">
                                <li>
                                    <a id="amenu" href="<c:url value="/about-us"/>">About Us</a>
                                </li>

                                <li>
                                    <sec:authorize access="hasRole('ROLE_USER')">
                                        <a href="<c:url value="/user/cart"/>"> User's Cart</a>
                                    </sec:authorize>
                                    <sec:authorize access="!isAuthenticated()">
                                        <a href="<c:url value="/login" />">Shopping Cart</a>
                                    </sec:authorize>
                                </li>
                                <li>
                                    <sec:authorize access="hasRole('ROLE_USER')">
                                        <a href="<c:url value="/user/order-history"/>"> Order History</a>
                                    </sec:authorize>
                                    <sec:authorize access="!isAuthenticated()">
                                        <a href="<c:url value="/login" />">Order History</a>
                                    </sec:authorize>
                                </li>
                                <li>
                                    <sec:authorize access="hasRole('ROLE_USER')">
                                        <a href="<c:url value="/user/check-out"/>"> Check Out</a>
                                    </sec:authorize>
                                    <sec:authorize access="!isAuthenticated()">
                                        <a href="<c:url value="/login" />">Check Out</a>
                                    </sec:authorize>
                                </li>
                                <li><a href="<c:url value="/blog-detail"/>">Blog Details</a></li>
                            </ul>
                        </li>
                        <li class=""><a href="<c:url value="/blog"/>">Blog</a></li>
                        <li class=""><a href="<c:url value="/contacts"/>">Contacts</a></li>
                    </ul>
                </nav>
            </div>
            <div class="col-lg-3 col-md-3">
                <div style="display: flex;
                     justify-content: center;
                     padding-top: 29px;
                     "class="header__nav__option">

                    <a href="<c:url value="/user/user-profile"/>" class=""><i style="color:black;font-size: 18px;"class="fa fa-user-o" aria-hidden="true"></i></a>
                    <a href="<c:url value="/user/favorite"/>"><img src="<c:url value="/resources/img/icon/heart.png"/>" alt=""></a>
                    <!--<a href="#"><i style="color:dimgrey;font-size: 36px;"class="fa fa-shopping-cart" aria-hidden="true"></i></a>-->
                    <sec:authorize access="hasRole('ROLE_USER')">
                        <a href="<c:url value="/user/cart"/>"> <img style="height:18px;"src="<c:url value="/resources/img/img_404077.png"/>" alt=""></a>
                        </sec:authorize>
                        <sec:authorize access="!isAuthenticated()">
                        <a href="<c:url value="/login" />"><img style="height:18px;"src="<c:url value="/resources/img/img_404077.png"/>" alt=""></a>
                        </sec:authorize>



                </div>
            </div>
        </div>
        <div class="canvas__open"><i class="fa fa-bars"></i></div>
    </div>

</header>
<!-- Header Section End -->