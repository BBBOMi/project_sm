package com.skhu.sm.services;

import com.skhu.sm.domain.Login;
import com.skhu.sm.dto.User;
import com.skhu.sm.mapper.UserMapper;
import com.skhu.sm.repository.LoginRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by ds on 2018-03-14.
 */

@Component
public class CustomizeFailLoginService implements AuthenticationFailureHandler {

    @Autowired
    UserMapper userMapper;

    @Autowired
    LoginRepository loginRepository;

    private final String NOUSER = "등록된 사용자가 아닙니다.";
    private final String NOTIDPW = "아이디/비밀번호가 잘못되었습니다.";
    private final String NOWLOGIN = "현재 접속중입니다.";
    private final String defaultFailureUrl = "login-error";

    @Override
    public void onAuthenticationFailure(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, AuthenticationException e) throws IOException, ServletException {

        final String id = httpServletRequest.getParameter("id");
        final String pw = httpServletRequest.getParameter("password");

        User user = userMapper.findByUid(id);
        if(user == null) {
            httpServletRequest.setAttribute(NOUSER, e.getMessage());
            httpServletRequest.getRequestDispatcher(defaultFailureUrl).forward(httpServletRequest, httpServletResponse);
        }
        if(!user.getU_password().equals(pw)) {
            httpServletRequest.setAttribute(NOTIDPW, e.getMessage());
            httpServletRequest.getRequestDispatcher(defaultFailureUrl).forward(httpServletRequest, httpServletResponse);
        }
        Login login = loginRepository.findOne(user.getID());
        if(login != null) {
            httpServletRequest.setAttribute(NOWLOGIN, e.getMessage());
            httpServletRequest.getRequestDispatcher(defaultFailureUrl).forward(httpServletRequest, httpServletResponse);
        }
    }
}
