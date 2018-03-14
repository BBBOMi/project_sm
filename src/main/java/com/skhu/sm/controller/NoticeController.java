package com.skhu.sm.controller;

import com.skhu.sm.dto.Notice;
import com.skhu.sm.mapper.NoticeMapper;
import com.skhu.sm.model.Pagination;
import com.skhu.sm.services.AuthorizationService;
import com.skhu.sm.services.FileUploadService;
import com.skhu.sm.services.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

/**
 * Created by ds on 2017-11-13.
 */

@Controller
public class NoticeController {

    @Autowired
    NoticeMapper noticeMapper;

    @Autowired
    NoticeService noticeService;

    @Autowired
    FileUploadService fileUploadService;

    //공지사항
    @GetMapping(value = "notice")
    public String notice(Model model, HttpServletRequest request, Pagination pagination) {
        if (request.isRequestedSessionIdValid()) {
            System.out.println(pagination.toString());
            model.addAttribute("notices", noticeService.findAll(pagination));
            return "user/notice/notice";
        }
        return "redirect:login";
    }

    //공지사항 세부 보기
    @GetMapping(value = "notice-view")
    public String noticeView(Model model, HttpServletRequest request, @RequestParam(value = "id", defaultValue = "0", required = false) int n_id) {
        if (request.isRequestedSessionIdValid()) {
            if (n_id != 0) {
                Notice notice = noticeMapper.findById(n_id);
                model.addAttribute("notice", notice);
            } else {
                model.addAttribute("notice", new Notice());
            }
            return "user/notice/notice-view";
        }
        return "redirect:login";
    }

    //글쓰기 페이지 조회
    @Secured("ROLE_ADMIN")
    @GetMapping(value = "notice-post")
    public String post(Model model, HttpServletRequest request, @RequestParam(value = "id", defaultValue = "0", required = false) int n_id) {
        if(request.isRequestedSessionIdValid()) {
            if(n_id != 0) {
                model.addAttribute("notice", noticeMapper.findById(n_id));
            }else {
                model.addAttribute("notice", new Notice());
            }
            return "user/notice/post";
        }
        return "redirect:login";
    }

    //글쓰기 및 수정
    @Secured("ROLE_ADMIN")
    @PostMapping(value = "notice-post")
    public String post(Model model, HttpServletRequest request, Notice notice) throws IOException {
        if(request.isRequestedSessionIdValid()) {
            String url = fileUploadService.upload(notice.getN_file());
            notice.setN_fileUrl(url);
            if(notice.getN_id() != 0) {
                noticeMapper.update(notice);
            }else {
                notice.setID(AuthorizationService.getCurrentUser().getID());
                noticeMapper.insert(notice);
            }
            return "redirect:notice-view?id=" + notice.getN_id();
        }
        return "redirect:login";
    }

    //삭제
    @GetMapping(value = "notice-drop")
    public String delete(Model model, HttpServletRequest request, @RequestParam(value = "id", defaultValue = "0", required = false) int n_id) {
        if(request.isRequestedSessionIdValid()) {
            noticeMapper.delete(n_id);
            return "redirect:notice";
        }
        return "redirect:login";
    }
}
