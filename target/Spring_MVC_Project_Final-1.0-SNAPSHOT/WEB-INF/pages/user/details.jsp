<%-- 
    Document   : details
    Created on : Dec 2, 2022, 10:56:33 AM
    Author     : Admin
--%>

<%@page import="com.mycompany.spring_mvc_project_final.entities.ProductEntity"%>
<%@page import="com.mycompany.spring_mvc_project_final.entities.ImageEntity"%>
<%@page import="com.mycompany.spring_mvc_project_final.entities.ColorEntity"%>
<%@page import="com.mycompany.spring_mvc_project_final.entities.SizeEntity"%>
<%@page import="com.mycompany.spring_mvc_project_final.entities.ProductDetailEntity"%>
<%@page import="com.mycompany.spring_mvc_project_final.entities.ProductDetailEntity"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>

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
        <jsp:include page="../include/css-page.jsp"/>
    </head>
    <%

        List<ProductDetailEntity> listPD = (List<ProductDetailEntity>) session.getAttribute("listPD");
        List<SizeEntity> sizes = (List<SizeEntity>) session.getAttribute("sizes");
        List<ImageEntity> imageList = (List<ImageEntity>) session.getAttribute("imageList");
        ProductEntity product = (ProductEntity) session.getAttribute("product");
        List<ColorEntity> colors = (List<ColorEntity>) session.getAttribute("colors");
    %>
    <body>


        <jsp:include page="../include/menu.jsp"/>

        <jsp:include page="../include/header.jsp"/>

        <!-- Shop Details Section Begin -->
        <section style="padding-top: 134px;" class="shop-details">
            <div class="product__details__pic">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="product__details__breadcrumb">
                                <a href="<c:url value="/user/home"/>">Home</a>
                                <a href="<c:url value="/user/shopp"/>">Shop</a>
                                <span>User Details</span>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div style="margin-top: -91px;">
                <c:if test="${mess != null}">

                    ${mess}

                </c:if>
                <c:if test="${listPD != null&& action=='ChooseAnotherColor'}">

                    <c:forEach items="${listPD}" var="p">
                        <c:forEach items="${colors}" var="c">
                            <c:if test="${c.id==p.color.id}">
                                <div class="col-sm-12">
                                    <div class="alert alert-danger">
                                        ${c.color.getValue()}
                                    </div>
                                </div>
                            </c:if> 
                        </c:forEach>
                    </c:forEach>
                </c:if> <c:if test="${listPD != null&& action=='ChooseAnotherSize'}">

                    <c:forEach items="${listPD}" var="p">
                        <c:forEach items="${sizes}" var="s">
                            <c:if test="${s.id==p.size.id}">
                                <div class="col-sm-12">
                                    <div class="alert alert-danger">
                                        ${s.size.getValue()}
                                    </div>
                                </div>
                            </c:if> 
                        </c:forEach>
                    </c:forEach>
                </c:if>

            </div>
            <style>

                .custom-select{
                    width:79px;
                    display:flex;
                    justify-items: center;
                }
                .current{
                    display:flex;
                }
            </style>
            <mvc:form action="${pageContext.request.contextPath}/user/add-to-cart/${product.id}" 
                      method="POST" modelAttribute="orderDetail" >

                <div style="margin-left: 75px;" class="product__details__content">
                    <div display:flex;>
                        <!-- Container for the image gallery -->
                        <div style="z-index: 3;width:534px;float:left;"class="container">

                            <!-- Full-width images with number text -->
                            <c:forEach items="${product.images}" var="p" varStatus="index" >
                                <div style="border: solid 1px black;"class="mySlides">
                                    <div  class="numbertext">${index.index+1} / ${product.images.size()}</div>
                                    <img  src="<c:url value="/resources/img/product/${p.getName()}"/>" style="width:100%;height:500px;">
                                </div>
                            </c:forEach>
                            <!--                 Next and previous buttons 
                                            <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                                            <a class="next" onclick="plusSlides(1)">&#10095;</a>-->

                            <!-- Image text -->
                            <!--                <div class="caption-container">
                                                <p id="caption"></p>
                                            </div>-->

                            <!-- Thumbnail images -->
                            <div style="margin-top: 9px;width:521px;display:flex;flex-direction: row;margin-left:0;margin-right: 0;justify-content: space-between;"class="row">
                                <c:forEach items="${product.images}" var="p" end="4" varStatus="index" >
                                    <div class="column">
                                        <img style="border: solid 1px black;"class="demo cursor" src="<c:url value="/resources/img/product/${p.getName()}"/>"  style=" width:100px;" onclick="currentSlide(${index.index+1})" alt="photo">
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <!--////-->
                        <style>
                            * {
                                box-sizing: border-box;
                            }

                            /* Position the image container (needed to position the left and right arrows) */
                            .container {
                                position: relative;
                            }

                            /* Hide the images by default */
                            .mySlides {
                                display: none;
                            }

                            /* Add a pointer when hovering over the thumbnail images */
                            .cursor {
                                cursor: pointer;
                            }

                            /* Next & previous buttons */
                            .prev,
                            .next {
                                cursor: pointer;
                                position: absolute;
                                top: 40%;
                                width: auto;
                                padding: 16px;
                                margin-top: -50px;
                                color: white;
                                font-weight: bold;
                                font-size: 20px;
                                border-radius: 0 3px 3px 0;
                                user-select: none;
                                -webkit-user-select: none;
                            }

                            /* Position the "next button" to the right */
                            .next {
                                right: 0;
                                border-radius: 3px 0 0 3px;
                            }

                            /* On hover, add a black background color with a little bit see-through */
                            .prev:hover,
                            .next:hover {
                                background-color: rgba(0, 0, 0, 0.8);
                            }

                            /* Number text (1/3 etc) */
                            .numbertext {
                                color: #f2f2f2;
                                font-size: 12px;
                                padding: 8px 12px;
                                position: absolute;
                                top: 0;
                            }

                            /* Container for image text */
                            .caption-container {
                                text-align: center;
                                background-color: #222;
                                padding: 2px 16px;
                                color: white;
                            }

                            .row:after {
                                content: "";
                                display: table;
                                clear: both;
                            }

                            /* Six columns side by side */
                            .column {
                                float: left;
                                width: 16.66%;
                            }

                            /* Add a transparency effect for thumnbail images */
                            .demo {
                                opacity: 1;
                            }

                            .active,
                            .demo:hover {
                                opacity: 0.9;
                            }

                        </style>
                        <script>

                            let slideIndex = 1;
                            showSlides(slideIndex);

                            // Next/previous controls
                            function plusSlides(n) {
                                showSlides(slideIndex += n);
                            }

                            // Thumbnail image controls
                            function currentSlide(n) {
                                showSlides(slideIndex = n);
                            }

                            function showSlides(n) {
                                let i;
                                let slides = document.getElementsByClassName("mySlides");
                                let dots = document.getElementsByClassName("demo");
                                let captionText = document.getElementById("caption");
                                if (n > slides.length) {
                                    slideIndex = 1
                                }
                                if (n < 1) {
                                    slideIndex = slides.length
                                }
                                for (i = 0; i < slides.length; i++) {
                                    slides[i].style.display = "none";
                                }
                                for (i = 0; i < dots.length; i++) {
                                    dots[i].className = dots[i].className.replace(" active", "");
                                }
                                slides[slideIndex - 1].style.display = "block";
                                dots[slideIndex - 1].className += " active";
                                captionText.innerHTML = dots[slideIndex - 1].alt;
                            }

                        </script>
                        <div style=""class="container">
                            <div class="row d-flex justify-content-center">
                                <div class="col-lg-8">
                                    <div class="product__details__text">
                                        <h4>${product.name}</h4>

                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-o"></i>
                                            <span> - 5 Reviews</span>
                                        </div>

                                        <h3><input style="width:105px;border:none;" name="price" readonly value="${product.price}" />$</h3>

                                        <!--<span>70.00</span>-->
                                        <p>${product.description}</p>
                                        <div style="margin-bottom:2px;margin-top: -20px;margin-left: -176px;"class="row">
                                            <div style="margin-left: 304px;" class="col-sm-6">
                                                <div class="form-group">
                                                    <div style="display:flex;">
                                                        <span style="margin-right: 27px;padding-top: 9px;">Size: </span>
                                                        <div>
                                                            <select style="margin-left: 229px;
                                                                    margin-bottom: 8px;"  name="size" class="custom-select"> 
                                                                <c:forEach items="${sizes}" var="s">
                                                                    <option  value="${s.id}">${s.size}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            <div style="    margin-left: 304px;" class="col-sm-6">
                                                <div class="form-group">
                                                    <div style="display:flex;">
                                                        <span style="padding-top: 9px;margin-right: 23px;">Color</span>
                                                        <select  name="color" class="custom-select"> 
                                                            <c:forEach items="${colors}" var="c">
                                                                <option value="${c.id}">${c.color}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="product__details__cart__option">
                                            <div class="quantity">

                                                <div>
                                                    <input style="width:41px;"name="quantity" value="1" min="1" type="number"  >
                                                </div>
                                            </div>
                                            <sec:authorize access="isAuthenticated()">
                                                <sec:authorize access="hasRole('ROLE_USER')">
                                                    <button class="primary-btn" type="submit"> Add to Cart</button>
                                                </sec:authorize>
                                            </sec:authorize>
                                            <sec:authorize access="!isAuthenticated()">
                                                <a href="<c:url value="/login"/>" class="primary-btn"> Buy Now</a>

                                            </sec:authorize>

                                        </div>


                                        <div class="product__details__btns__option">
                                            <a href="<c:url value="/user/add-to-favorite/${product.id}"/>"><i class="fa fa-heart"></i> add to wishlist</a>
                                            <a href="#"><i class="fa fa-exchange"></i> Add To Compare</a>
                                        </div>
                                        <div class="product__details__last__option">
                                            <h5><span>Guaranteed Safe Checkout</span></h5>
                                            <img src="<c:url value="/resources/img/shop-details/details-payment.png"/>" alt="">
                                            <ul>
                                                <li><span>SKU:</span> 3812912</li>
                                                <li><span>Categories:</span> Clothes</li>
                                                <li><span>Tag:</span> Clothes, Skin, Body</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>

                </div>
            </mvc:form>

        </section>
        <section style="clear:both;">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="product__details__tab">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#tabs-5"
                                       role="tab">Description</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#tabs-6" role="tab">Customer
                                        Previews(5)</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#tabs-7" role="tab">Additional
                                        information</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tabs-5" role="tabpanel">
                                    <div class="product__details__tab__content">
                                        <p class="note">Nam tempus turpis at metus scelerisque placerat nulla deumantos
                                            solicitud felis. Pellentesque diam dolor, elementum etos lobortis des mollis
                                            ut risus. Sedcus faucibus an sullamcorper mattis drostique des commodo
                                            pharetras loremos.</p>
                                        <div class="product__details__tab__content__item">
                                            <h5>Products Infomation</h5>
                                            <p>A Pocket PC is a handheld computer, which features many of the same
                                                capabilities as a modern PC. These handy little devices allow
                                                individuals to retrieve and store e-mail messages, create a contact
                                                file, coordinate appointments, surf the internet, exchange text messages
                                                and more. Every product that is labeled as a Pocket PC must be
                                                accompanied with specific software to operate the unit and must feature
                                                a touchscreen and touchpad.</p>
                                            <p>As is the case with any new technology product, the cost of a Pocket PC
                                                was substantial during it’s early release. For approximately $700.00,
                                                consumers could purchase one of top-of-the-line Pocket PCs in 2003.
                                                These days, customers are finding that prices have become much more
                                                reasonable now that the newness is wearing off. For approximately
                                                $350.00, a new Pocket PC can now be purchased.</p>
                                        </div>
                                        <div class="product__details__tab__content__item">
                                            <h5>Material used</h5>
                                            <p>Polyester is deemed lower quality due to its none natural quality’s. Made
                                                from synthetic materials, not natural like wool. Polyester suits become
                                                creased easily and are known for not being breathable. Polyester suits
                                                tend to have a shine to them compared to wool and cotton suits, this can
                                                make the suit look cheap. The texture of velvet is luxurious and
                                                breathable. Velvet is a great choice for dinner party jacket and can be
                                                worn all year round.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tabs-6" role="tabpanel">
                                    <div class="product__details__tab__content">
                                        <div class="product__details__tab__content__item">
                                            <h5>Products Infomation</h5>
                                            <p>A Pocket PC is a handheld computer, which features many of the same
                                                capabilities as a modern PC. These handy little devices allow
                                                individuals to retrieve and store e-mail messages, create a contact
                                                file, coordinate appointments, surf the internet, exchange text messages
                                                and more. Every product that is labeled as a Pocket PC must be
                                                accompanied with specific software to operate the unit and must feature
                                                a touchscreen and touchpad.</p>
                                            <p>As is the case with any new technology product, the cost of a Pocket PC
                                                was substantial during it’s early release. For approximately $700.00,
                                                consumers could purchase one of top-of-the-line Pocket PCs in 2003.
                                                These days, customers are finding that prices have become much more
                                                reasonable now that the newness is wearing off. For approximately
                                                $350.00, a new Pocket PC can now be purchased.</p>
                                        </div>
                                        <div class="product__details__tab__content__item">
                                            <h5>Material used</h5>
                                            <p>Polyester is deemed lower quality due to its none natural quality’s. Made
                                                from synthetic materials, not natural like wool. Polyester suits become
                                                creased easily and are known for not being breathable. Polyester suits
                                                tend to have a shine to them compared to wool and cotton suits, this can
                                                make the suit look cheap. The texture of velvet is luxurious and
                                                breathable. Velvet is a great choice for dinner party jacket and can be
                                                worn all year round.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tabs-7" role="tabpanel">
                                    <div class="product__details__tab__content">
                                        <p class="note">Nam tempus turpis at metus scelerisque placerat nulla deumantos
                                            solicitud felis. Pellentesque diam dolor, elementum etos lobortis des mollis
                                            ut risus. Sedcus faucibus an sullamcorper mattis drostique des commodo
                                            pharetras loremos.</p>
                                        <div class="product__details__tab__content__item">
                                            <h5>Products Infomation</h5>
                                            <p>A Pocket PC is a handheld computer, which features many of the same
                                                capabilities as a modern PC. These handy little devices allow
                                                individuals to retrieve and store e-mail messages, create a contact
                                                file, coordinate appointments, surf the internet, exchange text messages
                                                and more. Every product that is labeled as a Pocket PC must be
                                                accompanied with specific software to operate the unit and must feature
                                                a touchscreen and touchpad.</p>
                                            <p>As is the case with any new technology product, the cost of a Pocket PC
                                                was substantial during it’s early release. For approximately $700.00,
                                                consumers could purchase one of top-of-the-line Pocket PCs in 2003.
                                                These days, customers are finding that prices have become much more
                                                reasonable now that the newness is wearing off. For approximately
                                                $350.00, a new Pocket PC can now be purchased.</p>
                                        </div>
                                        <div class="product__details__tab__content__item">
                                            <h5>Material used</h5>
                                            <p>Polyester is deemed lower quality due to its none natural quality’s. Made
                                                from synthetic materials, not natural like wool. Polyester suits become
                                                creased easily and are known for not being breathable. Polyester suits
                                                tend to have a shine to them compared to wool and cotton suits, this can
                                                make the suit look cheap. The texture of velvet is luxurious and
                                                breathable. Velvet is a great choice for dinner party jacket and can be
                                                worn all year round.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Shop Details Section End -->
        <!--/////-->



        <!-- Related Section Begin -->
        <section class="related spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h3 class="related-title">Related Product</h3>
                    </div>
                </div>

                <div class="row">
                    <c:forEach items="${listRelatedProduct}" var="product">
                        <a href="<c:url value="/user/details/${product.id}"/>"> 
                           
                            <div class="col-lg-3 col-md-6 col-sm-6 col-sm-6">
                                <div class="product__item">
                                    <c:forEach items="${product.images}" begin="0" end="0" var="i">
                                            <div class="product__item__pic set-bg" data-setbg="<c:url value="/resources/img/product/${i.getName()}"/>">
                                        
                                        <span class="label">New</span>
                                        <ul class="product__hover">
                                            <li><a href="#"><img src="<c:url value="/resources/img/icon/heart.png"/>" alt=""></a></li>
                                            <li><a href="#"><img src="<c:url value="/resources/img/icon/compare.png"/>" alt=""> <span>Compare</span></a></li>
                                            <li><a href="#"><img src="<c:url value="/resources/img/icon/search.png"/>" alt=""></a></li>
                                        </ul>
                                    </div>
                                </c:forEach>
                                <div class="product__item__text">
                                    <h6>${product.name}</h6>
                                    <div style="height:30px;overflow-y: hidden;"class="">
                                        ${product.description}
                                    </div>
                                    <a href="<c:url value="/user/details/${product.id}"/>" class="add-cart">+ Add To Cart</a>
                                    <div class="rating">
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                    </div>
                                    <h5>$${product.price}</h5>
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
            </div>
        </div>
    </section>
    <!-- Related Section End -->
    <jsp:include page="../include/footer-page.jsp"/>
    <jsp:include page="../include/js-page.jsp"/>

</body>
</html>
