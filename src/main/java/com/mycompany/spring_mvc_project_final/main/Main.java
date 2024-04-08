/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.main;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import com.paypal.http.HttpResponse;
import com.paypal.http.serializer.Json;
import com.paypal.orders.Order;
import com.paypal.orders.OrdersGetRequest;
import com.paypal.payments.Capture;
import com.paypal.payments.CapturesRefundRequest;
import com.paypal.payments.Refund;
import com.paypal.payments.RefundRequest;


import java.io.IOException;

public class Main {

    public static void main(String[] args) {
        System.out.println("password===>" + encrytePassword("123456"));
    }

    public static String encrytePassword(String password) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        return encoder.encode(password);
    }

//    public static Refund refundOrder(String orderId, double amount) throws IOException {
//        RefundRequest request = new RefundRequest();
//        request.amount(new com.paypal.payments.Money().currencyCode("USD").value(String.valueOf(amount)));
//
//        HttpResponse<Refund> response = request.client().execute(request);
//        return response.result();
//    }
}
