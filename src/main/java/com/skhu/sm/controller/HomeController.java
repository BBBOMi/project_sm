package com.skhu.sm.controller;

import javax.servlet.http.HttpServletRequest;

import com.skhu.sm.dto.About;
import com.skhu.sm.dto.Intro;
import com.skhu.sm.dto.Notice;
import com.skhu.sm.dto.User;
import com.skhu.sm.mapper.AboutMapper;
import com.skhu.sm.mapper.IntroMapper;
import com.skhu.sm.mapper.NoticeMapper;
import com.skhu.sm.mapper.UserMapper;
import com.skhu.sm.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
public class HomeController {

    @Autowired
    UserMapper userMapper;

    @Autowired
    AboutMapper aboutMapper;

    @Autowired
    IntroMapper introMapper;

    @Autowired
    FileUploadService fileUploadService;

    @Autowired
    MailService mailService;

    @Autowired
    IntroService introService;

    @Autowired
    AboutService aboutService;

    //로그인 후 메인 페이지
    @GetMapping(value = "home")
    public String home(Model model, HttpServletRequest request) {
        //로그인 세션이 있는지 검사
        if (request.isRequestedSessionIdValid()) {
            return "user/home/home";
        }
        return "redirect:login";
    }

    //SM 소개 페이지
    @GetMapping(value = "intro")
    public String intro(Model model, HttpServletRequest request) {
        if (request.isRequestedSessionIdValid()) {
            model.addAttribute("intro", introMapper.findAll());
            return "user/home/intro";
        }
        return "redirect:login";
    }

    //SM 소개 수정 페이지
    @Secured("ROLE_ADMIN")
    @GetMapping(value = "intro-change")
    public String introChange(Model model, HttpServletRequest request) {
        if (request.isRequestedSessionIdValid()) {
            model.addAttribute("intro", introMapper.findAll());
            return "user/home/intro-change";
        }
        return "redirect:login";
    }

    //SM 소개 수정
    @Secured("ROLE_ADMIN")
    @PostMapping(value = "intro-change")
    public String introChangeValue(Model model, HttpServletRequest request, Intro intro, String[] i_title, String[] i_contents) {
        if(request.isRequestedSessionIdValid()) {
            introService.introChange(intro.getIntroList(), i_title, i_contents);
            return "redirect:intro";
        }
        return "redirect:login";
    }

    //시스템 소개 페이지
    @GetMapping(value = "about")
    public String about(Model model, HttpServletRequest request) {
        if (request.isRequestedSessionIdValid()) {
            model.addAttribute("about", aboutMapper.findAll());
            return "user/home/about";
        }
        return "redirect:login";
    }

    //시스템 소개 수정 페이지
    @Secured("ROLE_ADMIN")
    @GetMapping(value = "about-change")
    public String aboutChange(Model model, HttpServletRequest request) {
        if (request.isRequestedSessionIdValid()) {
            model.addAttribute("about", aboutMapper.findAll());
            return "user/home/about-change";
        }
        return "redirect:login";
    }

    //시스템 소개 수정
    @Secured("ROLE_ADMIN")
    @PostMapping(value = "about-change")
    public String aboutChangeValue(Model model, HttpServletRequest request, About about, String[] a_title, String[] a_contents) {
        if(request.isRequestedSessionIdValid()) {
            aboutService.aboutChange(about.getAboutList(), a_title, a_contents);
            return "redirect:about";
        }
        return "redirect:login";
    }

    //이메일
    @GetMapping(value = "email")
    public String email(Model model, HttpServletRequest request) {
        if (request.isRequestedSessionIdValid()) {
            return "user/home/email";
        }
        return "redirect:login";
    }

    //메일 보내기
    @PostMapping(value = "email")
    public String emailSend(Model model, HttpServletRequest request, MultipartFile file) throws IOException {
        if (request.isRequestedSessionIdValid()) {
            if(request.getParameter("to") == null) {
                return "redirect:email";
            }else {
                File uploadfile = null;
                if(!file.getOriginalFilename().isEmpty()) {
                    uploadfile = fileUploadService.upload2(file);
                    mailService.sendMail1(AuthorizationService.getCurrentUser().getU_email(), request.getParameter("to"),
                            request.getParameter("title"), request.getParameter("contents"), uploadfile);
                    uploadfile.delete();
                }else {
                    mailService.sendMail2(AuthorizationService.getCurrentUser().getU_email(), request.getParameter("to"),
                            request.getParameter("title"), request.getParameter("contents"));
                }
            }
            return "redirect:email";
        }
        return "redirect:login";
    }

    //마이 페이지 조회
    @GetMapping(value = "mypage")
    public String myPage(Model model, HttpServletRequest request, @RequestParam(value = "id", defaultValue = "0", required = false) int id) {
        if (request.isRequestedSessionIdValid()) {
            if (id != 0) {
                User user = userMapper.findById(id);
                model.addAttribute("user", user);
            } else {
                model.addAttribute("user", userMapper.findById(AuthorizationService.getCurrentUser().getID()));
            }
            return "user/myPage/mypage";
        }
        return "redirect:login";
    }

    //마이 페이지 수정
    @PostMapping(value = "mypage")
    public String myPage(Model model, HttpServletRequest request, User user) throws IOException {
        if (request.isRequestedSessionIdValid()) {
            if (user.getU_password() == null) {
                user.setU_password(AuthorizationService.getCurrentUser().getU_password());
            }
            String url = fileUploadService.upload(user.getU_photo());
            user.setID(AuthorizationService.getCurrentUser().getID());
            if(url == null) {
                userMapper.update1(user);
            }else {
                user.setU_photoUrl(url);
                userMapper.update2(user);
            }
            if (request.isUserInRole("ROLE_USER")) {
                return "redirect:mypage";
            } else if (request.isUserInRole("ROLE_ADMIN")) {
                return "redirect:mypage?id=" + user.getID();
            }
        }
        return "redirect:login";
    }

    //회원 탈퇴
    @GetMapping(value = "exit")
    public String exit(Model model, HttpServletRequest request, @RequestParam(value = "id", defaultValue = "0", required = false) int id) {
        if (request.isRequestedSessionIdValid()) {
            if (request.isUserInRole("ROLE_USER")) {
                userMapper.delete(AuthorizationService.getCurrentUser().getID());
                return "redirect:login";
            } else if (request.isUserInRole("ROLE_ADMIN")) {
                System.out.println(id);
                userMapper.delete(id);
                return "redirect:management";
            }
        }
        return "redirect:login";
    }

}
