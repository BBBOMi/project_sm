package com.skhu.sm.config;

import com.skhu.sm.services.CustomizeFailLoginService;
import com.skhu.sm.services.CustomizeLogoutService;
import com.skhu.sm.services.CustomizeSuccessLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import com.skhu.sm.services.AuthProvider;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

/**
 * Created by ds on 2017-10-28.
 */

@Configuration
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    AuthProvider authProvider;

    @Autowired
    CustomizeLogoutService customizeLogoutService;

    @Autowired
    CustomizeFailLoginService customizeFailLoginService;

    @Autowired
    CustomizeSuccessLoginService customizeSuccessLoginService;

    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/res/**");
    }

    @Override
    public void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                /*.antMatchers("/user/**").access("ROLE_USER")
                .antMatchers("/admin/**").access("ROLE_ADMIN")*/
                .antMatchers("/", "/login", "/login-error", "/find", "/clear").permitAll()
                .antMatchers("/**").authenticated();

        http.csrf().disable();

        http.formLogin()
                .loginPage("/")
                .loginPage("/login")
                .loginProcessingUrl("/login-processing")
                //.failureUrl("/login-error")
                .failureHandler(customizeFailLoginService)
                .successHandler(customizeSuccessLoginService)
                //.defaultSuccessUrl("/home", true)
                .usernameParameter("id")
                .passwordParameter("password");

        http.logout()
                .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
                .logoutSuccessHandler(customizeLogoutService)
                .invalidateHttpSession(true);

        http.authenticationProvider(authProvider);
    }

}
