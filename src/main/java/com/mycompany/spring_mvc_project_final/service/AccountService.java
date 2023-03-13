/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.AccountEntity;
import com.mycompany.spring_mvc_project_final.enums.UserStatus;
import com.mycompany.spring_mvc_project_final.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */
@Service
public class AccountService {
    @Autowired
    private AccountRepository accountRepository;

    public AccountEntity getAccountByEmail(String email) {
        return accountRepository.findByEmailLikeAndStatusLike(email, UserStatus.ACTIVE);
    }
}
