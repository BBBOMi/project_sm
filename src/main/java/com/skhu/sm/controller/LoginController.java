package com.skhu.sm.controller;

import com.skhu.sm.mapper.UserMapper;
import com.skhu.sm.services.FindService;
import com.skhu.sm.services.RedisService;
import com.sun.org.apache.regexp.internal.RE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.skhu.sm.dto.*;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/")
public class LoginController {

    @Autowired
    UserMapper userMapper;

    @Autowired
    FindService findService;

    @Autowired
    RedisService redisService;

    //메인(로그인) 페이지
    @GetMapping(value = {"", "/login"})
    public String login(Model model) {
        model.addAttribute("loginError", false);
        model.addAttribute("findError", false);
        return "login";
    }

    //로그인 실패
    @GetMapping(value = "login-error")
    public String loginError(Model model) {
        model.addAttribute("loginError", true);
        model.addAttribute("findError", false);
        return "login";
    }

    //비밀번호 초기화
    @PostMapping(value = "find")
    public String find(Model model, String id, String name, String email) {
        if(findService.findPassword(id, name, email)) {
            model.addAttribute("findError", false);
            model.addAttribute("loginError", false);
        }else {
            model.addAttribute("findError", true);
            model.addAttribute("loginError", false);
        }
        return "login";
    }

    @GetMapping("clear")
    public String clear() {
        redisService.clear();
        return "login";
    }
}
