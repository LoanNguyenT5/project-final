<%-- 
Document   : details
Created on : Dec 2, 2022, 10:56:33 AM
Author     : Admin
--%>

<%@page import="com.mycompany.spring_mvc_project_final.entities.OrderEntity"%>
<%@page import="com.mycompany.spring_mvc_project_final.entities.AccountEntity"%>
<%@page import="com.mycompany.spring_mvc_project_final.entities.OrderDetailEntity"%>
<%@page import="com.mycompany.spring_mvc_project_final.entities.ProductDetailEntity"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Male_Fashion Template">
        <meta name="keywords" content="Male_Fashion, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>User Male-Fashion</title>
        <script
            src="https://code.jquery.com/jquery-3.6.1.js"
            integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="<c:url value="/webjars/bootstrap/4.6.2/css/bootstrap.min.css"/>"/>
        <script src="<c:url value="/resources/js/cartjs.js" />"></script>
        <jsp:include page="../include/css-page.jsp"/>
    </head>
    <%
        if (session.getAttribute("listProDetailOrdered") != null) {
            List<OrderDetailEntity> listProDetailOrdered = (List<OrderDetailEntity>) session.getAttribute("listProDetailOrdered");
        }
        if (session.getAttribute("tongtien") != null) {
            double tongtien = (double) session.getAttribute("tongtien");
        }
        if (session.getAttribute("tongtienaftervoucher") != null) {
            double tongtienaftervoucher = (double) session.getAttribute("tongtienaftervoucher");
        }
        if (session.getAttribute("account") != null) {
            AccountEntity account = (AccountEntity) session.getAttribute("account");
        }
        if (session.getAttribute("status") != null) {
            String status = (String) session.getAttribute("status");
        }
    %>
    <body>

        <jsp:include page="../include/menu.jsp"/>

        <jsp:include page="../include/header.jsp"/>

        <!-- Breadcrumb Section Begin -->
        <section style="padding-top: 94px;padding-bottom: 0;" class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__text">
                            <h4>Check Out</h4>
                            <div class="breadcrumb__links">
                                <a href="/user/home">Home</a>
                                <a href="/user/shopp">Shop</a>
                                <span>Check Out</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb Section End -->

        <!-- Checkout Section Begin -->
        <section class="checkout spad">
            <div class="container">
                <mvc:form action="${pageContext.request.contextPath}/user/finish" 
                          method="POST" modelAttribute="order" onsubmit="return phonenumber()" >

                    <c:if test="${mess!=null}">
                        <h3>${mess}</h3>

                    </c:if>  

                    <div class="checkout__form">

                        <div class="row">
                            <div class="col-lg-8 col-md-6">
                                <h6 class="coupon__code"><span class="icon_tag_alt"></span> Have a coupon? <input style="height: 46px;width: 188px;" type="text" id="voucher" onchange="getVoucherCode()" placeholder="Click here to enter your code"></h6>
                                <h6 class="checkout__title">Billing Details</h6>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="checkout__input">
                                            <p>Fist Name<span>*</span></p>
                                            <input name="customerFirstName" value="${order.customerFirstName}"type="text" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="checkout__input">
                                            <p>Last Name<span>*</span></p>
                                            <input name="customerLastName"value="${order.customerLastName}"type="text" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="checkout__input">
                                            <p>Country<span>*</span></p>
                                            <input name="country" value="${order.country}"type="text" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="checkout__input">
                                            <p hidden>Account ID<span>*</span></p>
                                            <input id="accId" name="account.id" value="${account.id}" readonly hidden>
                                        </div>
                                    </div>
                                </div>

                                <div class="checkout__input">
                                    <p>Address<span>*</span></p>
                                    <input name="address" value="${order.address}"type="text" placeholder="Street Address" class="checkout__input__add" required>
                                    <input name="addressExtra"value="${order.addressExtra}"type="text" placeholder="Apartment, suite, unite ect (optinal)">
                                </div>
                                <div class="checkout__input">
                                    <p>Town/City<span>*</span></p>
                                    <input name="town"value="${order.town}"type="text" required>
                                </div>
                                <div class="checkout__input">
                                    <p>State<span>*</span></p>
                                    <input name="state"value="${order.state}"type="text" required>
                                </div>

                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="checkout__input">
                                            <p>Phone<span>*</span></p>
                                            <input id="phone-number"name="phoneNumber" onchange="phonenumber()"value="${order.phoneNumber}"type="text" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="checkout__input">
                                            <p>Email<span>*</span></p>
                                            <input name="email"value="${order.email}"type="email" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div style="margin-bottom: 20px;"class="col-lg-6">
                                        <div style=""class="checkout__input">

                                            <p>Shipping Type<span>*</span></p>
                                            <select  onchange="run()"id="shippingType" name="shippingType"value="${order.shippingType}" selected class="" required> 
                                                <option value="">Click here</option>

                                                <option value="normal">Normal(0.85$)</option>
                                                <option value="fast">Fast(1.75$)</option>

                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="checkout__input">
                                            <p>Credit Card Number<span>*</span></p>
                                            <input id="accNumber"onchange="checkAccNumber()" name="creditCardNumber" value="${order.creditCardNumber}"type="text" required>

                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="checkout__input">
                                            <p>Expiry Date<span>*</span></p>
                                            <input onchange="checkAccInfo()" id="expiryDate"name="expiryDate"value=""type="date" required>
                                        </div>
                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="checkout__input">
                                            <p>CVC Code<span>*</span></p>
                                            <input onchange="checkAccInfo()" id="CVCCode"name="CVCCode"value="" type="text" required>
                                        </div>
                                    </div>


                                    <div class="col-lg-6">
                                        <div class="checkout__input">
                                            <p>Account Full Name<span>*</span></p>
                                            <input onchange="checkAccInfo()"id="accFullName"name="accFullName"value=""type="text" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="checkout__input__checkbox">
                                    <label for="acc">
                                        Create an account?
                                        <input type="checkbox" id="acc">
                                        <span class="checkmark"></span>
                                    </label>
                                    <p>Create an account by entering the information below. If you are a returning customer
                                        please login at the top of the page</p>
                                </div>
                                <!--                                <div class="checkout__input">
                                                                    <p>Coupon Voucher<span>*</span></p>
                                                                    <input name="voucher" type="text">
                                                                </div>-->
                                <div class="checkout__input__checkbox">
                                    <label for="diff-acc">
                                        Note about your order, e.g, special noe for delivery
                                        <input type="checkbox" id="diff-acc">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <div class="checkout__input">
                                    <p>Order notes</p>
                                    <input name="note"value="${order.note}" type="text"
                                           placeholder="Notes about your order, e.g. special notes for delivery.">
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6">
                                <div class="checkout__order">
                                    <h4 class="order__title">Your order</h4>
                                    <div class="checkout__order__products">Product <span style="margin-right: 18px;">Total</span><span style="margin-right: 45px;">Quantity</span></div>
                                    <ul class="checkout__total__products">

                                        <c:if test="${fn:length(listProDetailOrdered)>0}">
                                            <c:forEach items="${listProDetailOrdered}" var="productD" varStatus="index">
                                                <li><span style="width: 167px;">${index.index+1}.  ${productD.product.name}</span> 
                                                    <span style="width: 80px;">${productD.quantity}</span>
                                                    <span>${productD.quantity*productD.product.price}</span> </li>
                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${fn:length(listProDetailOrdered)<=0}">
                                            <tr>
                                             <li style="color: red">Product Detail Order Not Found!!!</li>
                                            </tr>

                                        </c:if>
                                    </ul>
                                    </ul>
                                    <ul class="checkout__total__all">
                                        <li >Shipping Cost <span id="shipping" ></span></li>

                                    </ul>
                                    <ul class="checkout__total__all">
                                        <li >Subtotal <span id="tongtien" >${tongtien}</span></li>
                                            <c:if test="${tongtienaftervoucher==null}" >
                                            <li>Total <span name="total" id="aftertotal" >${tongtien}</span></li>
                                            </c:if>
                                            <c:if test="${tongtienaftervoucher!=null}">
                                            <li>Total <span name="total" id="aftertotal" value="${tongtienaftervoucher}" >${tongtienaftervoucher}</span></li>
                                            </c:if>

                                    </ul>    
                                    </ul>
                                    <ul class="checkout__total__all">
                                        <li >Last Price <span id="lastPrice" ></span></li>

                                    </ul>   
                                    <div class="checkout__input__checkbox">
                                        <label for="acc-or">
                                            Create an account?
                                            <input type="checkbox" id="acc-or">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                    <p>Lorem ipsum dolor sit amet, consectetur adip elit, sed do eiusmod tempor incididunt
                                        ut labore et dolore magna aliqua.</p>
                                    <div class="checkout__input__checkbox">
                                        <label for="payment">
                                            Check Payment
                                            <input type="checkbox" id="payment">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                    <div class="checkout__input__checkbox">
                                        <label for="paypal">
                                            Paypal
                                            <input type="checkbox" id="paypal">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                    <button type="submit" class="site-btn">PLACE ORDER</button>
                                </div>
                            </div>
                        </div>

                    </div>
                </mvc:form>
            </div>
        </section>
        <!-- Checkout Section End -->
        <jsp:include page="../include/footer-page.jsp"/>
        <jsp:include page="../include/js-page.jsp"/>

    </body>
</html>
