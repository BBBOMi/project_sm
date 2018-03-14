package com.skhu.sm.dto;

import lombok.Data;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;

import java.util.List;

/**
 * Created by ds on 2017-10-31.
 */
@Data
public class MyAuthenticaion extends UsernamePasswordAuthenticationToken {
    private  static final long serialVersionUID = 1L;

    User user;

    public MyAuthenticaion (String id, String password, List<GrantedAuthority> grantedAuthorityList, User user) {
        super(id, password, grantedAuthorityList);
        this.user = user;
    }
}
