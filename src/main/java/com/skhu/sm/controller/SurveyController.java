package com.skhu.sm.controller;

import com.skhu.sm.dto.*;
import com.skhu.sm.services.AuthorizationService;
import com.skhu.sm.services.SettingService;
import com.skhu.sm.services.SurveyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by ds on 2017-10-26.
 */
@Controller
public class SurveyController {

    @Autowired
    SurveyService surveyService;

    @Autowired
    SettingService settingService;

    //설문조사 메인 페이지
    @GetMapping(value = "survey")
    public String survey(Model model, HttpServletRequest request) {
        if(request.isRequestedSessionIdValid()) {
            if(request.isUserInRole("ROLE_USER")) {
                if(settingService.checkSurveyRegister()) {
                    return "user/survey/survey";
                }else {
                    model.addAttribute("error", "설문조사 기간이 아닙니다.");
                    return "user/work/error";
                }
            }else if(request.isUserInRole("ROLE_ADMIN")){
                return "user/survey/survey-admin";
            }
        }
        return "redirect:login";
    }

    //설문조사 리스트
    @Secured("ROLE_USER")
    @GetMapping(value = "mento-survey-list")
    public String surveyList1(Model model, HttpServletRequest request) {
        if(request.isRequestedSessionIdValid()) {
            model.addAttribute("apply", surveyService.SurveyList1(AuthorizationService.getCurrentUser().getID()));
            return "user/survey/mento-survey-list";
        }
        return "redirect:login";
    }

    //설문조사 리스트
    @Secured("ROLE_USER")
    @GetMapping(value = "mentee-survey-list")
    public String surveyList2(Model model, HttpServletRequest request) {
        if(request.isRequestedSessionIdValid()) {
            model.addAttribute("apply", surveyService.SurveyList2(AuthorizationService.getCurrentUser().getID()));
            return "user/survey/mentee-survey-list";
        }
        return "redirect:login";
    }

    //멘토 설문조사 항목
    @GetMapping(value = "mento-survey")
    public String mentoSurveyList(Model model, HttpServletRequest request) {
        if(request.isRequestedSessionIdValid()) {
            model.addAttribute("s1", surveyService.mentoSurveyList());
            return "user/survey/mento-survey";
        }
        return "redirect:login";
    }

    //멘토 설문조사
    @PostMapping(value = "mento-survey")
    public String mentoSurvey(Model model, HttpServletRequest request, MentoSurveyResult mentoSurveyResult, @RequestParam(value = "m_id", defaultValue = "0", required = false) int m_id) {
        if(request.isRequestedSessionIdValid()) {
            surveyService.mentoSurvey(mentoSurveyResult.getMentoSurveyResultList(), m_id, AuthorizationService.getCurrentUser().getID());
            return "redirect:mento-survey-list";
        }
        return "redirect:login";
    }

    //멘티 설문조사 항목
    @GetMapping(value = "mentee-survey")
    public String menteeSurveyList(Model model, HttpServletRequest request) {
        if(request.isRequestedSessionIdValid()) {
            model.addAttribute("s2", surveyService.menteeSurveyList());
            return "user/survey/mentee-survey";
        }
        return "redirect:login";
    }

    //멘티 설문조사
    @PostMapping(value = "mentee-survey")
    public String menteeSurvey(Model model, HttpServletRequest request, MenteeSurveyResult menteeSurveyResult, @RequestParam(value = "m_id", defaultValue = "0", required = false) int m_id) {
        if(request.isRequestedSessionIdValid()) {
            surveyService.menteeSurvey(menteeSurveyResult.getMenteeSurveyResultList(), m_id, AuthorizationService.getCurrentUser().getID());
            return "redirect:mentee-survey-list";
        }
        return "redirect:login";
    }

    //멘티 설문조사 결과
    @GetMapping(value = "mentee-result")
    public String menteeResult(Model model, HttpServletRequest request) {
        if(request.isRequestedSessionIdValid()) {
            model.addAttribute("percent", surveyService.menteeSurveyPercent());
            model.addAttribute("result", surveyService.menteeSurveyResult());
            return "user/survey/mentee-survey-result";
        }
        return "redirect:login";
    }

    //멘토 설문조사 결과
    @GetMapping(value = "mento-result")
    public String mentoResult(Model model, HttpServletRequest request) {
        if(request.isRequestedSessionIdValid()) {
            model.addAttribute("percent", surveyService.mentoSurveyPercent());
            model.addAttribute("result", surveyService.mentoSurveyResult());
            return "user/survey/mento-survey-result";
        }
        return "redirect:login";
    }

    //멘토 설문조사 항목 변경 페이지
    @GetMapping(value = "mento-change")
    public String mentoChange(Model model, HttpServletRequest request) {
        if(request.isRequestedSessionIdValid()) {
            model.addAttribute("s1", surveyService.mentoSurveyList());
            return "user/survey/mento-survey-change";
        }
        return "redirect:login";
    }

    //멘토 설문조사 항목 변경
    @PostMapping(value = "mento-change")
    public String mentoChangeValue(Model model, HttpServletRequest request, MentoSurvey mentoSurveys, String[] s1_title) {
        if(request.isRequestedSessionIdValid()) {
            surveyService.mentoSurveyListChange(mentoSurveys.getMentoSurveyList(), s1_title);
            return "redirect:mento-change";
        }
        return "redirect:login";
    }

    //멘티 설문조사 항목 변경 페이지
    @GetMapping(value = "mentee-change")
    public String menteeChange(Model model, HttpServletRequest request) {
        if(request.isRequestedSessionIdValid()) {
            model.addAttribute("s2", surveyService.menteeSurveyList());
            return "user/survey/mentee-survey-change";
        }
        return "redirect:login";
    }

    //멘토 설문조사 항목 변경
    @PostMapping(value = "mentee-change")
    public String menteeChangeValue(Model model, HttpServletRequest request, MenteeSurvey menteeSurveys, String[] s2_title) {
        if(request.isRequestedSessionIdValid()) {
            surveyService.menteeSurveyListChange(menteeSurveys.getMenteeSurveyList(), s2_title);
            return "redirect:mentee-change";
        }
        return "redirect:login";
    }
}
