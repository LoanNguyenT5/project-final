<%-- 
    Document   : index
    Created on : Nov 24, 2022, 5:13:09 PM
    Author     : ADMIN
--%>
<%@taglib  uri="http://www.springframework.org/security/tags" prefix="sec" %>

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
        <title>User's Male-Fashion</title>
        <jsp:include page="../include/css-page.jsp"/>
    </head>
    <body>
        <jsp:include page="../include/menu.jsp"/>
        <jsp:include page="../include/header.jsp"/>
        <!-- Hero Section Begin -->
        <section  class="hero">
            <div class="hero__slider owl-carousel">
                <div class="hero__items set-bg" data-setbg="<c:url value="/resources/img/hero/hero-2.jpg"/>">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-5 col-lg-7 col-md-8">
                                <div class="hero__text">
                                    <h6>Summer Collection</h6>
                                    <h2>Fall - Winter Collections 2023</h2>
                                    <p>A specialist label creating luxury essentials. Ethically crafted with an unwavering
                                        commitment to exceptional quality.</p>
                                    <a href="<c:url value="/user/shopp"/>" class="primary-btn">Shop now <span class="arrow_right"></span></a>
                                    <div class="hero__social">
                                        <a href="#"><i class="fa fa-facebook"></i></a>
                                        <a href="#"><i class="fa fa-twitter"></i></a>
                                        <a href="#"><i class="fa fa-pinterest"></i></a>
                                        <a href="#"><i class="fa fa-instagram"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hero__items set-bg" data-setbg="<c:url value="/resources/img/hero/hero-1.jpg"/>">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-5 col-lg-7 col-md-8">
                                <div class="hero__text">
                                    <h6>Summer Collection</h6>
                                    <h2>Fall - Winter Collections 2023</h2>
                                    <p>A specialist label creating luxury essentials. Ethically crafted with an unwavering
                                        commitment to exceptional quality.</p>
                                    <a href="#" class="primary-btn">Shop now <span class="arrow_right"></span></a>
                                    <div class="hero__social">
                                        <a href="#"><i class="fa fa-facebook"></i></a>
                                        <a href="#"><i class="fa fa-twitter"></i></a>
                                        <a href="#"><i class="fa fa-pinterest"></i></a>
                                        <a href="#"><i class="fa fa-instagram"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Hero Section End -->

        <!-- Banner Section Begin -->
        <section class="banner spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7 offset-lg-4">
                        <div class="banner__item">
                            <div class="banner__item__pic">
                                <img style=""src="<c:url value="/resources/img/banner/banner-9.jpg"/>" alt="">
                            </div>
                            <div style="" class="banner__item__text">
                                <h2>Clothing Collections 2023</h2>
                                <a href="/user/shopp">Shop now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="banner__item banner__item--middle">
                            <div class="banner__item__pic">
                                <img src="<c:url value="/resources/img/banner/banner-4.jpg"/>" alt="">
                            </div>
                            <div class="banner__item__text">
                                <h2>Black_Shirt</h2>
                                <a href="#">Shop now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <div class="banner__item banner__item--last">
                            <div class="banner__item__pic">
                                <img style="margin-left: 64px;"src="<c:url value="/resources/img/banner/banner-5.jpg"/>" alt="">
                            </div>
                            <!--                            <div class="banner__item__text">
                                                            <h2>Shoes Spring 2030</h2>
                                                            <a href="#">Shop now</a>
                                                        </div>-->
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Banner Section End -->

        <!-- Product Section Begin -->
        <section class="product spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <ul class="filter__controls">
                            <li class="active" data-filter="*">Best Sellers</li>
                            <li data-filter=".new-arrivals">New Arrivals</li>
                            <li data-filter=".hot-sales">Hot Sales</li>
                        </ul>
                    </div>
                </div>

                <div class="row product__filter">
                    <c:forEach items="${listNewArrivals}" var="p">
                        <a style="width:"href="<c:url value="/user/details/${p.id}"/>">  
                            <div  class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals ">
                                <div class="product__item">
                                    <c:forEach items="${p.images}" begin="0" end="0" var="i">
                                        <div class="product__item__pic set-bg" data-setbg="<c:url value="/resources/img/product/${i.getName()}"/>">
                                            <span style="z-index: 2;"class="label">New</span>
                                            <ul class="product__hover">
                                                <li><a href="#"><img src="<c:url value="/resources/img/icon/heart.png"/>" alt=""></a></li>
                                                <li><a href="#"><img src="<c:url value="/resources/img/icon/compare.png"/>" alt=""> <span>Compare</span></a></li>
                                                <li><a href="<c:url value="/user/details/${p.id}"/>"><img src="<c:url value="/resources/img/icon/cart.png"/>" alt=""></a></li>
                                            </ul>
                                        </div>
                                    </c:forEach>
                                    <div class="product__item__text">
                                        <h6>${p.name}</h6>
                                        <%--<sec:authorize>--%>
                                            <!--<a class="add-cart" href="<c:url value="/user/details/${p.id}"/>"> Add To Cart</a>-->
                                        <%--</sec:authorize>--%>

                                        <div style="height:27px;overflow-y: hidden;" class="">
                                            ${p.description}
                                        </div>
                                        <a href="<c:url value="/user/details/${p.id}"/>" class="add-cart">+ Add To Cart</a>
                                        <h5>$${p.price}</h5>
                                        <div class="product__color__select">
                                            <label for="pc-1">
                                                <input type="radio" id="pc-1">
                                            </label>
                                            <label class="active black" for="pc-2">
                                                <input type="radio" id="pc-2">
                                            </label>
                                            <label class="grey" for="pc-3">
                                                <input type="radio" id="pc-3">
                                            </label>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </a>
                    </c:forEach>

                    <c:forEach items="${listBestSeller}" var="p">
                       
                        <a href="<c:url value="/user/details/${p.id}"/>"> 
                            <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales">
                                <div class="product__item">
                                    <c:forEach items="${p.images}" begin="0" end="0" var="i">
                                        <div class="product__item__pic set-bg" data-setbg="<c:url value="/resources/img/product/${i.getName()}"/>">
                                            <span style="z-index: 2;"class="label">Hot</span>
                                            <ul class="product__hover">
                                                
                                                <li><a href="#"><img src="<c:url value="/resources/img/icon/heart.png"/>" alt=""></a></li>
                                                <li><a href="#"><img src="<c:url value="/resources/img/icon/compare.png"/>" alt=""> <span>Compare</span></a></li>
                                                <li><a href="<c:url value="/user/details/${p.id}"/>"><img src="<c:url value="/resources/img/icon/cart.png"/>" alt=""></a></li>
                                            </ul>
                                        </div>
                                    </c:forEach>
                                    <div class="product__item__text">
                                        <h6>${p.name}</h6>
                                       

                                        <div style="height:27px;overflow-y: hidden;" class="">
                                            ${p.description}
                                        </div>
                                        <a href="<c:url value="/user/details/${p.id}"/>" class="add-cart">+ Add To Cart</a>
                                        <div class="rating">
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                        </div>
                                        <h5>$${p.price}</h5>
                                        <div class="product__color__select">
                                            <label for="pc-10">
                                                <input type="radio" id="pc-10">
                                            </label>
                                            <label class="active black" for="pc-11">
                                                <input type="radio" id="pc-11">
                                            </label>
                                            <label class="grey" for="pc-12">
                                                <input type="radio" id="pc-12">
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </c:forEach>


                </div>
            </div>
        </section>
        <!-- Product Section End -->

        <!-- Categories Section Begin -->
        <section class="categories spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="categories__text">
                            <h2> Flash sale<br /> <span>Clothings Hot </span> <br />Come on </h2>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="categories__hot__deal">
                            <img src="<c:url value="/resources/img/product-sale1.png"/>" alt="">
                            <div class="hot__deal__sticker">
                                <span>Sale Of</span>
                                <h5>$29.99</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 offset-lg-1">
                        <div class="categories__deal__countdown">
                            <span>Deal Of The Week</span>
                            <h2>100% Cotton Black T_Shirt</h2>
                            <div class="categories__deal__countdown__timer" id="countdown">
                                <div class="cd-item">
                                    <span>3</span>
                                    <p>Days</p>
                                </div>
                                <div class="cd-item">
                                    <span>1</span>
                                    <p>Hours</p>
                                </div>
                                <div class="cd-item">
                                    <span>50</span>
                                    <p>Minutes</p>
                                </div>
                                <div class="cd-item">
                                    <span>18</span>
                                    <p>Seconds</p>
                                </div>
                            </div>
                            <a href="#" class="primary-btn">Shop now</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Categories Section End -->

        <!-- Instagram Section Begin -->
        <section class="instagram spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="instagram__pic">
                            <div class="instagram__pic__item set-bg" data-setbg="<c:url value="/resources/img/instagram/instagram-7.jpg"/>"></div>
                            <div class="instagram__pic__item set-bg" data-setbg="<c:url value="/resources/img/instagram/instagram-8.jpg"/>"></div>
                            <div class="instagram__pic__item set-bg" data-setbg="<c:url value="/resources/img/instagram/instagram-9.jpg"/>"></div>
                            <div class="instagram__pic__item set-bg" data-setbg="<c:url value="/resources/img/instagram/instagram-10.jpg"/>"></div>
                            <div class="instagram__pic__item set-bg" data-setbg="<c:url value="/resources/img/instagram/instagram-11.jpg"/>"></div>
                            <div class="instagram__pic__item set-bg" data-setbg="<c:url value="/resources/img/instagram/instagram-12.jpg"/>"></div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="instagram__text">
                            <h2>Instagram</h2>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                                labore et dolore magna aliqua.</p>
                            <h3>#Male_Fashion</h3>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Instagram Section End -->

        <!-- Latest Blog Section Begin -->
        <section class="latest spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title">
                            <span>Latest News</span>
                            <h2>Fashion New Trends</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="blog__item">
                            <div class="blog__item__pic set-bg" data-setbg="<c:url value="/resources/img/blog/blog-1.jpg"/>"></div>
                            <div class="blog__item__text">
                                <span><img src="img/icon/calendar.png" alt=""> 16 February 2020</span>
                                <h5>What Curling Irons Are The Best Ones</h5>
                                <a href="#">Read More</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="blog__item">
                            <div class="blog__item__pic set-bg" data-setbg="<c:url value="/resources/img/blog/blog-2.jpg"/>"></div>
                            <div class="blog__item__text">
                                <span><img src="img/icon/calendar.png" alt=""> 21 February 2020</span>
                                <h5>Eternity Bands Do Last Forever</h5>
                                <a href="#">Read More</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="blog__item">
                            <div class="blog__item__pic set-bg" data-setbg="<c:url value="/resources/img/blog/blog-3.jpg"/>"></div>
                            <div class="blog__item__text">
                                <span><img src="img/icon/calendar.png" alt=""> 28 February 2020</span>
                                <h5>The Health Benefits Of Sunglasses</h5>
                                <a href="#">Read More</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Latest Blog Section End -->

        <jsp:include page="../include/footer-page.jsp"/>

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
        <jsp:include page="../include/js-page.jsp"/>
    </body>
</html>
