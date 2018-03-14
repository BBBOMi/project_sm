package com.skhu.sm.services;

import com.skhu.sm.dto.User;
import com.skhu.sm.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigureOrder;
import org.springframework.stereotype.Service;

/**
 * Created by ds on 2017-11-28.
 */
@Service
public class FindService {

    @Autowired
    UserMapper userMapper;

    public boolean findPassword(String id, String name, String email) {
        User user = userMapper.findByUid(id);
        if(user.getU_name().equals(name) && user.getU_email().equals(email)) {
            user.setU_password("s"+id);
            userMapper.updatePassword(user);
            return true;
        }
        return false;
    }
}
