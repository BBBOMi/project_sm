package com.skhu.sm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.skhu.sm.services.MentoringService;
import com.skhu.sm.services.SettingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.amazonaws.util.StringUtils;
import com.skhu.sm.dto.Mentolist;
import com.skhu.sm.mapper.MentoringMapper;
import com.skhu.sm.services.AuthorizationService;

/**
 * Created by ds on 2017-10-26.
 */
@Controller
public class MentoringController {

    @Autowired
    MentoringMapper mentoringMapper;

    @Autowired
    MentoringService mentoringService;

    @Autowired
    SettingService settingService;

    //멘토 명단 호출
    @GetMapping(value = "mentolist")
    public String mentolist(Model model, HttpServletRequest request,@RequestParam(value ="keyWord" , required= false) String keyWord) {
        if(request.isRequestedSessionIdValid()) {
            List<Mentolist> mentolist = new ArrayList<>();
            if(!StringUtils.isNullOrEmpty(keyWord)) {
                mentolist = mentoringMapper.findByName(keyWord);
            }else {
                mentolist = mentoringMapper.showList();
            }
            model.addAttribute("apply", mentolist);
            return "user/mentoring/mentolist";
        }
        return "redirect:login";
    }


    @PostMapping(value = "mentolist")
    public String showMentoring(Model model, HttpServletRequest request, String button, int a_id) {
        if(request.isRequestedSessionIdValid()) {
            if("자세히보기".equals(button)) {
                return "redirect:mentoringinfo?a_id=" + a_id;
            }
        }
        return "redirect:login";
    }

    @GetMapping(value = "mentoringinfo")
    public String mentoringInfo(Model model, HttpServletRequest request, @RequestParam(value = "a_id") int a_id) {
        if(request.isRequestedSessionIdValid()) {
            Mentolist mentolist = mentoringMapper.showApply(a_id);
            model.addAttribute("mentolist", mentolist);
            int count = mentoringMapper.showCount(a_id);
            int percent = (int)((double)count / (double)mentolist.getA_num() * 100.0);
            model.addAttribute("percent", percent);
            model.addAttribute("check", mentoringService.check(a_id, AuthorizationService.getCurrentUser().getID()));
            return "user/mentoring/mentoringinfo";
        }
        return "redirect:login";
    }

    @PostMapping(value = "mentoringinfo")
    public String applyMentoring(Model model, HttpServletRequest request, String button, int a_id) {
        if(request.isRequestedSessionIdValid()) {
            if(settingService.checkMenteeRegister()) {
                if("신청하기".equals(button)) {
                    int m_id = mentoringMapper.checkM_id(a_id);
                    int ID = AuthorizationService.getCurrentUser().getID();
                    mentoringMapper.mentee(m_id, ID);
                }
                return "redirect:mentoringinfo?a_id=" + a_id;
            }else {
                model.addAttribute("error", "멘티 신청 기간이 아닙니다.");
                return "user/work/error";
            }
        }
        return "redirect:login";
    }

}
