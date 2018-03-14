package com.skhu.sm.services;

import com.skhu.sm.domain.Login;
import com.skhu.sm.repository.LoginRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by ds on 2018-03-14.
 */
@Component
public class CustomizeSuccessLoginService implements AuthenticationSuccessHandler {

    @Autowired
    LoginRepository loginRepository;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {
        System.out.println(authentication.getPrincipal().toString());
        Login login = new Login();
        httpServletRequest.getRequestDispatcher("/home").forward(httpServletRequest, httpServletResponse);
    }

    /*private void redisSave(final User user, final String role) {
        Login login = new Login(user);
        login.setType(role);
        loginRepository.save(login);
    }*/
}
