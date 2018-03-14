package com.skhu.sm.services;

import com.skhu.sm.domain.Login;
import com.skhu.sm.dto.MyAuthenticaion;
import com.skhu.sm.dto.User;
import com.skhu.sm.repository.LoginRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by ds on 2017-10-31.
 */

@Component
public class AuthProvider implements AuthenticationProvider {

    @Autowired
    AuthorizationService authorizationService;

    @Autowired
    LoginRepository loginRepository;

    //로그인 버튼을 누를 경우
    //실행 1
    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String id = authentication.getName();
        String password = authentication.getCredentials().toString();
        return authenticate(id, password);
    }
    //실행 2
    public Authentication authenticate(String id, String password) throws AuthenticationException {
        User user = authorizationService.login(id, password);
        if (user == null) return null;
        List<GrantedAuthority> grantedAuthorityList = new ArrayList<GrantedAuthority>();
        String role = "";
        /**
         * 0 : 일반 사용자
         * 1 : 학생
         * 2 : 교수
         * 3 : 직원
         * 4 : 관리자
         * */
        switch (user.getU_type()) {
            case 0:
                role = "ROLE_NO";
                break;
            case 1:
                role = "ROLE_USER";
                break;
            case 2:
            case 3:
            case 4:
                role = "ROLE_ADMIN";
                break;
        }
        redisSave(user, role);
        grantedAuthorityList.add(new SimpleGrantedAuthority(role));
        return new MyAuthenticaion(id, password, grantedAuthorityList, user);
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }

    private void redisSave(final User user, final String role) {
        Login login = new Login(user);
        login.setType(role);
        loginRepository.save(login);
    }
}
