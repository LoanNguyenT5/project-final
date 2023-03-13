/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
//function checkpass(){
//    var checkoutItem=document.querySelector("input #password");
//    console.log(checkoutItem);
//    
//};
function carttotal(index) {
    var cartItem = document.querySelectorAll("tbody tr");
    console.log(cartItem);
    var totalC = 0;
    for (var i = 0; i < cartItem.length; i++) {
        var quantity = cartItem[i].querySelector("input.abc").value;
//        console.log(quantity);
        var productId = cartItem[i].querySelector(".productId").innerHTML;
//        console.log(productId);
        var productPrice = cartItem[i].querySelector("h5").innerHTML;
        totalA = quantity * productPrice;
//        console.log(totalA);

        totalC = totalC + totalA;
        totalD = totalC.toLocaleString('de-DE');
        var itemPrice = cartItem[i].querySelector(".item-price");
//        console.log(itemPrice);
        totalB = totalA.toLocaleString('de-DE');
//        console.log(totalB);
        itemPrice.innerHTML = totalB + "$";
    }
    var cartTotalA = document.querySelector(".cart__total span");
    cartTotalA.innerHTML = "Subtotal: " + totalD + "$";
    var qty = cartItem[index - 1].querySelector("input.abc").value;
//    console.log(qty);
    element = cartItem[index - 1].querySelector("input.abc");
    maxValue = element.getAttribute("max");
    minValue = element.getAttribute("min");
//    console.log(minValue);
//    console.log(maxValue);
    if (qty > maxValue) {
        alert("Sản phẩm hiện chỉ còn tối đa là " + maxValue
                + "  Vui lòng chọn lại số lượng ");
        qty = maxValue;
        element.value = qty;
        carttotal(index);
    }
    if (qty < minValue) {
        alert("Sản phẩm phải lớn hơn 0");
        qty = minValue;
        element.value = qty;
        carttotal(index);
    }
    var productIndex = cartItem[index - 1].querySelector(".productId").innerHTML;
    var test = cartItem[index - 1].querySelector(".sizeId");
    var sizeId = cartItem[index - 1].querySelector(".sizeId").innerHTML;
    var colorId = cartItem[index - 1].querySelector(".colorId").innerHTML;
    console.log(test);
    console.log(sizeId);
    console.log(colorId);
//    console.log(productIndex);


    $.ajax({
        type: "GET",
        contentType: "application/json",
        url: "/Spring_MVC_Project_Final/user/ajax",
        data: {
            qty: qty,
            productId: productIndex,
            sizeId: sizeId,
            colorId: colorId
        },
        dataType: 'json',
        timeout: 100000,
        success: function (data) {
            console.log("SUCCESS: ", data);
//            var result = "<h3> You just add new Quantity </h3>"
//                    + "<p>ProductID:</p> " + data.productId 
//                    + "<p>Quantity:</p> " + data.qty;
//            $("#ajax-response").html(result);
        },
        error: function (e) {
            console.log("ERROR: ", e);
        }
    });
}
;
function phonenumber() {

    var mobile = document.getElementById("phone-number").value;
    var vnf_regex = /((09|03|07|08|05)+([0-9]{8})\b)+$/g;
    if (mobile !== '') {
        if (vnf_regex.test(mobile) === false)
        {
            alert('Phone number is invalid!');
            var mobiletag = document.getElementById("phone-number");
            mobiletag.value = "";
            return false;
        } else {
            return true;
        }
    }

}
;
function checkAccInfo() {
    var accFullName = document.getElementById("accFullName").value;
//    console.log(accFullName);
    var CVCCode = document.getElementById("CVCCode").value;
//    console.log(CVCCode);
    var expiryDate = document.getElementById("expiryDate").value;
//    console.log(expiryDate);
    if (accFullName !== "" && CVCCode !== "" && expiryDate !== "") {
        $.ajax({
            type: "GET",
            contentType: "application/json",
            url: "/Spring_MVC_Project_Final/user/check-accbanking-info",
            data: {
                accFullName: accFullName,
                mess: "empty",
                CVCCode: CVCCode,
                expiryDate: expiryDate
            },
            dataType: 'json',
            timeout: 100000,
            success: function (data) {
                console.log("SUCCESS: ", data);
                if (data.mess === "error") {
                    alert("Invalid Account Info");
                    var accFullName1 = document.getElementById("accFullName");
                    var CVCCode = document.getElementById("CVCCode");
                    var expiryDate = document.getElementById("expiryDate");
                    accFullName1.value = "";
                    CVCCode.value = "";
                    expiryDate.value = "";

                }
            },
            error: function (e) {
                console.log("ERROR: ", e);
            }
        });

    }
}
function getVoucherCode() {
    var voucher = document.getElementById("voucher").value;
    console.log(voucher);
    var accountId = document.getElementById("accId").value;
    var tonggtien = document.getElementById("tongtien").innerHTML;
    $.ajax({
        type: "GET",
        contentType: "application/json",
        url: "/Spring_MVC_Project_Final/user/voucher",
        data: {
            voucher: voucher,
            mess: "a",
            totalAfterVoucher: tonggtien,
            promotionId: 0,
            accountId: accountId

        },
        dataType: 'json',
        timeout: 100000,
        success: function (data) {
            console.log("SUCCESS: ", data);
            alert(data.mess);
            if (data.promotionId === 0) {
                var subTOTAL = document.getElementById("tongtien");
            } else {
                var subTOTAL = document.getElementById("aftertotal");
            }
            subTOTAL.innerHTML = data.totalAfterVoucher;
            var returnShippingCost = document.getElementById("shipping").innerHTML;
//            console.log(returnShippingCost);
            var totaltemp = parseFloat(data.totalAfterVoucher);
//            console.log(totaltemp);
            if (returnShippingCost !== "") {
                lastPrice = parseFloat(data.totalAfterVoucher) + parseFloat(returnShippingCost);
                console.log(lastPrice);
                var getSpan = document.getElementById("lastPrice");
                var getSpan1 = lastPrice.toLocaleString('de-DE');
                getSpan.innerHTML = getSpan1;
                
            } else {
                lastPrice = parseFloat(data.totalAfterVoucher);
                console.log(lastPrice);
                var getSpan = document.getElementById("lastPrice");
                var getSpan1 = lastPrice.toLocaleString('de-DE');
                getSpan.innerHTML = getSpan1;
                subTOTAL.innerHTML = data.totalAfterVoucher;

            }


        },
        error: function (e) {
            console.log("ERROR: ", e);
        }
    });

}
;
function checkAccNumber() {

    var accNumber = document.getElementById("accNumber").value;
    var tongt = document.getElementById("aftertotal").innerHTML;
    console.log(tongt);
    $.ajax({
        type: "GET",
        contentType: "application/json",
        url: "/Spring_MVC_Project_Final/user/check-accbanking",
        data: {
            accNumber: accNumber,
            mess: "empty",
            tongt: tongt
        },
        dataType: 'json',
        timeout: 100000,
        success: function (data) {
            console.log("SUCCESS: ", data);
            alert(data.mess);
//            if(mess="")
            if (data.accNumber === "null") {
                var accNumber1 = document.getElementById("accNumber");
                accNumber1.value = "";
            }

        },
        error: function (e) {
            console.log("ERROR: ", e);
        }
    });
}
;
function run() {

    var shippingType = document.getElementById("shippingType").value;
    if (shippingType === "fast") {
        var returnShippingCost = document.getElementById("shipping");
        returnShippingCost.innerHTML = "1.75";

        var LastTotal = document.getElementById("aftertotal").innerHTML;
        console.log(LastTotal);
        var shipfee = 1.75;
        temp = parseFloat(LastTotal) + parseFloat(shipfee);
        console.log(temp);
        var getSpan = document.getElementById("lastPrice");
        tempp = temp.toLocaleString('de-DE');
        getSpan.innerHTML = tempp;


    } else if (shippingType === "normal") {
        var returnShippingCost = document.getElementById("shipping");
        returnShippingCost.innerHTML = "0.85";
        var LastTotal = document.getElementById("aftertotal").innerHTML;
        console.log(LastTotal);
        var shipfee = 0.85;
        temp = parseFloat(LastTotal) + parseFloat(shipfee);

        console.log(temp);
        tempp = temp.toLocaleString('de-DE');
        var getSpan = document.getElementById("lastPrice");
        getSpan.innerHTML = tempp;
    } else {

        alert("Please choose shipping type");
    }

}
;