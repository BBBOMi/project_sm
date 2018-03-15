package com.skhu.sm.services;

import com.skhu.sm.domain.Login;
import com.skhu.sm.dto.MyAuthenticaion;
import com.skhu.sm.dto.User;
import com.skhu.sm.repository.LoginRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
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

    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    @Override
    public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {
        final String id = httpServletRequest.getParameter("id");
        redirectStrategy.sendRedirect(httpServletRequest, httpServletResponse, "/home");
    }
}
