package com.skhu.sm.services;

import com.skhu.sm.domain.Login;
import com.skhu.sm.dto.User;
import com.skhu.sm.mapper.UserMapper;
import com.skhu.sm.repository.LoginRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by ds on 2018-03-13.
 */

@Component
public class CustomizeLogoutService implements LogoutSuccessHandler {

    @Autowired
    LoginRepository loginRepository;

    @Autowired
    UserMapper userMapper;

    @Override
    public void onLogoutSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {
        User user = userMapper.findByUid(authentication.getPrincipal().toString());
        loginRepository.delete(loginRepository.findOne(user.getID()));
        httpServletRequest.getRequestDispatcher("/").forward(httpServletRequest, httpServletResponse);
    }
}
