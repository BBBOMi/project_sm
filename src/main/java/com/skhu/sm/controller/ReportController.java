package com.skhu.sm.controller;

import com.skhu.sm.dto.Report;
import com.skhu.sm.mapper.ReportMapper;
import com.skhu.sm.services.AuthorizationService;
import com.skhu.sm.services.FileUploadService;
import com.skhu.sm.services.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * Created by ds on 2017-11-28.
 */

@Controller
public class ReportController {

    @Autowired
    ReportMapper reportMapper;

    @Autowired
    ReportService reportService;

    @Autowired
    FileUploadService fileUploadService;

    //보고서 작성 폼
    @GetMapping(value = "report")
    public String report(Model model, HttpServletRequest request, @RequestParam(value = "m_id", defaultValue = "0", required = false) int m_id, @RequestParam(value = "r_id", defaultValue = "0", required = false) int r_id) {
        if(request.isRequestedSessionIdValid()) {
            if(r_id == 0) {
                model.addAttribute("user", AuthorizationService.getCurrentUser());
                model.addAttribute("mentee", reportService.findMenteeList(m_id));
                model.addAttribute("report", new Report());
            }else {
                model.addAttribute("user", AuthorizationService.getCurrentUser());
                model.addAttribute("mentee", reportService.findMenteeList(m_id));
                model.addAttribute("report", reportMapper.findByRid(r_id));
            }
            return "user/mentoring/report";
        }
        return "redirect:login";
    }

    //보고서 작성 및 수정, 삭제
    @PostMapping(value = "report")
    public String reporting(Model model, HttpServletRequest request, Report report, String button, @RequestParam(value = "m_id", defaultValue = "0", required = false) int m_id) throws IOException {
        if(request.isRequestedSessionIdValid()) {
            String url = fileUploadService.upload(report.getR_photo());
            //삭제
            if("delete".equals(button)) {
                reportMapper.delete(report.getR_id());
                return "redirect:mymentoring?m_id=" + m_id;
            }
            //보고서 작성
            else if(report.getR_id() == 0) {
                report.setR_photoUrl(url);
                report.setR_writer(AuthorizationService.getCurrentUser().getID());
                report.setM_id(m_id);
                reportMapper.insert(report);
                return "redirect:mymentoring?m_id=" + m_id;
            }
            //보고서 수정
            else {
                if(url == null) {
                    reportMapper.updateContents2(report);
                }else {
                    report.setR_photoUrl(url);
                    reportMapper.updateContents1(report);
                }
                return "redirect:report?r_id=" + report.getR_id();
            }
        }
        return "redirect:login";
    }

    //관리자 보고서 확인
    @GetMapping(value = "report-view")
    public String reportView(Model model, HttpServletRequest request, @RequestParam(value = "r_id", defaultValue = "0", required = false) int r_id) {
        if(request.isRequestedSessionIdValid()) {
            model.addAttribute("user", AuthorizationService.getCurrentUser());
            model.addAttribute("mentee", reportService.findMenteeListRid(r_id));
            model.addAttribute("report", reportMapper.findByRid(r_id));
            return "user/mentoring/report-view";
        }
        return "redirect:login";
    }

    //관리자 보고서 확인/반려
    @PostMapping(value = "report-view")
    public String reportConfirm(Model model, HttpServletRequest request, String button, Report report, @RequestParam(value = "r_id", defaultValue = "0", required = false) int r_id) {
        if(request.isRequestedSessionIdValid()) {
            if(button.equals("download")) {
                return "redirect:report-download?r_id=" + r_id;
            }
            if(reportService.reportConfirm(button, report, r_id)) {
                return "redirect:report-management";
            }else {
                return "redirect:report-view?r_id=" + r_id;
            }
        }
        return "redirect:login";
    }


    //보고서 다운로드
    @GetMapping(value = "report-download")
    public String reportView2(Model model, HttpServletRequest request, @RequestParam(value = "r_id", defaultValue = "0", required = false) int r_id) {
        if(request.isRequestedSessionIdValid()) {
            model.addAttribute("user", AuthorizationService.getCurrentUser());
            model.addAttribute("mentee", reportService.findMenteeListRid(r_id));
            model.addAttribute("report", reportMapper.findByRid(r_id));
            return "user/mentoring/report-download";
        }
        return "redirect:login";
    }
}
