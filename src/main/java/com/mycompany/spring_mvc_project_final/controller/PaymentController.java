package com.mycompany.spring_mvc_project_final.controller;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mycompany.spring_mvc_project_final.entities.PaymentHistoryEntity;
import com.mycompany.spring_mvc_project_final.repository.PaymentHistoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PaymentController {
    @Autowired
    PaymentHistoryRepository paymentHistoryRepository;
    @RequestMapping("/payment")
    public String viewPayment(Model model) {
        return "payment/index";
    }
    @RequestMapping("/payment-success")
    public String viewPaymentThanks(Model model) {
        return "payment/thank-you";
    }
    @PostMapping("/payment-success")
    public ResponseEntity<PaymentHistoryEntity> paymentSuccess(@RequestBody JsonNode fullResponse) {
        try {
            // Thực hiện xử lý với dữ liệu fullResponse ở đây
            PaymentHistoryEntity paymentEntity = decodeJsonToPaymentEntity(fullResponse);
            if (paymentEntity != null) {
                // Thêm paymentEntity vào model để sử dụng trong view
                paymentHistoryRepository.save(paymentEntity);
                // gui mail cho KH
                //...
                // Trả về phản hồi nếu cần
                return ResponseEntity.ok(paymentEntity);
            } else {
                // Xử lý nếu có lỗi trong quá trình xử lý response JSON
                return new ResponseEntity<>(new PaymentHistoryEntity(), HttpStatus.INTERNAL_SERVER_ERROR);
            }

        } catch (Exception e) {
            // Xử lý nếu có lỗi
            e.printStackTrace();
            return new ResponseEntity<>(new PaymentHistoryEntity(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }



    private PaymentHistoryEntity decodeJsonToPaymentEntity(JsonNode jsonNode) {
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            //  JsonNode jsonNode = objectMapper.readTree(json);

            PaymentHistoryEntity paymentEntity = new PaymentHistoryEntity();
            paymentEntity.setOrderID(jsonNode.get("orderID").asText());
            paymentEntity.setPayerID(jsonNode.get("payerID").asText());
            paymentEntity.setPayerName(jsonNode.get("details").get("payer").get("name").get("given_name").asText());
            paymentEntity.setPayerAddress(jsonNode.get("details").get("payer").get("address").get("country_code").asText());
            paymentEntity.setPayerEmail(jsonNode.get("details").get("payer").get("email_address").asText());
            paymentEntity.setPaymentAmount(jsonNode.get("details").get("purchase_units").get(0).get("amount").get("value").asText());
            //paymentEntity.setPaymentCurrency(jsonNode.get("details").get("purchase_units").get(0).get("amount").get("currency_code").asText());
            paymentEntity.setPaymentStatus(jsonNode.get("details").get("status").asText());

            return paymentEntity;
        } catch (Exception e) {
            e.printStackTrace();
            // Xử lý exception nếu có
            return null;
        }
    }
}
