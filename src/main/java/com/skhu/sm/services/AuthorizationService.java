package com.skhu.sm.services;

import com.skhu.sm.domain.Login;
import com.skhu.sm.repository.LoginRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.skhu.sm.dto.MyAuthenticaion;
import com.skhu.sm.dto.User;
import com.skhu.sm.mapper.UserMapper;

/**
 * Created by ds on 2017-10-27.
 */

@Service
public class AuthorizationService {

    @Autowired
    UserMapper userMapper;

    @Autowired
    LoginRepository loginRepository;

    public User login(String id, String password) {
        User user = userMapper.findByUid(id);
        if(user == null) return null;
        if(!user.getU_password().equals(password)) return null;
        Login login = loginRepository.findOne(user.getID());
        if(login == null) return user;
        else {
            //System.out.println("이미 로그인 중");
            return null;
        }
    }

    public static User getCurrentUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication instanceof MyAuthenticaion)
            return ((MyAuthenticaion) authentication).getUser();
        return null;
    }

    public static void setCurrentUser(User user) {
        ((MyAuthenticaion)
                SecurityContextHolder.getContext().getAuthentication()).setUser(user);
    }

}
