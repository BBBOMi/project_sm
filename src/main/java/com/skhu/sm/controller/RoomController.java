package com.skhu.sm.controller;

import com.skhu.sm.dto.Apply;
import com.skhu.sm.dto.Board;
import com.skhu.sm.mapper.BoardMapper;
import com.skhu.sm.mapper.MentoringMapper;
import com.skhu.sm.mapper.ReportMapper;
import com.skhu.sm.mapper.UserMapper;
import com.skhu.sm.services.AuthorizationService;
import com.skhu.sm.services.FileUploadService;
import com.skhu.sm.services.MentoringService;
import com.skhu.sm.services.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

/**
 * Created by ds on 2017-11-28.
 */
@Controller
public class RoomController {

    @Autowired
    BoardMapper boardMapper;

    @Autowired
    MentoringService mentoringService;

    @Autowired
    ReportService reportService;

    @Autowired
    FileUploadService fileUploadService;


    //글쓰기 페이지 불러오기
    @GetMapping(value = "post")
    public String post(Model model, HttpServletRequest request, @RequestParam(value = "m_id", defaultValue = "0", required = false) int m_id, @RequestParam(value = "b_id", defaultValue = "0", required = false) int b_id) {
        if(request.isRequestedSessionIdValid()) {
            if(b_id != 0) {
                model.addAttribute("board", boardMapper.findByBid(b_id));
            } else {
                model.addAttribute("board", new Board());
            }
            return "user/mentoring/post";
        }
        return "redirect:login";
    }

    //글쓰기
    @PostMapping(value = "post")
    public String posting(Model model, HttpServletRequest request, Board board, @RequestParam(value = "m_id", defaultValue = "0", required = false) int m_id) throws IOException {
        if(request.isRequestedSessionIdValid()) {
            String url = fileUploadService.upload(board.getB_file());
            board.setB_fileUrl(url);
            if(board.getB_id() != 0) {
                if(board.getB_fileUrl() == null) {
                    boardMapper.updateContents1(board);
                }else {
                    boardMapper.updateContents(board);
                }
                return "redirect:view?b_id=" + board.getB_id();
            }else {
                board.setB_writer(AuthorizationService.getCurrentUser().getID());
                board.setM_id(m_id);
                boardMapper.insert(board);
                return "redirect:mymentoring?m_id=" + m_id;
            }
        }
        return "redirect:login";
    }

    //글 세부 보기
    @GetMapping(value = "view")
    public String postView(Model model, HttpServletRequest request, @RequestParam(value = "b_id", defaultValue = "0", required = false) int b_id) {
        if(request.isRequestedSessionIdValid()) {
            model.addAttribute("board", boardMapper.findByBid(b_id));
            if(mentoringService.isMine(AuthorizationService.getCurrentUser().getID(), b_id)) {
                model.addAttribute("mento", true);
            }else {
                model.addAttribute("mento", false);
            }
            return "user/mentoring/post-view";
        }
        return "redirect:login";
    }

    //글 삭제
    @GetMapping(value = "post-drop")
    public String postdrop(Model model, HttpServletRequest request, @RequestParam(value = "b_id", defaultValue = "0", required = false) int b_id, @RequestParam(value = "m_id", defaultValue = "0", required = false) int m_id) {
        if(request.isRequestedSessionIdValid()) {
            boardMapper.delete(b_id);
            return "redirect:mymentoring?m_id=" + m_id;
        }
        return "redirect:login";
    }

    //내 멘토방 가기
    @GetMapping(value = "mymentoring")
    public String myMentoring(Model model, HttpServletRequest request, @RequestParam(value = "m_id", defaultValue = "0", required = false) int m_id) {
        if(request.isRequestedSessionIdValid()) {
            if(mentoringService.checkMento(AuthorizationService.getCurrentUser().getID(), m_id)) {
                model.addAttribute("mento", true);
            }else {
                model.addAttribute("mento", false);
            }
            model.addAttribute("mentoring", m_id);
            model.addAttribute("mentee", reportService.findMenteeList(m_id));
            model.addAttribute("board", mentoringService.boardList(m_id));
            model.addAttribute("report", mentoringService.reportsList(m_id));
            return "user/mentoring/myMentoring";
        }
        return "redirect:login";
    }

    //내 멘토링 목록 확인
    @GetMapping(value = "mentoring-list")
    public String mentoringList(Model model, HttpServletRequest request) {
        if(request.isRequestedSessionIdValid()) {
            List<Apply> list = mentoringService.mentoringList(AuthorizationService.getCurrentUser().getID());
            if(list.size() == 0) {
                return "redirect:mentolist";
            }else if(list.size() == 1) {
                return "redirect:mymentoring?m_id=" + list.get(0).getM_id();
            }
            else {
                model.addAttribute("apply", list);
                return "user/mentoring/mentoring-list";
            }
        }
        return "redirect:login";
    }

}
