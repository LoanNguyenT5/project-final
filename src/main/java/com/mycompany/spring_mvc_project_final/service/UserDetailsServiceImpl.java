/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.AccountEntity;
import com.mycompany.spring_mvc_project_final.entities.RoleEntity;
import com.mycompany.spring_mvc_project_final.enums.UserStatus;
import java.util.HashSet;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import com.mycompany.spring_mvc_project_final.repository.AccountRepository;
import com.mycompany.spring_mvc_project_final.repository.RoleRepository;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private AccountRepository userRepository;

    @Autowired
    private RoleRepository userRoleRepository;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        AccountEntity user = userRepository.findByEmailLikeAndStatusLike(email, UserStatus.ACTIVE);
        if (user == null) {
            throw new UsernameNotFoundException(email);
        }
        Set<RoleEntity> roleNames = userRoleRepository.findByUsers_Email(email);
        Set<GrantedAuthority> grantList = new HashSet<>();
        if (!CollectionUtils.isEmpty(roleNames)) {
            for (RoleEntity role : roleNames) {
                GrantedAuthority authority = new SimpleGrantedAuthority(role.getRole().toString());
                grantList.add(authority);
            }
        }

        return (UserDetails) new User(user.getEmail(), user.getPassword(), grantList);
    }
    
    
    
}
