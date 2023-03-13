<%-- 
    Document   : details
    Created on : Dec 2, 2022, 10:56:33 AM
    Author     : Admin
--%>

<%@page import="com.mycompany.spring_mvc_project_final.entities.ColorEntity"%>
<%@page import="com.mycompany.spring_mvc_project_final.entities.SizeEntity"%>
<%@page import="com.mycompany.spring_mvc_project_final.entities.OrderEntity"%>
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


        <jsp:include page="../include/css-page.jsp"/>
    </head>
    <%
        if (session.getAttribute("listLastNew") != null) {
            List<OrderEntity> listLastNew = (List<OrderEntity>) session.getAttribute("listLastNew");
        }
        if (session.getAttribute("sizes") != null) {
            List<SizeEntity> sizesEntity = (List<SizeEntity>) session.getAttribute("sizes");
        }
        if (session.getAttribute("colors") != null) {
            List<ColorEntity> colors = (List<ColorEntity>) session.getAttribute("colors");
        }
    %>
    <body>
        <style>
            .itemp{
                height:104px;

            }
            .tr{
                justify-items: center;
                justify-content: center;
            }


        </style>

        <jsp:include page="../include/menu.jsp"/>

        <jsp:include page="../include/header.jsp"/>

        <!-- Breadcrumb Section Begin -->
        <section style="padding-top: 94px;padding-bottom: 0;" class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__text">
                            <h4>Order History</h4>
                            <div class="breadcrumb__links">
                                <a href="./index.html">Home</a>
                                <a href="./shop.html">Shop</a>
                                <span>Order History</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb Section End -->
        <div style="margin-top: 30px;margin-bottom: 30px;"class="container">
            <div class="row">
                <div class="table-responsive">
                    <!--<h3 style="">Order History</h3>-->
                    <table class="table table-hover table-bordered">
                        <thead>
                            <tr class="tr">
                                <th style=""class="thth"><span style="margin-left: 59px;">Name</span></th>
                                <th class="thth"><span style="margin-left: 39px;
                                                       margin-right: 0px;
                                                       padding-right: 0px;"class="span">Created Date</span></th>
                                <th class="thth"><span style="margin-left: 42px;"class="span"></span>Image</th>
                                <th class="thth"><span style="margin-left: 14px;"class="span">Size</span></th>
                                <th class="thth"><span style="margin-left: 9px;"class="span">Color</span></th>
                                <th class="thth"><span style="margin-left: 16px;"class="span">Quantity</span></th>
                                <th class="thth"><span style="margin-left: 30px;"class="span">Price of one Product</span></th>
                                <th class="thth"><span style="margin-left: 7px;"class="span">Total</span></th>
                                <th class="thth"><span style="margin-left: 9px;"class="span">Action</span></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${fn:length(listLastNew)>0}">
                                <c:forEach items="${listLastNew}" var="orderItem">
                                    <tr>
                                        <td class="tdata">

                                            <c:forEach items="${orderItem.orderDetailEntities}" var="detail">
                                                <div class="itemp">  <a style="color:black;" href="<c:url value="/user/details/${detail.product.id}"/>"> ${detail.product.name}</a></div>
                                            </c:forEach>

                                        </td>
                                        <td class="tdata">
                                            <div class="itemp">
                                                ${orderItem.getOrderDate()}
                                            </div>
                                        </td>
                                        <td class="tdata">
                                            <c:forEach items="${orderItem.orderDetailEntities}" var="detail">
                                                <c:forEach items="${detail.product.images}" end="0" var="i">
                                                    <div class="itemp">
                                                        <img style="width:100px;height:100px;"src="<c:url value="/resources/img/product/${i.name}"/>" alt="">
                                                    </div>

                                                </c:forEach>

                                            </c:forEach>

                                        </td>
                                        <td class="tdata">

                                            <c:forEach items="${orderItem.orderDetailEntities}" var="detail">
                                                <div class="itemp">

                                                    <c:forEach items="${sizes}" var="s">
                                                        <c:if test="${detail.size==s.id.toString()}">

                                                            ${s.size.name()}
                                                        </c:if>

                                                    </c:forEach>
                                                </div>
                                            </c:forEach>
                                        </td>
                                        <td class="tdata">
                                            <c:forEach items="${orderItem.orderDetailEntities}" var="detail">
                                                <div class="itemp">

                                                    <c:forEach items="${colors}" var="c">
                                                        <c:if test="${detail.color==c.id.toString()}">

                                                            ${c.color.name()}
                                                        </c:if>

                                                    </c:forEach>                                                </div>
                                                </c:forEach>
                                        </td>
                                        <td class="tdata">
                                            <c:forEach items="${orderItem.orderDetailEntities}" var="detail">
                                                <div class="itemp"> 
                                                    ${detail.quantity}
                                                </div> 
                                            </c:forEach>
                                        </td>
                                        <td class="tdata">
                                            <div style="flex-direction: column;
                                                 width: 100%;
                                                 height: auto;"class="itemp">
                                                <c:forEach items="${orderItem.orderDetailEntities}" var="detail">
                                                    <div class="itemp"> 
                                                        ${detail.price}
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </td> 
                                        <td class="tdata">
                                            <div class="itemp">
                                                ${orderItem.total}
                                            </div>
                                        </td>

                                        <td class="tdata">
                                            <div class="itemp">
                                                <div class="cart__close"><a href="<c:url value="/user/delete-order/${orderItem.id}"/>"><i  style="font-size: 30px;color:black;"class="fa fa-close"></i></a></div>
                                               <!--<a class="cart_close" href="<c:url value="/user/delete-order/${orderItem.id}"/>""><i style=""class="fa fa-close"></i></a>-->
                                            </div>
                                        </td>
                                <style>
                                    .itemp{
                                        display:flex;
                                        justify-content: center;
                                        align-items: center;
                                        .thth{
                                            display: flex;
                                            justify-content: center;
                                        }
                                        .span{
                                            margin-left: 10px;
                                        }
                                    </style>
                                    </tr>
                                </c:forEach>

                            </c:if>
                            <c:if test="${fn:length(listLastNew)<=0}">
                                <tr style="height:200px;">
                                    <td colspan="10" style="color: red">Order History Not Found!!!</td>
                                    </tr>

                                </c:if>
                                </tbody>

                            </table>
                        </div>
                    </div>
                </div>





                <jsp:include page="../include/footer-page.jsp"/>
                <jsp:include page="../include/js-page.jsp"/>

            </body>
        </html>
