<%-- 
    Document   : welcomePage
    Created on : Jun 9, 2020, 10:09:35 AM
    Author     : ldanh
--%>

<%@page import="com.mycompany.spring_mvc_project_final.entities.ProductEntity"%>
<%@page import="java.util.List"%>
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
        <title>Male-Fashion</title>
        <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"rel="stylesheet">
        <jsp:include page="include/css-page.jsp"/>

    </head>
    <%
        List<ProductEntity> listP = (List<ProductEntity>) session.getAttribute("listP");
        int endPage = (int) session.getAttribute("endPage");
        int sum = (int) session.getAttribute("sum");
        int currentPage = (int) session.getAttribute("currentPage");

    %>
    <body>
        <jsp:include page="include/preload.jsp"/>

        <jsp:include page="include/menu.jsp"/>

        <jsp:include page="include/header.jsp"/>
        <!-- Breadcrumb Section Begin -->
        <section style="padding-top: 94px;padding-bottom: 0;" class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__text">
                            <h4>Shop</h4>
                            <div class="breadcrumb__links">
                                <a href="<c:url value="/home"/>">Home</a>
                                <span>Shop</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb Section End -->

        <!-- Shop Section Begin -->
        <section style="padding-bottom: 11px;"class="shop spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="shop__sidebar">
                            <div class="shop__sidebar__search">
                                <form  action="${pageContext.request.contextPath}/search" method="POST">
                                    <input name="searchKey" type="text" placeholder="Search...">
                                    <button type="submit"><span class="icon_search"></span></button>
                                </form>
                            </div>
                            <div class="shop__sidebar__accordion">
                                <div class="accordion" id="accordionExample">
                                    <div class="card">
                                        <div class="card-heading">
                                            <a data-toggle="collapse" data-target="#collapseOne">Categories</a>
                                        </div>
                                        <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                            <div class="card-body">
                                                <div class="shop__sidebar__categories">
                                                    <ul class="nice-scroll">
                                                        <li><a href="<c:url value="/category?searchKey=Men&s=0"/>">Men (20)</a></li>
                                                        <li><a href="<c:url value="/category?searchKey=Women&s=0"/>">Women (20)</a></li>
                                                        <li><a href="<c:url value="/category?searchKey=Bags&s=0"/>">Bags (20)</a></li>
                                                        <li><a href="<c:url value="/category?searchKey=Clothing&s=0"/>">Clothing (20)</a></li>
                                                        <li><a href="<c:url value="/category?searchKey=Shoes&s=0"/>">Shoes (20)</a></li>
                                                        <li><a href="<c:url value="/category?searchKey=Accessories&s=0"/>">Accessories (20)</a></li>
                                                        <li><a href="<c:url value="/category?searchKey=Kids&s=0"/>">Kids (20)</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-heading">
                                            <a data-toggle="collapse" data-target="#collapseTwo">Branding</a>
                                        </div>
                                        <div id="collapseTwo" class="collapse show" data-parent="#accordionExample">
                                            <div class="card-body">
                                                <div class="shop__sidebar__brand">
                                                    <ul>
                                                        <li><a href="<c:url value="/branding?searchKey=Louis&b=0"/>">Louis Vuitton</a></li>
                                                        <li><a href="<c:url value="/branding?searchKey=Chanel&b=0"/>">Chanel</a></li>
                                                        <li><a href="<c:url value="/branding?searchKey=Hermes&b=0"/>">Hermes</a></li>
                                                        <li><a href="<c:url value="/branding?searchKey=Gucci&b=0"/>">Gucci</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-heading">
                                            <a data-toggle="collapse" data-target="#collapseThree">Filter Price</a>
                                        </div>
                                        <div id="collapseThree" class="collapse show" data-parent="#accordionExample">
                                            <div class="card-body">
                                                <div class="shop__sidebar__price">
                                                    <ul>
                                                        <li><a href="http://localhost:8080/Spring_MVC_Project_Final/shopp?key=lowtohigh">Low To High</a></li>
                                                        <li><a href="http://localhost:8080/Spring_MVC_Project_Final/shopp?key=hightolow">High To Low</a></li>
                                                        <li><a href="http://localhost:8080/Spring_MVC_Project_Final/shopp?key=fiftydollarsless">$0.00 - $55.00</a></li>
                                                        <li><a href="http://localhost:8080/Spring_MVC_Project_Final/shopp?key=fiftydollarsmore">>$55$</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-heading">
                                            <a data-toggle="collapse" data-target="#collapseFour">Size</a>
                                        </div>
                                        <div id="collapseFour" class="collapse show" data-parent="#accordionExample">
                                            <div class="card-body">
                                                <div class="shop__sidebar__size">
                                                    <label for="xs">xs
                                                        <input value="<c:url value="/size?sizeKey=XS"/>" onclick="window.location.href = this.value;" type="radio" id="xs">
                                                    </label>
                                                    <label for="s">s
                                                        <input value="<c:url value="/size?sizeKey=S"/>" onclick="window.location.href = this.value;"type="radio" id="s">
                                                    </label>
                                                    <label for="m">m
                                                        <input value="<c:url value="/size?sizeKey=M"/>" onclick="window.location.href = this.value;"type="radio" id="m">
                                                    </label>
                                                    <label for="l">l
                                                        <input value="<c:url value="/size?sizeKey=L"/>" onclick="window.location.href = this.value;"type="radio" id="l">
                                                    </label>
                                                    <label for="xl">xl
                                                        <input value="<c:url value="/size?sizeKey=XL"/>" onclick="window.location.href = this.value;"type="radio" id="xl">
                                                    </label>
                                                    <label for="2xl">2xl
                                                        <input value="<c:url value="/size?sizeKey=XXL"/>" onclick="window.location.href = this.value;"type="radio" id="2xl">
                                                    </label>
                                                    <label for="3xl">3xl
                                                        <input value="<c:url value="/size?sizeKey=XXXL"/>" onclick="window.location.href = this.value;"type="radio" id="3xl">
                                                    </label>
                                                    <label for="4xl">4xl
                                                        <input value="<c:url value="/size?sizeKey=XXXXL"/>" onclick="window.location.href = this.value;"type="radio" id="4xl">
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-heading">
                                            <a data-toggle="collapse" data-target="#collapseFive">Colors</a>
                                        </div>
                                        <div id="collapseFive" class="collapse show" data-parent="#accordionExample">
                                            <div class="card-body">
                                                <div class="shop__sidebar__color">
                                                    <label class="c-1" for="sp-1">
                                                        <input type="radio" id="sp-1">
                                                    </label>
                                                    <label class="c-2" for="sp-2">
                                                        <input type="radio" id="sp-2">
                                                    </label>
                                                    <label class="c-3" for="sp-3">
                                                        <input type="radio" id="sp-3">
                                                    </label>
                                                    <label class="c-4" for="sp-4">
                                                        <input type="radio" id="sp-4">
                                                    </label>
                                                    <label class="c-5" for="sp-5">
                                                        <input type="radio" id="sp-5">
                                                    </label>
                                                    <label class="c-6" for="sp-6">
                                                        <input type="radio" id="sp-6">
                                                    </label>
                                                    <label class="c-7" for="sp-7">
                                                        <input type="radio" id="sp-7">
                                                    </label>
                                                    <label class="c-8" for="sp-8">
                                                        <input type="radio" id="sp-8">
                                                    </label>
                                                    <label class="c-9" for="sp-9">
                                                        <input type="radio" id="sp-9">
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-heading">
                                            <a data-toggle="collapse" data-target="#collapseSix">Tags</a>
                                        </div>
                                        <div id="collapseSix" class="collapse show" data-parent="#accordionExample">
                                            <div class="card-body">
                                                <div class="shop__sidebar__tags">
                                                    <a href="#">Product</a>
                                                    <a href="#">Bags</a>
                                                    <a href="#">Shoes</a>
                                                    <a href="#">Fashion</a>
                                                    <a href="#">Clothing</a>
                                                    <a href="#">Hats</a>
                                                    <a href="#">Accessories</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9">
                        <div class="shop__product__option">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="shop__product__option__left">
                                        <c:if test="${fn:length(listP)>0}">
                                            <p>Showing ${currentPage*12+1}–${currentPage*12+fn:length(listP)} of ${sum} results</p>
                                        </c:if>
                                        <c:if test="${fn:length(listP)<=0}">
                                            <p style="color:red;">Showing 0 of 0 results</p>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="shop__product__option__right">

                                        <p>SortBy Shop's Product:</p>  
                                        <select name="links" id="" size="1" onchange="window.location.href = this.value;">
                                            <option>Select Option By Price</option>
                                            <option  value="http://localhost:8080/Spring_MVC_Project_Final/shopp?key=lowtohigh">Low To High</option>
                                            <option  value="http://localhost:8080/Spring_MVC_Project_Final/shopp?key=hightolow">High To Low</option>
                                            <option  value="http://localhost:8080/Spring_MVC_Project_Final/shopp?key=fiftydollarsless">$0 - $55</option>
                                            <option  value="http://localhost:8080/Spring_MVC_Project_Final/shopp?key=fiftydollarsmore">> $55 </option>
                                        </select>
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <c:if test="${fn:length(listP)>0}">
                                    <c:forEach items="${listP}" var="p">
                                        <a href="<c:url value="/details/${p.id}"/>">  
                                            <div class="col-lg-4 col-md-6 col-sm-6">
                                                <div class="product__item">
                                                    <div class="product__item__pic set-bg">
                                                        <c:forEach items="${p.images}" begin="0" end="0" var="i">
                                                            <img style="height:100%;width:100%;" loading="lazy" src="<c:url value="/resources/img/product/${i.getName()}"/>"/>                                                                                                                                            
                                                        </c:forEach>   
                                                        <ul class="product__hover">
                                                            <li><a href="<c:url value="/login"/>"><img src="<c:url value="/resources/img/icon/heart.png"/>" alt=""></a></li>
                                                            <li><a href="#"><img src="<c:url value="/resources/img/icon/compare.png"/>" alt=""> <span>Compare</span></a>
                                                            </li>
                                                            <li><a href="#"><img src="<c:url value="/resources/img/icon/search.png"/>" alt=""></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="product__item__text">
                                                        <h6 style="height:18px;overflow-y: hidden">${p.name}</h6>
                                                        <a href="<c:url value="/login"/>" class="add-cart">+ Add To Cart</a>
                                                        <div style="height: 47px;
                                                             overflow-y: hidden;">
                                                            ${p.description} 
                                                        </div>
                                                        <h5>$${p.price}</h5>
                                                        <div class="product__color__select">
                                                            <label for="pc-4">
                                                                <input type="radio" id="pc-4">
                                                            </label>
                                                            <label class="active black" for="pc-5">
                                                                <input type="radio" id="pc-5">
                                                            </label>
                                                            <label class="grey" for="pc-6">
                                                                <input type="radio" id="pc-6">
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </a>  
                                    </c:forEach>
                                </c:if>
                                <c:if test="${fn:length(listP)<=0}">
                                    <h3 colspan="8" style="color: red;">Product Not Found!!!</h3>
                                </c:if>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Shop Section End -->
        <!-- Shop page Begin -->
        <div style="margin-bottom: 20px;"class="col-lg-12">
            <div class="row">
                <div class="col-lg-12">
                    <div class="product__pagination">
                        <c:if test="${query=='shop'}">

                            <c:forEach  begin="1" end="${endPage}" var="i">
                                <a class="page-link" href="<c:url value="/shopp?p=${i-1}"/>">${i}</a>
                            </c:forEach>
                        </c:if>
                        <c:if test="${query=='search'}">

                            <c:forEach  begin="1" end="${endPage}" var="i">
                                <a class="page-link" href="<c:url value="/paginate?s=${i-1}"/>">${i}</a>
                            </c:forEach>
                        </c:if>
                        <c:if test="${query=='branding'}">

                            <c:forEach  begin="1" end="${endPage}" var="i">
                                <a class="page-link" href="<c:url value="/paginate-branding?b=${i-1}"/>">${i}</a>
                            </c:forEach>
                        </c:if>
                        <c:if test="${query=='category'}">

                            <c:forEach  begin="1" end="${endPage}" var="i">
                                <a class="page-link" href="<c:url value="/paginate-category?s=${i-1}"/>">${i}</a>
                            </c:forEach>
                        </c:if>
                        <c:if test="${query=='lowtohigh'}">

                            <c:forEach  begin="1" end="${endPage}" var="i">
                                <a class="page-link" href="<c:url value="/paginate-lowtohigh?l=${i-1}"/>">${i}</a>
                            </c:forEach>
                        </c:if>
                        <c:if test="${query=='hightolow'}">

                            <c:forEach  begin="1" end="${endPage}" var="i">
                                <a class="page-link" href="<c:url value="/paginate-hightolow?h=${i-1}"/>">${i}</a>
                            </c:forEach>
                        </c:if>
                        <c:if test="${query=='fiftydollarsmore'}">

                            <c:forEach  begin="1" end="${endPage}" var="i">
                                <a class="page-link" href="<c:url value="/paginate-fiftydollarsmore?fm=${i-1}"/>">${i}</a>
                            </c:forEach>
                        </c:if>
                        <c:if test="${query=='fiftydollarsless'}">

                            <c:forEach  begin="1" end="${endPage}" var="i">
                                <a class="page-link" href="<c:url value="/paginate-fiftydollarsless?fl=${i-1}"/>">${i}</a>
                            </c:forEach>
                        </c:if>

                    </div>
                </div>
            </div>
        </div>
        <!-- Shop page End -->
        <jsp:include page="include/footer-page.jsp"/>

        <!-- Search Begin -->
        <div class="search-model">
            <div class="h-100 d-flex align-items-center justify-content-center">
                <div class="search-close-switch">+</div>
                <form class="search-model-form">
                    <input type="text" id="search-input" placeholder="Search here.....">
                </form>
            </div>
        </div>
        <!-- Search End -->

        <!-- Js Plugins -->
        <jsp:include page="include/js-page.jsp"/>
    </body>
</html>
