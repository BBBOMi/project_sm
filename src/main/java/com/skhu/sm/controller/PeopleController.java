package com.skhu.sm.controller;

import com.skhu.sm.dto.Keyword;
import com.skhu.sm.dto.User;
import com.skhu.sm.mapper.UserMapper;
import com.skhu.sm.services.ExcelService;
import com.skhu.sm.services.FileUploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

/**
 * Created by ds on 2017-11-06.
 */

@Controller
public class PeopleController {

    @Autowired
    UserMapper userMapper;

    @Autowired
    FileUploadService fileUploadService;

    @Autowired
    ExcelService excelService;

    //검색 페이지
    @Secured("ROLE_ADMIN")
    @GetMapping("all-search")
    public String allSearch(Model model, HttpServletRequest request) {
        if (request.isRequestedSessionIdValid()) {
            return "user/people/all-search";
        }
        return "redirect:login";
    }

    // @RequestParam(value = "keyword", defaultValue = "", required = false) String name

    //검색 결과
    @Secured("ROLE_ADMIN")
    @PostMapping("all-search")
    public String allSearchResult(Model model, HttpServletRequest request, String keyword) {
        if (request.isRequestedSessionIdValid()) {
            List<User> user = userMapper.findByName(keyword);
            List<User> mento = userMapper.findByMentoName(keyword);
            List<User> mentee = userMapper.findByMenteeName(keyword);
            model.addAttribute("user", user);
            model.addAttribute("mento", mento);
            model.addAttribute("mentee", mentee);
            return "user/people/all-search";
        }
        return "redirect:login";
    }

    //회원 명단
    @Secured("ROLE_ADMIN")
    @GetMapping("management")
    public String management(Model model, HttpServletRequest request) {
        if (request.isRequestedSessionIdValid()) {
            List<User> users = userMapper.findAll();
            model.addAttribute("users", users);
            return "user/people/management";
        }
        return "redirect:login";
    }

    //엑셀 파일 업로드 GET
    @Secured("ROLE_ADMIN")
    @GetMapping("upload")
    public String upload(HttpServletRequest request) {
        if (request.isRequestedSessionIdValid()) {
            return "user/people/upload";
        }
        return "redirect:login";
    }

    //엑셀 파일 업로드 POST
    @Secured("ROLE_ADMIN")
    @PostMapping("upload")
    public String uploading(Model model, HttpServletRequest request) throws IOException {
        if (request.isRequestedSessionIdValid()) {
            MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest) request;
            MultipartFile file = mhsr.getFile(mhsr.getFileNames().next());
            List<User> users = excelService.excelUpload(file);
            model.addAttribute("users", users);
            return "user/people/upload";
        }
        return "redirect:login";
    }

}
