package com.skhu.sm.controller;

import com.skhu.sm.dto.Apply;
import com.skhu.sm.dto.Mentolist;
import com.skhu.sm.dto.Mentoring;
import com.skhu.sm.dto.User;
import com.skhu.sm.mapper.ApplyMapper;
import com.skhu.sm.mapper.MentoringMapper;
import com.skhu.sm.mapper.UserMapper;
import com.skhu.sm.services.ApplyService;
import com.skhu.sm.services.AuthorizationService;
import com.skhu.sm.services.FileUploadService;
import com.skhu.sm.services.SettingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by ds on 2017-11-12.
 */
@Controller
public class ApplyComtroller {

    @Autowired
    ApplyMapper applyMapper;

    @Autowired
    MentoringMapper mentoringMapper;

    @Autowired
    UserMapper userMapper;

    @Autowired
    SettingService settingService;

    @Autowired
    FileUploadService fileUploadService;

    @Autowired
    ApplyService applyService;

    //멘토 신청서 목록
    @Secured("ROLE_USER")
    @GetMapping(value = "apply-list")
    public String applyList(Model model, HttpServletRequest request) {
        if (request.isRequestedSessionIdValid()) {
            ArrayList<Apply> apply = applyMapper.findById(AuthorizationService.getCurrentUser().getID());
            if (apply.size() == 0) {
                return "redirect:apply";
            }
            model.addAttribute("apply", apply);
            return "user/apply/apply-list";
        }
        return "redirect:login";
    }

    //멘토 신청서 작성 GET
    @Secured("ROLE_USER")
    @GetMapping(value = "apply")
    public String apply(Model model, HttpServletRequest request, @RequestParam(value = "a_id", defaultValue = "0", required = false) int a_id) {
        if (request.isRequestedSessionIdValid()) {
            if(settingService.checkMentoRegister()) {
                if (a_id != 0) {
                    model.addAttribute("apply", applyMapper.findOne(a_id));
                } else {
                    model.addAttribute("apply", new Apply());
                }
                model.addAttribute("user", AuthorizationService.getCurrentUser());
                return "user/apply/apply";
            }else {
                model.addAttribute("error", "멘토 신청 기간이 아닙니다.");
                return "user/work/error";
            }
        }
        return "redirect:login";
    }

    //멘토 신청서 작성 및 수정
    @Secured("ROLE_USER")
    @PostMapping(value = "apply")
    public String apply(HttpServletRequest request, Apply apply) throws IOException {
        if (request.isRequestedSessionIdValid()) {
            String url = fileUploadService.upload(apply.getA_file());
            apply.setA_fileUrl(url);
            if(apply.getA_id() != 0) {
                applyMapper.updateContents(apply);
            }else {
                apply.setID(AuthorizationService.getCurrentUser().getID());
                applyMapper.insert(apply);
            }
            return "redirect:apply-list";
        }
        return "redirect:login";
    }

    //멘토 신청자 리스트
    @Secured("ROLE_ADMIN")
    @GetMapping(value = "mento-list")
    public String mentoList(Model model, HttpServletRequest request) {
        if (request.isRequestedSessionIdValid()) {
            List<Mentolist> mentolist = applyMapper.findList();
            model.addAttribute("apply", mentolist);
            return "user/apply/apply-mento-list";
        }
        return "redirect:login";
    }


    //멘토 신청자 리스트
    @Secured("ROLE_ADMIN")
    @PostMapping(value = "mento-list")
    public String mentoListAdmin(HttpServletRequest request, String button, int a_id, int id) {
        if (request.isRequestedSessionIdValid()) {
            if (button.equals("승인")) {
                System.out.println(a_id);
                System.out.println(id);
                applyService.applyConfirm(1, a_id, id);
            } else {
                applyService.applyConfirm(2, a_id, id);
            }
            return "redirect:mento-list";
        }
        return "redirect:login";
    }

    //멘토 신청서 삭제
    @GetMapping(value = "apply-drop")
    public String applyDrop(HttpServletRequest request, @RequestParam(value = "a_id", defaultValue = "0", required = false) int a_id) {
        if(request.isRequestedSessionIdValid()) {
            applyMapper.delete(a_id);
            return "redirect:apply-list";
        }
        return "redirect:login";
    }
}
