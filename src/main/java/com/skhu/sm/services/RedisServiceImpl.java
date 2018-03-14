package com.skhu.sm.services;

import com.skhu.sm.domain.Login;
import com.skhu.sm.repository.LoginRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * Created by ds on 2018-03-13.
 */
@Service
public class RedisServiceImpl implements RedisService {

    @Autowired
    LoginRepository loginRepository;

    @Override
    public void clear() {
        Iterable<Login> loginList = loginRepository.findAll();
        for(Login login : loginList) {
            loginRepository.delete(login);
        }
    }
}
