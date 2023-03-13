<%-- 
    Document   : details
    Created on : Dec 2, 2022, 10:56:33 AM
    Author     : Admin
--%>

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
        <title>Guest Male-Fashion</title>
        <jsp:include page="include/css-page.jsp"/>
    </head>
    <body>

        <jsp:include page="include/menu.jsp"/>

        <jsp:include page="include/header.jsp"/>

        <!-- Breadcrumb Section Begin -->
        <section class="breadcrumb-blog set-bg" data-setbg="<c:url value="resources/img/breadcrumb-bg.jpg"/>">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h2>Our Blog</h2>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb Section End -->

        <!-- Blog Section Begin -->
        <section class="blog spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="blog__item">
                            <div class="blog__item__pic set-bg" data-setbg="<c:url value="resources/img/blog/blog-1.jpg"/>"></div>
                            <div class="blog__item__text">
                                <span><img src="<c:url value="resources/img/icon/calendar.png"/>" alt=""> 16 February 2020</span>
                                <h5>What Curling Irons Are The Best Ones</h5>
                                <a href="#">Read More</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="blog__item">
                            <div class="blog__item__pic set-bg" data-setbg="<c:url value="resources/img/blog/blog-2.jpg"/>"></div>
                            <div class="blog__item__text">
                                <span><img src="<c:url value="resources/img/icon/calendar.png"/>" alt=""> 21 February 2020</span>
                                <h5>Eternity Bands Do Last Forever</h5>
                                <a href="#">Read More</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="blog__item">
                            <div class="blog__item__pic set-bg" data-setbg="<c:url value="resources/img/blog/blog-3.jpg"/>"></div>
                            <div class="blog__item__text">
                                <span><img src="<c:url value="resources/img/icon/calendar.png"/>" alt=""> 28 February 2020</span>
                                <h5>The Health Benefits Of Sunglasses</h5>
                                <a href="#">Read More</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="blog__item">
                            <div class="blog__item__pic set-bg" data-setbg="<c:url value="resources/img/blog/blog-4.jpg"/>"></div>
                            <div class="blog__item__text">
                                <span><img src="<c:url value="resources/img/icon/calendar.png"/>" alt=""> 16 February 2020</span>
                                <h5>Aiming For Higher The Mastopexy</h5>
                                <a href="#">Read More</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="blog__item">
                            <div class="blog__item__pic set-bg" data-setbg="<c:url value="resources/img/blog/blog-5.jpg"/>"></div>
                            <div class="blog__item__text">
                                <span><img src="<c:url value="resources/img/icon/calendar.png"/>" alt=""> 21 February 2020</span>
                                <h5>Wedding Rings A Gift For A Lifetime</h5>
                                <a href="#">Read More</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="blog__item">
                            <div class="blog__item__pic set-bg" data-setbg="<c:url value="resources/img/blog/blog-6.jpg"/>"></div>
                            <div class="blog__item__text">
                                <span><img src="<c:url value="resources/img/icon/calendar.png"/>" alt=""> 28 February 2020</span>
                                <h5>The Different Methods Of Hair Removal</h5>
                                <a href="#">Read More</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="blog__item">
                            <div class="blog__item__pic set-bg" data-setbg="<c:url value="resources/img/blog/blog-7.jpg"/>"></div>
                            <div class="blog__item__text">
                                <span><img src="<c:url value="resources/img/icon/calendar.png"/>" alt=""> 16 February 2020</span>
                                <h5>Hoop Earrings A Style From History</h5>
                                <a href="#">Read More</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="blog__item">
                            <div class="blog__item__pic set-bg" data-setbg="<c:url value="resources/img/blog/blog-8.jpg"/>"></div>
                            <div class="blog__item__text">
                                <span><img src="<c:url value="resources/img/icon/calendar.png"/>" alt=""> 21 February 2020</span>
                                <h5>Lasik Eye Surgery Are You Ready</h5>
                                <a href="#">Read More</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="blog__item">
                            <div class="blog__item__pic set-bg" data-setbg="<c:url value="resources/img/blog/blog-9.jpg"/>"></div>
                            <div class="blog__item__text">
                                <span><img src="<c:url value="resources/img/icon/calendar.png"/>" alt=""> 28 February 2020</span>
                                <h5>Lasik Eye Surgery Are You Ready</h5>
                                <a href="#">Read More</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Blog Section End -->
        <jsp:include page="include/footer-page.jsp"/>
        <jsp:include page="include/js-page.jsp"/>

    </body>
</html>
