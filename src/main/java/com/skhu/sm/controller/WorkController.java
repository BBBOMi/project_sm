package com.skhu.sm.controller;

import com.skhu.sm.dto.Keyword;
import com.skhu.sm.dto.Setting;
import com.skhu.sm.mapper.ReportMapper;
import com.skhu.sm.model.Pagination;
import com.skhu.sm.services.MentoringService;
import com.skhu.sm.services.ReportService;
import com.skhu.sm.services.SettingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * Created by ds on 2017-11-30.
 */

@Controller
public class WorkController {

    @Autowired
    ReportMapper reportMapper;

    @Autowired
    ReportService reportService;

    @Autowired
    MentoringService mentoringService;

    @Autowired
    SettingService settingService;

    //멘토링 관리 페이지
    @Secured("ROLE_ADMIN")
    @GetMapping(value = "mentoring-management")
    public String mentoringManagementView(Model model, HttpServletRequest request) {
        if (request.isRequestedSessionIdValid()) {
            model.addAttribute("mentolist", mentoringService.MentoringList());
            return "user/work/mentoring-management";
        }
        return "redirect:login";
    }

    //해당 멘토링 페이지로 이동
    @Secured("ROLE_ADMIN")
    @PostMapping(value = "mentoring-management")
    public String mentoringManagement(Model model, HttpServletRequest request) {
        if (request.isRequestedSessionIdValid()) {
            return "user/work/mentoring-management";
        }
        return "redirect:login";
    }

    //보고서 관리
    @Secured("ROLE_ADMIN")
    @GetMapping(value = "report-management")
    public String reportManagementView(Model model, HttpServletRequest request, Pagination pagination, @RequestParam(value = "week", defaultValue = "0", required = false) int week, @RequestParam(value = "keyWord", required = false) String keyWord, @RequestParam(value = "tab_id", required=false) String tab_id) {
        if (request.isRequestedSessionIdValid()) {
            System.out.println(pagination.toString());
            if(week != 0) {
                model.addAttribute("report2", reportService.findByWeeks(week));
            }else {
                if(keyWord!=null) {
                    System.out.println(keyWord);
                    model.addAttribute("report2",reportMapper.searchReport(keyWord));
                }else {
                    model.addAttribute("report2", reportService.findAll2(pagination));
                }
            }
            model.addAttribute("week",0);
            model.addAttribute("years",0);
            String temp = tab_id;
            if(week==0) {
                model.addAttribute("wholePanel","active");
                model.addAttribute("weeksPanel","");
            }else {
                model.addAttribute("wholePanel","");
                model.addAttribute("weeksPanel","active");
            }
            model.addAttribute("mentorsPanel","");
            model.addAttribute("yearsPanel","");
            model.addAttribute("report1", reportService.findAll2(pagination));
            model.addAttribute("report3", reportService.findAll2(pagination));
            model.addAttribute("report4",reportService.findAll2(pagination));
            return "user/work/report-management";
        }
        return "redirect:login";
    }

    //보고서 관리
    @Secured("ROLE_ADMIN")
    @PostMapping(value = "report-management")
    public String reportManagement(Model model, HttpServletRequest request, Keyword keyWord) {
        if (request.isRequestedSessionIdValid()) {

            String temp = keyWord.getTab_id();
            model.addAttribute("report1", reportService.findAll());
            model.addAttribute("report2", reportService.findAll());
            model.addAttribute("report3", reportService.findAll());
            model.addAttribute("report4", reportService.findAll());

            if(temp.equals("wholesPanel")){//전체
                model.addAttribute("report1", reportMapper.searchReport(keyWord.getKeyWord()));
                model.addAttribute("wholePanel","active");
            }
            if(temp.equals("weeksPanel")){//주차별
                model.addAttribute("report2",reportMapper.selectByWeeksAndKeyWord(keyWord.getWeek(),keyWord.getKeyWord()));
                model.addAttribute("weeksPanel","active");
            }

            if(temp.equals("mentorsPanel")){//멘토별
                model.addAttribute("report3", reportMapper.searchReport(keyWord.getKeyWord()));
                model.addAttribute("mentorsPanel","active");
            }

            if(temp.equals("yearsPanel")){//년차별
                model.addAttribute("report4",reportMapper.selectByYearsAndKeyWord(keyWord.getYears(), reportService.endDay(keyWord.getYears())));
                model.addAttribute("yearsPanel","active");
            }
            model.addAttribute("week",keyWord.getWeek());
            model.addAttribute("year",keyWord.getYears());
            return "user/work/report-management";
        }
        return "redirect:login";
    }


    //신청기간
    @Secured("ROLE_ADMIN")
    @GetMapping(value = "setting")
    public String notice(Model model, HttpServletRequest request) {
        if (request.isRequestedSessionIdValid()) {
            model.addAttribute("setting", settingService.selectTerm());
            return "user/work/setting";
        }
        return "redirect:login";
    }

    //신청기간 수정
    @Secured("ROLE_ADMIN")
    @PostMapping(value = "setting")
    public String noticeSettion(Model model, HttpServletRequest request, Setting setting) {
        if (request.isRequestedSessionIdValid()) {
            settingService.updateTerm(setting);
            return "redirect:setting";
        }
        return "redirect:login";
    }
}
