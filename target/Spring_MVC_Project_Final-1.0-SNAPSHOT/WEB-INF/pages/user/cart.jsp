<%-- 
    Document   : details
    Created on : Dec 2, 2022, 10:56:33 AM
    Author     : Admin
--%>

<%@page import="com.mycompany.spring_mvc_project_final.entities.ProductDetailEntity"%>
<%@page import="com.mycompany.spring_mvc_project_final.entities.OrderDetailEntity"%>
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
        <title>Male-Fashion | Template</title>
        <link rel="stylesheet" href="<c:url value="/webjars/bootstrap/4.6.2/css/bootstrap.min.css"/>"/>
        <script
            src="https://code.jquery.com/jquery-3.6.1.js"
            integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
        crossorigin="anonymous"></script>

        <script src="<c:url value="/resources/js/cartjs.js" />"></script>


        <!-- Css Styles -->
        <jsp:include page="../include/css-page.jsp"/>
    </head>
    <%
        List<OrderDetailEntity> listProDetailOrdered = (List<OrderDetailEntity>) session.getAttribute("listProDetailOrdered");
        List<ProductDetailEntity> list = (List<ProductDetailEntity>) session.getAttribute("list");
        if (session.getAttribute("soluong") != null) {
            int soluong = (int) session.getAttribute("soluong");
        }
        if (session.getAttribute("tongtien") != null) {
            double tongtien = (double) session.getAttribute("tongtien");
        }
    %>
    <body>

        <jsp:include page="../include/menu.jsp"/>

        <jsp:include page="../include/header.jsp"/>

        <!-- Breadcrumb Section Begin -->
        <section style="padding-top: 94px;padding-bottom: 0;"class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__text">
                            <h4>Shopping Cart</h4>
                            <div class="breadcrumb__links">
                                <a href="./index.html">Home</a>
                                <a href="./shop.html">Shop</a>
                                <span>Shopping Cart</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb Section End -->

        <!--Shopping Cart Section Begin--> 
        <section class="shopping-cart spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="shopping__cart__table">
                            <table style="width:100%;">
                                <thead>
                                    <tr>
                                        <th style="width:15%;"class="th">Image</th>
                                        <th class="th">Product Name</th>
                                        <th class="th">Size</th>
                                        <th class="th">Color</th>
                                        <th class="th">Quantity</th>
                                        <th class="th">Price</th>
                                        <th class="th" hidden>Index</th>
                                        <th class="th">Action</th>
                                    </tr>
                                </thead

                                <c:if test="${fn:length(listProDetailOrdered)>0}">
                                    <c:forEach items="${listProDetailOrdered}" var="productDO" varStatus="index">
                                        <tbody>

                                            <tr>
                                                <td class="product__cart__item">
                                                    <div class="product__cart__item__pic">
                                                        <c:forEach items="${productDO.product.images}" end="0" var="i">
                                                            <a href="<c:url value="/user/details/${productDO.product.id}"/>">
                                                            <img src="<c:url value="/resources/img/product/${i.name}"/>" alt="">
                                                            </a>

                                                        </c:forEach>
                                                    </div>

                                                </td>
                                                <td>

                                                    <div class="product__cart__item__text">
                                                        <h6>${productDO.product.name}</h6>
                                                        <h5>${productDO.product.price}</h5>
                                                    </div> 
                                                </td>
                                                <td class="cart-class">
                                                    <c:forEach items="${sizes}" var="s">
                                                        <c:if test="${productDO.size==s.id.toString()}">
                                                            <span class="sizeId">${s.size}</span>
                                                        </c:if>
                                                    </c:forEach>
                                                </td>
                                                <td class="cart-class">
                                                    <c:forEach items="${colors}" var="c">
                                                        <c:if test="${productDO.color==c.id.toString()}">
                                                            <span class="colorId">${c.color}</span>
                                                        </c:if>
                                                    </c:forEach>
                                                </td>

                                                <td class="quantity__item">
                                                    <div class="quantity">
                                                        <div style="width:100px;"class="">
                                                            <input min="1"  max="${productDO.product.availability}" onchange="carttotal(${index.index+1})"style="width:45%;"class="abc" type="number" value="${productDO.quantity}" >


                                                        </div>
                                                    </div>
                                                </td>


                                                <td class="item-price"> ${productDO.product.price*productDO.quantity}$</td>
                                                <td class="productId" hidden>${productDO.product.id} </td>
                                                <td class="cart__close"><a href="<c:url value="/user/delete-item/${productDO.product.id}"/>""><i style="margin: 9px;"class="fa fa-close"></i></a></td>
                                            </tr>

                                        </tbody>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${fn:length(listProDetailOrdered)<=0}">
                                    <tr>
                                        <td colspan="8" style="color: red">Product Detail Order Not Found!!!</td>
                                    </tr>

                                </c:if>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-2">
                        <a href="<c:url value="/user/shopp"/>"class="primary-btn">Continue</a>

                    </div>
                    <div class="col-lg-2">
                        <a href="<c:url value="/user/check-out"/>" class="primary-btn">Checkout</a>
                    </div>
                    
                    <div class="col-lg-4">
                    <div class="cart__total">
                        <span class="primary-btn">Subtotal: ${tongtien} $</span>
                    </div>
                    </div>
                   
                </div>
            </div>
        </div>
    </section>
    <!--Shopping Cart Section End--> 

    <jsp:include page="../include/footer-page.jsp"/>
    <jsp:include page="../include/js-page.jsp"/>

</body>
</html>
