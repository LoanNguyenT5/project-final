package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.entities.AccountEntity;
import com.mycompany.spring_mvc_project_final.entities.RoleEntity;
import com.mycompany.spring_mvc_project_final.enums.Role;
import com.mycompany.spring_mvc_project_final.enums.UserStatus;
import com.mycompany.spring_mvc_project_final.repository.AccountRepository;
import com.mycompany.spring_mvc_project_final.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

@Controller
public class HomeController {
    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;
    @Autowired
    RoleRepository roleRepository;

    @Autowired
    AccountRepository accountRepository;
    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
    public String welcomePage(Model model) {
        if (createAccountDefault())
            model.addAttribute("msg","Please login with account: admin@gmail.com and pass is: 123456");
        return "home";
    }


    private void createRoleDefault(){
        List<RoleEntity> roleEntityList = roleRepository.findAll();
        if(roleEntityList.isEmpty()){
            // insert role into data database
            List<Role> roleList = new ArrayList<>();
            roleList.add(Role.ROLE_ADMIN);
            roleList.add(Role.ROLE_USER);
            roleList.add(Role.ROLE_SELLER);
            roleList.add(Role.ROLE_MANAGER);
            for (Role role: roleList){
                RoleEntity entity = new RoleEntity();
                entity.setRole(role);
                roleRepository.save(entity);
            }
        }
    }
    private boolean createAccountDefault(){
        List<AccountEntity> accountEntityList = (List<AccountEntity>) accountRepository.findAll();
        if(accountEntityList.isEmpty()){
            createRoleDefault();
            List<RoleEntity> roleEntityList = (List<RoleEntity>) roleRepository.findAll();
            Set<RoleEntity> roleEntitySet = new LinkedHashSet<>(roleEntityList);
            if(!roleEntityList.isEmpty()){
                AccountEntity accountEntity = new AccountEntity();
                accountEntity.setEmail("admin@gmail.com");
                accountEntity.setPassword(bCryptPasswordEncoder.encode("123456"));
                accountEntity.setUserRoles(roleEntitySet);
                accountEntity.setStatus(UserStatus.ACTIVE);
                accountRepository.save(accountEntity);
                return true;
            }
        }
        return false;
    }
}
